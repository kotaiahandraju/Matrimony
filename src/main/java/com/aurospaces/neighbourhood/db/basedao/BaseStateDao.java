
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


import com.aurospaces.neighbourhood.bean.StateBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseStateDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	 
	public final String INSERT_SQL = "INSERT INTO state ( created_time, updated_time, name,status) values (?, ?, ?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final StateBean objStateBean) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
		if(objStateBean.getUpdatedTime() == null)
		{
			objStateBean.setUpdatedTime( new Date());
		}
		final java.sql.Timestamp updatedTime = 
				new java.sql.Timestamp(objStateBean.getUpdatedTime().getTime()); 
	if(objStateBean.getId() == 0)	{
		
	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(objStateBean.getCreatedTime() == null)
					{
						objStateBean.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(objStateBean.getCreatedTime().getTime()); 
							
					
					
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
	ps.setTimestamp(2, updatedTime);
	ps.setString(3, objStateBean.getName());
	ps.setString(4, objStateBean.getStatus());
	

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				objStateBean.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE state set updated_time = ? ,name = ?, status = ? where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{updatedTime,objStateBean.getName(),objStateBean.getStatus(),objStateBean.getId()});
		}
	}
		
		@Transactional
		public boolean delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			boolean delete = false;
			try{
				String sql = "DELETE FROM state WHERE id=?";
				int intDelete = jdbcTemplate.update(sql, new Object[]{id});
				if(intDelete != 0){
					delete = true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return delete;
		}
		

	 public StateBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from state where id = ?";
			List<StateBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(StateBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	

	

}
