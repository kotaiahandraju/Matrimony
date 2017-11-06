
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

import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;



public class BaseusersDao{

//@Autowired public JdbcTemplate jdbcTemplate;
@Autowired
CustomConnection custom;
JdbcTemplate jdbcTemplate;
 
	public final String INSERT_SQL = "INSERT INTO users( created_time, updated_time, role_id, username, password, email, createProfileFor, gender, firstName, lastName, dob, religion, motherTongue, currentCountry, currentState, currentCity, maritalStatus, caste, gotram, star, dosam, dosamName, education, workingWith, companyName, annualIncome, monthlyIncome, diet, smoking, drinking, height, bodyType, complexion, mobile, aboutMyself, disability, status, showall,registerwith,fatherName, motherName, fOccupation, mOccupation, noOfBrothers, noOfSisters, noOfBrothersMarried, noOfSistersMarried,haveChildren) values (?, ?, ?, ?, AES_ENCRYPT(?,?), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final UsersBean users) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(users.getId() == 0)	{

	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(users.getCreatedTime() == null)
					{
					users.setCreatedTime( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(users.getCreatedTime().getTime()); 
							
					if(users.getUpdatedTime() == null)
					{
					users.setUpdatedTime( new Date());
					}
					java.sql.Timestamp updatedTime = 
						new java.sql.Timestamp(users.getUpdatedTime().getTime()); 
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setInt(3, users.getRoleId());
ps.setString(4, users.getUsername());
ps.setString(5, users.getPassword());
ps.setString(6, "mykey");
ps.setString(7, users.getEmail());
ps.setString(8, users.getCreateProfileFor());
ps.setString(9, users.getGender());
ps.setString(10, users.getFirstName());
ps.setString(11, users.getLastName());
ps.setString(12, users.getDob());
ps.setString(13, users.getReligion());
ps.setString(14, users.getMotherTongue());
ps.setString(15, users.getCurrentCountry());
ps.setString(16, users.getCurrentState());
ps.setString(17, users.getCurrentCity());
ps.setString(18, users.getMaritalStatus());
ps.setString(19, users.getCaste());
ps.setString(20, users.getGotram());
ps.setString(21, users.getStar());
ps.setString(22, users.getDosam());
ps.setString(23, users.getDosamName());
ps.setString(24, users.getEducation());
ps.setString(25, users.getWorkingWith());
ps.setString(26, users.getCompanyName());
ps.setString(27, users.getAnnualIncome());
ps.setString(28, users.getMonthlyIncome());
ps.setString(29, users.getDiet());
ps.setString(30, users.getSmoking());
ps.setString(31, users.getDrinking());
ps.setString(32, users.getHeight());
ps.setString(33, users.getBodyType());
ps.setString(34, users.getComplexion());
ps.setString(35, users.getMobile());
ps.setString(36, users.getAboutMyself());
ps.setString(37, users.getDisability());
ps.setString(38, users.getStatus());
ps.setString(39, users.getShowall());
ps.setString(40, users.getRegisterwith());
ps.setString(41, users.getFatherName());
ps.setString(42, users.getMotherName());
ps.setString(43, users.getfOccupation());
ps.setString(44, users.getmOccupation());
ps.setString(45, users.getNoOfBrothers());
ps.setString(46, users.getNoOfSisters());
ps.setString(47, users.getNoOfBrothersMarried());
ps.setString(48, users.getNoOfSistersMarried());
ps.setString(49, users.getHaveChildren());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				users.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE users  set updated_time = ?  ,createProfileFor = ? ,gender = ? ,firstName = ? ,lastName = ? ,dob = ? ,religion = ? ,motherTongue = ? ,currentCountry = ? ,currentState = ? ,currentCity = ? ,maritalStatus = ? ,caste = ? ,gotram = ? ,star = ? ,dosam = ? ,dosamName = ? ,education = ? ,workingWith = ? ,companyName = ? ,annualIncome = ? ,monthlyIncome = ? ,diet = ? ,smoking = ? ,drinking = ? ,height = ? ,bodyType = ? ,complexion = ? ,mobile = ? ,aboutMyself = ? ,disability = ? ,fatherName=?, motherName=?, fOccupation=?, mOccupation=?, noOfBrothers=?, noOfSisters=?, noOfBrothersMarried=?, noOfSistersMarried=?,haveChildren=?  where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{users.getUpdatedTime(),users.getCreateProfileFor(),users.getGender(),users.getFirstName(),users.getLastName(),users.getDob(),users.getReligion(),users.getMotherTongue(),users.getCurrentCountry(),users.getCurrentState(),users.getCurrentCity(),users.getMaritalStatus(),users.getCaste(),users.getGotram(),users.getStar(),users.getDosam(),users.getDosamName(),users.getEducation(),users.getWorkingWith(),users.getCompanyName(),users.getAnnualIncome(),users.getMonthlyIncome(),users.getDiet(),users.getSmoking(),users.getDrinking(),users.getHeight(),users.getBodyType(),users.getComplexion(),users.getMobile(),users.getAboutMyself(),users.getDisability(),users.getFatherName(),users.getMotherName(),users.getfOccupation(),users.getmOccupation(), users.getNoOfBrothers(),users.getNoOfSisters(),users.getNoOfBrothersMarried(),users.getNoOfSistersMarried(),users.getHaveChildren(),users.getId()});
		}
	}
		
		@Transactional
		public void delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM users WHERE id=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}
		

		public UsersBean getById1(int id) {
			 jdbcTemplate = custom.getJdbcTemplate();
				String sql = "SELECT * from users where id = ? ";
				List<UsersBean> retlist = jdbcTemplate.query(sql,
				new Object[]{id},
				ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
				if(retlist.size() > 0)
					return retlist.get(0);
				return null;
			}
	 public UsersBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT u.*,ur.* from users u left join userrequirement ur  on u.id=ur.userId where u.id = ? ";
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	 

	

}
