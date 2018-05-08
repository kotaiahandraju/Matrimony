
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

import com.aurospaces.neighbourhood.bean.CastBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseCastDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	 
	public final String INSERT_SQL = "INSERT INTO cast ( created_time, updated_time, name, status,religionId) values (?,?, ?, ?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final CastBean objCAST) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(objCAST.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(objCAST.getCreatedTime() == null)
					{
						objCAST.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(objCAST.getCreatedTime().getTime()); 
							
					if(objCAST.getUpdatedTime() == null)
					{
						objCAST.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(objCAST.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
	ps.setTimestamp(2, updatedTime);
	ps.setString(3, objCAST.getName());
	ps.setString(4, objCAST.getStatus());
	ps.setString(5, objCAST.getReligionId());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				objCAST.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE cast set name = ?,religionId=?,status = ? where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{objCAST.getName(),objCAST.getReligionId(),objCAST.getStatus(),objCAST.getId()});
		}
	}
		
		@Transactional
		public boolean delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			boolean delete = false;
			try{
				String sql = "DELETE FROM cast WHERE id=?";
				int intDelete = jdbcTemplate.update(sql, new Object[]{id});
				if(intDelete != 0){
					delete = true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return delete;
		}
		

	 public CastBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from cast where id = ?";
			List<CastBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(CastBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	

	

}
