
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


import com.aurospaces.neighbourhood.bean.SalaryBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseSalaryDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	 
	public final String INSERT_SQL = "INSERT INTO salary ( created_time, updated_time, name,status) values (?, ?, ?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final SalaryBean objSalaryBean) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
		if(objSalaryBean.getUpdatedTime() == null)
		{
			objSalaryBean.setUpdatedTime( new Date());
		}
		final java.sql.Timestamp updatedTime = 
				new java.sql.Timestamp(objSalaryBean.getUpdatedTime().getTime()); 
	if(objSalaryBean.getId() == 0)	{
		
	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(objSalaryBean.getCreatedTime() == null)
					{
						objSalaryBean.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(objSalaryBean.getCreatedTime().getTime()); 
							
					
					
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
	ps.setTimestamp(2, updatedTime);
	ps.setString(3, objSalaryBean.getName());
	ps.setString(4, objSalaryBean.getStatus());
	

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				objSalaryBean.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE salary set updated_time = ? ,name = ?, status = ? where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{updatedTime,objSalaryBean.getName(),objSalaryBean.getStatus(),objSalaryBean.getId()});
		}
	}
		
		@Transactional
		public boolean delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			boolean delete = false;
			try{
				String sql = "DELETE FROM salary WHERE id=?";
				int intDelete = jdbcTemplate.update(sql, new Object[]{id});
				if(intDelete != 0){
					delete = true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return delete;
		}
		

	 public SalaryBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from salary where id = ?";
			List<SalaryBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(SalaryBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	

	

}
