
package com.aurospaces.neighbourhood.db.basedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.poi.util.SystemOutLogger;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.bean.UserImagesBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseUserImageUploadDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	@Autowired HttpSession session;
	 
	public final String INSERT_SQL = "INSERT INTO user_images ( user_id, image,  updated_on, status, approved_status) VALUES (?, ?, ?, ?, ? )"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final UserImagesBean objUserImagesBean) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
		
	if(objUserImagesBean.getId() == 0)	{
		final Date uDate = new Date();
		final DateTime updated_time = new DateTime(uDate);
	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(objUserImagesBean.getCreatedTime() == null)
					{
						objUserImagesBean.setCreatedTime( uDate);
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(objUserImagesBean.getCreatedTime().getTime()); 
							
					if(objUserImagesBean.getUpdated_on() == null)
					{
						objUserImagesBean.setUpdated_on( uDate);
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(objUserImagesBean.getUpdated_on().getTime()); 
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setString(1, objUserImagesBean.getUserId());
	ps.setString(2, objUserImagesBean.getImage());
	ps.setTimestamp(3, updatedTime);
	ps.setString(4, objUserImagesBean.getStatus());
	ps.setString(5, objUserImagesBean.getApprovedStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				objUserImagesBean.setId(unId.intValue());
				String update_qry = " update users set updated_time = '"+new java.sql.Timestamp(updated_time.getMillis())+"' where id = "+objUserImagesBean.getUserId()+" ";
				jdbcTemplate.update(update_qry);
				// set as profile pic if profile pic is not yet set 
				String picQry = "select count(*) from vuser_images where user_id = "+objUserImagesBean.getUserId()+" and status = '1' and is_profile_picture = '1'";
				int profile_pic_count = jdbcTemplate.queryForInt(picQry);
				if(profile_pic_count==0){
					picQry = "update user_images set is_profile_picture = '1' where id = "+objUserImagesBean.getId();
					int updated = jdbcTemplate.update(picQry);
					if(updated==1){
						picQry = "select image from vuser_images where user_id =  "+objUserImagesBean.getUserId()+" and is_profile_picture = '1' and status = '1'";
						String image = jdbcTemplate.queryForObject(picQry, String.class);
						UsersBean userSessionBean = (UsersBean)session.getAttribute("cacheGuest");
						userSessionBean.setProfileImage(image);
			    		session.setAttribute("cacheGuest",userSessionBean);
					}
				}
				
		}
		else
		{

			String sql = "UPDATE user_images SET user_id = ?, image = ?,  updated_on = ?, status = ? WHERE id=? ";
	
			jdbcTemplate.update(sql, new Object[]{objUserImagesBean.getUserId(),objUserImagesBean.getImage(),objUserImagesBean.getUpdated_on(),objUserImagesBean.getStatus(),objUserImagesBean.getId()});
		}
	}
		
		@Transactional
		public boolean delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			boolean delete = false;
			try{
				String sql = "DELETE FROM user_images WHERE id=?";
				int intDelete = jdbcTemplate.update(sql, new Object[]{id});
				if(intDelete != 0){
					delete = true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return delete;
		}
		

	 public BranchBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from user_images where id = ?";
			List<BranchBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	 public BranchBean getByUserId(String userId) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "select * from user_images where user_id = ? order by id desc limit 1 ";
			List<BranchBean> retlist = jdbcTemplate.query(sql,
			new Object[]{userId},
			ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	

	

}
