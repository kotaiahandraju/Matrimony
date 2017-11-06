
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

import com.aurospaces.neighbourhood.bean.CityBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseCityDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	 
	public final String INSERT_SQL = "INSERT INTO city ( created_time, updated_time, name,state, status) values (?, ?, ?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final CityBean objCityBean) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
		if(objCityBean.getUpdatedTime() == null)
		{
			objCityBean.setUpdatedTime( new Date());
		}
		final java.sql.Timestamp updatedTime = 
				new java.sql.Timestamp(objCityBean.getUpdatedTime().getTime()); 
	if(objCityBean.getId() == 0)	{
		
	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(objCityBean.getCreatedTime() == null)
					{
						objCityBean.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(objCityBean.getCreatedTime().getTime()); 
							
					
					
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
	ps.setTimestamp(2, updatedTime);
	ps.setString(3, objCityBean.getName());
	ps.setString(4, objCityBean.getState());
	ps.setString(5, objCityBean.getStatus());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				objCityBean.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE city set updated_time = ? ,name = ?,state = ?,status = ? where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{updatedTime,objCityBean.getName(),objCityBean.getState(),objCityBean.getStatus(),objCityBean.getId()});
		}
	}
		
		@Transactional
		public boolean delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			boolean delete = false;
			try{
				String sql = "DELETE FROM city WHERE id=?";
				int intDelete = jdbcTemplate.update(sql, new Object[]{id});
				if(intDelete != 0){
					delete = true;
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			return delete;
		}
		

	 public CityBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from city where id = ?";
			List<CityBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(CityBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	

	

}
