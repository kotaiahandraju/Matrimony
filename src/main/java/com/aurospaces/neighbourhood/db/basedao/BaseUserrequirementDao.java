
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

import com.aurospaces.neighbourhood.bean.UserrequirementBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;


public class BaseUserrequirementDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	 

 
	public final String INSERT_SQL = "INSERT INTO userrequirement( created_time, updated_time, userId, rAgeFrom, rAgeTo, rHeight, rMaritalStatus, rReligion, rCaste, rMotherTongue,haveChildren,rCountry,rState,rEducation,rWorkingWith,rOccupation,rAnnualIncome,rCreateProfileFor,rDiet) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final UsersBean userrequirement) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(userrequirement.getUserrequirementId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(userrequirement.getCreatedTime() == null)
					{
					userrequirement.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(userrequirement.getCreatedTime().getTime()); 
							
					if(userrequirement.getUpdatedTime() == null)
					{
					userrequirement.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(userrequirement.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"userrequirementId"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setInt(3, userrequirement.getUserId());
ps.setString(4, userrequirement.getrAgeFrom());
ps.setString(5, userrequirement.getrAgeTo());
ps.setString(6, userrequirement.getrHeight());
ps.setString(7, userrequirement.getrMaritalStatus());
ps.setString(8, userrequirement.getrReligion());
ps.setString(9, userrequirement.getrCaste());
ps.setString(10, userrequirement.getrMotherTongue());
ps.setString(11, userrequirement.getHaveChildren());
ps.setString(12, userrequirement.getrCountry());	
ps.setString(13, userrequirement.getrState());
ps.setString(14, userrequirement.getrEducation());
ps.setString(15, userrequirement.getrWorkingWith());
ps.setString(16, userrequirement.getrOccupation());
ps.setString(17, userrequirement.getrAnnualIncome());
ps.setString(18, userrequirement.getrCreateProfileFor());
ps.setString(19, userrequirement.getrDiet());

return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				userrequirement.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE userrequirement  set updated_time = ? ,userId = ? ,rAgeFrom = ? ,rAgeTo = ? ,rHeight = ? ,rMaritalStatus = ? ,rReligion = ? ,rCaste = ? ,rMotherTongue = ?,haveChildren=?"
					+ "  ,rCountry=?,rState=?,rEducation=?,rWorkingWith=?,rOccupation=?,rAnnualIncome=?,rCreateProfileFor=?,rDiet=?  where userrequirementId = ? ";
	
			jdbcTemplate.update(sql, new Object[]{userrequirement.getUpdatedTime(),userrequirement.getUserId(),userrequirement.getrAgeFrom(),userrequirement.getrAgeTo(),userrequirement.getrHeight(),userrequirement.getrMaritalStatus(),userrequirement.getrReligion(),
					userrequirement.getrCaste(),userrequirement.getrMotherTongue(),userrequirement.getHaveChildren()
					,userrequirement.getrCountry(),userrequirement.getrState(),userrequirement.getrEducation(),userrequirement.getrWorkingWith(),userrequirement.getrOccupation(),userrequirement.getrAnnualIncome(),userrequirement.getrCreateProfileFor(),userrequirement.getrDiet(),userrequirement.getUserrequirementId()});
		}
	}
		
		@Transactional
		public void delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM userrequirement WHERE userrequirementId=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}
		

	 public UserrequirementBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from userrequirement where userrequirementId = ? ";
			List<UserrequirementBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(UserrequirementBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	

}
