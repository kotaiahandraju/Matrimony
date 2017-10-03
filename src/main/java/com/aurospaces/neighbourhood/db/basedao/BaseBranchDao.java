
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

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseBranchDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	 
	public final String INSERT_SQL = "INSERT INTO branch( created_time, updated_time, name, prefix, admin, premium, free, widow, sms_sender ,status) values (?, ?, ?,?,?,?,?,?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final BranchBean objBRANCH) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(objBRANCH.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(objBRANCH.getCreatedTime() == null)
					{
						objBRANCH.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(objBRANCH.getCreatedTime().getTime()); 
							
					if(objBRANCH.getUpdatedTime() == null)
					{
						objBRANCH.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(objBRANCH.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
	ps.setTimestamp(2, updatedTime);
	ps.setString(3, objBRANCH.getName());
	ps.setString(4, objBRANCH.getPrefix());
	ps.setString(5, objBRANCH.getAdmin());
	ps.setString(6, objBRANCH.getPremium());
	ps.setString(7, objBRANCH.getFree());
	ps.setString(8, objBRANCH.getWidow());
	ps.setString(9, objBRANCH.getSms_sender());
	ps.setString(10, objBRANCH.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				objBRANCH.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE branch set name = ?, prefix = ?, admin=?, premium = ?, free = ?, widow = ?, sms_sender = ?,status = ? where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{objBRANCH.getName(),objBRANCH.getPrefix(),objBRANCH.getAdmin(),objBRANCH.getPremium(),objBRANCH.getFree(),objBRANCH.getWidow(),objBRANCH.getSms_sender(),objBRANCH.getStatus(),objBRANCH.getId()});
		}
	}
		
		@Transactional
		public boolean delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			boolean delete = false;
			try{
				String sql = "DELETE FROM branch WHERE id=?";
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
			String sql = "SELECT * from branch where id = ?";
			List<BranchBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	

	

}
