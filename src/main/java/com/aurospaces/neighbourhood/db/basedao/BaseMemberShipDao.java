
package com.aurospaces.neighbourhood.db.basedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.MemberShipBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseMemberShipDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	 
	public final String INSERT_SQL = "INSERT INTO package( created_time, updated_time, name, price, duration,duration_type, description, status,allowed_messages_limit,allowed_profiles_limit,highlight_profile,chat_allowed,horoscope_view,Astrology_match) values (?,?,?,?,?,?,?,?,?, ?,?,?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final MemberShipBean objMember) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(objMember.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(objMember.getCreatedTime() == null)
					{
						objMember.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(objMember.getCreatedTime().getTime()); 
							
					if(objMember.getUpdatedTime() == null)
					{
						objMember.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(objMember.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
	ps.setTimestamp(2, updatedTime);
	ps.setString(3, objMember.getName());
	ps.setDouble(4, objMember.getPrice());
	ps.setInt   (5, objMember.getDuration());
	ps.setString(6, objMember.getDuration_type());
	ps.setString(7, objMember.getDescription());
	ps.setString(8, objMember.getStatus());
	ps.setString(9, objMember.getAllowed_messages_limit());
	ps.setString(10, objMember.getAllowed_profiles_limit());
	ps.setString(11, objMember.getHighlight_profile());
	ps.setString(12, objMember.getChat_allowed());
	ps.setString(13, objMember.getHoroscope_view());
	ps.setString(14, objMember.getAstrology_match());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				objMember.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE package set name = ?, price=?, duration=?,duration_type=?, description=?, status = ? allowed_messages_limit=?,allowed_profiles_limit=?,highlight_profile=?,chat_allowed=?,horoscope_view=?,Astrology_match =? where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{objMember.getName(),objMember.getPrice(),objMember.getDuration(),objMember.getDuration_type(),objMember.getDescription(),objMember.getStatus(),objMember.getAllowed_messages_limit(),objMember.getAllowed_profiles_limit(),objMember.getHighlight_profile(),objMember.getChat_allowed(),objMember.getHoroscope_view(),objMember.getAstrology_match(),objMember.getId()});
		}
	}
		
		@Transactional
		public boolean delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			boolean delete = false;
			try{
				String sql = "DELETE FROM package WHERE id=?";
				int intDelete = jdbcTemplate.update(sql, new Object[]{id});
				if(intDelete != 0){
					delete = true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return delete;
		}
		

	 public MemberShipBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from package where id = ?";
			List<MemberShipBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(MemberShipBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	

	

}
