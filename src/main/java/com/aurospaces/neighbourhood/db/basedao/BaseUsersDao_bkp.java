
package com.aurospaces.neighbourhood.db.basedao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;

import org.apache.commons.lang.StringUtils;
import org.joda.time.LocalDate;
import org.joda.time.Period;
import org.joda.time.PeriodType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.Paymenthistory;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.util.HRMSUtil;



public class BaseUsersDao_bkp{

//@Autowired public JdbcTemplate jdbcTemplate;
@Autowired
CustomConnection custom;
JdbcTemplate jdbcTemplate;

//@Autowired	ServletContext objContext;
 
	 
	public final String INSERT_SQL = "INSERT INTO users( created_time, updated_time, role_id, username, password, email, createProfileFor, gender, firstName, lastName, dob, religion, motherTongue, currentCountry, currentState, currentCity, maritalStatus, caste, gotram, star, dosam, dosamName, education, workingWith, companyName, annualIncome, monthlyIncome, diet, smoking, drinking, height, bodyType, complexion, mobile, aboutMyself, disability, status, showall,registerwith,fatherName, motherName, fOccupation, mOccupation, noOfBrothers, noOfSisters, noOfBrothersMarried, noOfSistersMarried,haveChildren,age) values (?, ?, ?, concat('AM',(select auto_increment from INFORMATION_SCHEMA.TABLES " 
			+" where TABLE_SCHEMA = 'vasireddy1' AND TABLE_NAME = 'users')), AES_ENCRYPT(?,?), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?,?)";

	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final UsersBean users) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
	if(users.getId() == 0)	{
		
		/*InputStream input = null;
		String body = null;
		Properties prop = new Properties();
		String propertiespath = objContext.getRealPath("Resources" +File.separator+"DataBase.properties");
		try {
			input = new FileInputStream(propertiespath);
			prop.load(input);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String databaseName = prop.getProperty("db");
		final String INSERT_SQL = "INSERT INTO users( created_time, updated_time, role_id, username, password, email, createProfileFor, gender, firstName, lastName, dob, religion, motherTongue, currentCountry, currentState, currentCity, maritalStatus, caste, gotram, star, dosam, dosamName, education, workingWith, companyName, annualIncome, monthlyIncome, diet, smoking, drinking, height, bodyType, complexion, mobile, aboutMyself, disability, status, showall,registerwith,fatherName, motherName, fOccupation, mOccupation, noOfBrothers, noOfSisters, noOfBrothersMarried, noOfSistersMarried,haveChildren,age) values (?, ?, ?, concat('AM',(select auto_increment from INFORMATION_SCHEMA.TABLES " 
				+" where TABLE_SCHEMA = '"+databaseName+"' AND TABLE_NAME = 'users')), AES_ENCRYPT(?,?), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?,?)";*/
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
					float age = 0.0f;
					if(StringUtils.isNotBlank(users.getDob())){
						Date dob = HRMSUtil.dateFormate(users.getDob());
						LocalDate birthdate = new LocalDate (dob); 
						LocalDate now = new LocalDate();
						Period period = new Period(birthdate, now, PeriodType.yearMonthDay());
						age = Float.valueOf(period.getYears()+"."+period.getMonths());
					}
					
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setInt(3, users.getRoleId());
//ps.setString(4, users.getUsername());
ps.setString(4, users.getPassword());
ps.setString(5, "mykey");
ps.setString(6, users.getEmail());
ps.setString(7, users.getCreateProfileFor());
ps.setString(8, users.getGender());
ps.setString(9, users.getFirstName());
ps.setString(10, users.getLastName());
ps.setTimestamp(11, new java.sql.Timestamp(users.getDob1().getTime()));
ps.setString(12, users.getReligion());
ps.setString(13, users.getMotherTongue());
ps.setString(14, users.getCurrentCountry());
ps.setString(15, users.getCurrentState());
ps.setString(16, users.getCurrentCity());
ps.setString(17, users.getMaritalStatus());
ps.setString(18, users.getCaste());
ps.setString(19, users.getGotram());
ps.setString(20, users.getStar());
ps.setString(21, users.getDosam());
ps.setString(22, users.getDosamName());
ps.setString(23, users.getEducation());
ps.setString(24, users.getWorkingWith());
ps.setString(25, users.getCompanyName());
ps.setString(26, users.getAnnualIncome());
ps.setString(27, users.getMonthlyIncome());
ps.setString(28, users.getDiet());
ps.setString(29, users.getSmoking());
ps.setString(30, users.getDrinking());
ps.setString(31, users.getHeight());
ps.setString(32, users.getBodyType());
ps.setString(33, users.getComplexion());
ps.setString(34, users.getMobile());
ps.setString(35, users.getAboutMyself());
ps.setString(36, users.getDisability());
ps.setString(37, users.getStatus());
ps.setString(38, users.getShowall());
ps.setString(39, users.getRegisterwith());
ps.setString(40, users.getFatherName());
ps.setString(41, users.getMotherName());
ps.setString(42, users.getfOccupation());
ps.setString(43, users.getmOccupation());
ps.setString(44, users.getNoOfBrothers());
ps.setString(45, users.getNoOfSisters());
ps.setString(46, users.getNoOfBrothersMarried());
ps.setString(47, users.getNoOfSistersMarried());
ps.setString(48, users.getHaveChildren());
ps.setString(49, age+"");

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				users.setId(unId.intValue());
				

		}
		else
		{

			try{
				String sql = "UPDATE users  set updated_time = ?  ,createProfileFor = ? ,gender = ? ,firstName = ? ,lastName = ? ,dob = ? ,religion = ? ,motherTongue = ? ,currentCountry = ? ,currentState = ? ,currentCity = ? ,maritalStatus = ? ,caste = ? ,gotram = ? ,star = ? ,dosam = ? ,dosamName = ? ,education = ? ,workingWith = ? ,companyName = ? ,annualIncome = ? ,monthlyIncome = ? ,diet = ? ,smoking = ? ,drinking = ? ,height = ? ,bodyType = ? ,complexion = ? ,mobile = ? ,aboutMyself = ? ,disability = ? ,fatherName=?, motherName=?, fOccupation=?, mOccupation=?, noOfBrothers=?, noOfSisters=?, noOfBrothersMarried=?, noOfSistersMarried=?,haveChildren=?  where id = ? ";
				int updated_count = jdbcTemplate.update(sql, new Object[]{users.getUpdatedTime(),users.getCreateProfileFor(),users.getGender(),users.getFirstName(),users.getLastName(),new java.sql.Timestamp(users.getDob1().getTime()),users.getReligion(),users.getMotherTongue(),users.getCurrentCountry(),users.getCurrentState(),users.getCurrentCity(),users.getMaritalStatus(),users.getCaste(),users.getGotram(),users.getStar(),users.getDosam(),users.getDosamName(),users.getEducation(),users.getWorkingWith(),users.getCompanyName(),users.getAnnualIncome(),users.getMonthlyIncome(),users.getDiet(),users.getSmoking(),users.getDrinking(),users.getHeight(),users.getBodyType(),users.getComplexion(),users.getMobile(),users.getAboutMyself(),users.getDisability(),users.getFatherName(),users.getMotherName(),users.getfOccupation(),users.getmOccupation(), users.getNoOfBrothers(),users.getNoOfSisters(),users.getNoOfBrothersMarried(),users.getNoOfSistersMarried(),users.getHaveChildren(),users.getId()});
				if(updated_count==1)
					;
			}catch(Exception e){
				e.printStackTrace();			
			}	
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
				String sql = "SELECT u.*,DATE_FORMAT(u.dob, '%d-%M-%Y') as dob  from users u where id = ? ";
				List<UsersBean> retlist = jdbcTemplate.query(sql,
				new Object[]{id},
				ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
				if(retlist.size() > 0)
					return retlist.get(0);
				return null;
			}
	 public UsersBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT u.*,ur.*,DATE_FORMAT(u.dob, '%d-%M-%Y') as dob,DATE_FORMAT(u.dob, '%d-%M-%Y') as dob,u.dob as dob1 from users u left join userrequirement ur  on u.id=ur.userId where u.id = ? ";
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	 
	 public int getPackagePriceById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "select price from package where id = "+id;
			int price = jdbcTemplate.queryForInt(sql);
			
			return price;
		}
	 
	 @Transactional
		public boolean upgradeUser(int userId,int roleId) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "update users set role_id = ? where id = ?";
			int updatedCount = jdbcTemplate.update(sql, new Object[]{roleId,userId});
			if(updatedCount==1)
				return true;
			return false;
		}

}
