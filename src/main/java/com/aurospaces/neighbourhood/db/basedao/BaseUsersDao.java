
package com.aurospaces.neighbourhood.db.basedao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
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
import com.aurospaces.neighbourhood.util.MiscUtils;



public class BaseUsersDao{

//@Autowired public JdbcTemplate jdbcTemplate;
@Autowired
CustomConnection custom;
JdbcTemplate jdbcTemplate;

@Autowired HttpSession session;
 
	public final String INSERT_SQL = "INSERT INTO users( created_time, updated_time, role_id, username, password, email, createProfileFor, gender, firstName, lastName, dob, religion, motherTongue, currentCountry, currentState, currentCity, maritalStatus, caste, gotram, star, dosam, dosamName, education, workingWith, companyName, annualIncome, monthlyIncome, diet, smoking, drinking, height, bodyType, complexion, mobile, aboutMyself, disability, status, showall,registerwith,fatherName, motherName, fOccupation, mOccupation, noOfBrothers, noOfSisters, noOfBrothersMarried, noOfSistersMarried,haveChildren,age,occupation,unique_code) values (?, ?, ?, ?, AES_ENCRYPT(?,?), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final UsersBean users) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
		if(users.getDob1() == null)
		{
		users.setDob1( new Date());
		}
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
					float age = 0.0f;
					if(StringUtils.isNotBlank(users.getDob())){
						Date dob = HRMSUtil.dateFormate(users.getDob());
						LocalDate birthdate = new LocalDate (dob); 
						LocalDate now = new LocalDate();
						Period period = new Period(birthdate, now, PeriodType.yearMonthDay());
						//age = Float.valueOf(period.getYears()+"."+period.getMonths());
						age = Float.valueOf(period.getYears());
					}
					
					String unique_code = MiscUtils.generateRandomString(12);
					
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
ps.setTimestamp(2, updatedTime);
ps.setInt(3, users.getRoleId());
ps.setString(4, users.getUsername());
ps.setString(5, users.getRegPassword());
ps.setString(6, "mykey");
ps.setString(7, users.getEmail());
ps.setString(8, users.getCreateProfileFor());
ps.setString(9, users.getGender());
ps.setString(10, users.getFirstName());
ps.setString(11, users.getLastName());
ps.setTimestamp(12, new java.sql.Timestamp(users.getDob1().getTime()));
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
ps.setString(50, age+"");
ps.setString(51, users.getOccupation());
ps.setString(52, unique_code);

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				users.setId(unId.intValue());
				
				if(StringUtils.isNotBlank(users.getCurrentCity())){
					String sSql = "update users set username = concat('AM',(select city_code from city where id = "+users.getCurrentCity()+"),'"+MiscUtils.generateRandomNumber(6)+"') where id = "+users.getId();
					int updated_count = jdbcTemplate.update(sSql);
				}
				String settings_insert = "insert into user_settings(created_time,updated_time,user_id,product_promotion_emails,daily_matches_emails,weekly_matches_emails,auto_login,contact_filter,marketing_calls_permission) "
						+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+new java.sql.Timestamp(new DateTime().getMillis())+"',"+users.getId()+",'1','0','1','1','anyone','1m'  ) "; 
				jdbcTemplate.update(settings_insert);
				// set opt status to 1 if it is created by admin
				this.updateOtpStatus(users.getMobile(), "0", users.getId()+"");
		}
		else
		{

			try{
				
				UsersBean adminSessionBean =  (UsersBean) session.getAttribute("cacheUserBean");
				String passwordStr = "";
				if(adminSessionBean != null){
					passwordStr = "password = AES_ENCRYPT('"+users.getRegPassword()+"','mykey'),";
				}
				String sql = "UPDATE users  set "+passwordStr+" updated_time = ?  ,createProfileFor = ? ,gender = ? ,firstName = ? ,lastName = ? ,dob = ? ,religion = ? ,motherTongue = ? ,currentCountry = ? ,currentState = ? ,currentCity = ? ,maritalStatus = ? ,caste = ? ,gotram = ? ,star = ? ,dosam = ? ,dosamName = ? ,education = ? ,workingWith = ? ,companyName = ? ,annualIncome = ? ,monthlyIncome = ? ,diet = ? ,smoking = ? ,drinking = ? ,height = ? ,bodyType = ? ,complexion = ? ,mobile = ? ,aboutMyself = ? ,disability = ? ,fatherName=?, motherName=?, fOccupation=?, mOccupation=?, noOfBrothers=?, noOfSisters=?, noOfBrothersMarried=?, noOfSistersMarried=?,haveChildren=?,occupation=?  where id = ? ";
				int updated_count = jdbcTemplate.update(sql, new Object[]{new java.sql.Timestamp(new DateTime().getMillis()),users.getCreateProfileFor(),users.getGender(),users.getFirstName(),users.getLastName(),new java.sql.Timestamp(users.getDob1().getTime()),users.getReligion(),users.getMotherTongue(),users.getCurrentCountry(),users.getCurrentState(),users.getCurrentCity(),users.getMaritalStatus(),users.getCaste(),users.getGotram(),users.getStar(),users.getDosam(),users.getDosamName(),users.getEducation(),users.getWorkingWith(),users.getCompanyName(),users.getAnnualIncome(),users.getMonthlyIncome(),users.getDiet(),users.getSmoking(),users.getDrinking(),users.getHeight(),users.getBodyType(),users.getComplexion(),users.getMobile(),users.getAboutMyself(),users.getDisability(),users.getFatherName(),users.getMotherName(),users.getfOccupation(),users.getmOccupation(), users.getNoOfBrothers(),users.getNoOfSisters(),users.getNoOfBrothersMarried(),users.getNoOfSistersMarried(),users.getHaveChildren(),users.getOccupation(),users.getId()});
				if(updated_count==1)
					;
			}catch(Exception e){
				e.printStackTrace();			
			}	
		}
	}
		
		@Transactional
		public boolean delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM users WHERE id=?";
			int deleted_count = jdbcTemplate.update(sql, new Object[]{id});
			if(deleted_count>0){
				return true;
			}
			return false;
		}
		

		public UsersBean getById1(int id) {
			 jdbcTemplate = custom.getJdbcTemplate();
				String sql = "SELECT u.*,DATE_FORMAT(u.dob, '%d-%M-%Y') as dob,DATE_FORMAT(u.created_time, '%d-%M-%Y') as createdTimeAsString  from users u where id = ? ";
				List<UsersBean> retlist = jdbcTemplate.query(sql,
				new Object[]{id},
				ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
				if(retlist.size() > 0)
					return retlist.get(0);
				return null;
			}
	 public UsersBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT u.*,AES_DECRYPT(password,'mykey') as regPassword,ur.*,DATE_FORMAT(u.dob, '%d-%M-%Y') as dob,DATE_FORMAT(u.dob, '%d-%M-%Y') as dob,u.dob as dob1,DATE_FORMAT(u.created_time, '%d-%M-%Y') as createdTimeAsString from users u left join userrequirement ur  on u.id=ur.userId where u.id = ? ";
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	 
	 public int getPackagePriceById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "select ifnull(price,0) from package where id = "+id;
			int price = jdbcTemplate.queryForInt(sql);
			
			return price;
		}
	 
	 @Transactional
		public boolean upgradeUser(int userId,int roleId,String package_id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "update users set package_id = ?, package_joined_date = ?, role_id = ?, membership_status = '1' where id = ?";
			int updatedCount = jdbcTemplate.update(sql, new Object[]{package_id,new java.sql.Timestamp(new Date().getTime()),roleId,userId});
			if(updatedCount==1)
				return true;
			return false;
		}
	 @Transactional
		public boolean updateEmployee(UsersBean objUsersBean) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "update users set firstName=?,lastName=?,email=?,username=?,password= AES_ENCRYPT(?,?)  where id = ?";
			int updatedCount = jdbcTemplate.update(sql, new Object[]{objUsersBean.getFirstName(),objUsersBean.getLastName(),objUsersBean.getEmail(),objUsersBean.getUsername(),objUsersBean.getPassword(),"mykey",objUsersBean.getId()});
			if(updatedCount==1)
				return true;
			return false;
		}
	 
	 public boolean updateOtpStatus(String mobileNum,String otp,String user_id){
			jdbcTemplate = custom.getJdbcTemplate();
			String qryStr = "";
			try{
				String selectQry = "select count(*) from user_otps where user_id = "+user_id+" and mobile_no = "+mobileNum+" and date(updated_time) = current_date() ";
				int existing_count = jdbcTemplate.queryForInt(selectQry);
				if(existing_count==0){
					qryStr = "insert into user_otps(created_time,updated_time,user_id,mobile_no,otp,status,count) "
							+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+new java.sql.Timestamp(new DateTime().getMillis())+"',"+user_id+","+mobileNum+","+otp+",'1',1)";
				}else{
					qryStr = "update user_otps set updated_time = '"+new java.sql.Timestamp(new DateTime().getMillis())+"', otp = "+otp+", count = (count+1) where user_id = "+user_id+" and mobile_no = "+mobileNum+" and date(updated_time) = current_date() ";
				}
				int updated_count = jdbcTemplate.update(qryStr);
				if(updated_count==1)
					return true;
				
			}catch(Exception e){
				e.printStackTrace();
				return false;
			}
			return false;
		}
		
}
