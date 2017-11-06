
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


import com.aurospaces.neighbourhood.bean.DoshamBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseDoshamDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	 
	public final String INSERT_SQL = "INSERT INTO dosham ( created_time, updated_time, name,status) values (?, ?, ?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final DoshamBean objDoshamBean) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
		if(objDoshamBean.getUpdatedTime() == null)
		{
			objDoshamBean.setUpdatedTime( new Date());
		}
		final java.sql.Timestamp updatedTime = 
				new java.sql.Timestamp(objDoshamBean.getUpdatedTime().getTime()); 
	if(objDoshamBean.getId() == 0)	{
		
	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(objDoshamBean.getCreatedTime() == null)
					{
						objDoshamBean.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(objDoshamBean.getCreatedTime().getTime()); 
							
					
					
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
	ps.setTimestamp(2, updatedTime);
	ps.setString(3, objDoshamBean.getName());
	ps.setString(4, objDoshamBean.getStatus());
	

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				objDoshamBean.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE dosham set updated_time = ? ,name = ?, status = ? where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{updatedTime,objDoshamBean.getName(),objDoshamBean.getStatus(),objDoshamBean.getId()});
		}
	}
		
		@Transactional
		public boolean delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			boolean delete = false;
			try{
				String sql = "DELETE FROM dosham WHERE id=?";
				int intDelete = jdbcTemplate.update(sql, new Object[]{id});
				if(intDelete != 0){
					delete = true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return delete;
		}
		

	 public DoshamBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from dosham where id = ?";
			List<DoshamBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(DoshamBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	

	

}
