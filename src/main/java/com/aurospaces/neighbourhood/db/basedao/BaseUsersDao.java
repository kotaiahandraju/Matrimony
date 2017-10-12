
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


public class BaseUsersDao{

	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;

	 
	public final String INSERT_SQL = "INSERT INTO users( created_time, updated_time, role_id, username, password,email,name,sname,gender,height,mstatus,dob,tob,pob,created_by,cast,complexion,mtongue,education,emply_type,fname,feducation,foccupation,mname,meducation,moccupation,Address,country,mobile,branch,register_with,profile_pic_status,last_login,last_ip, status,showall) values "
			+ "(?, ?, ?,?,AES_ENCRYPT(?,?),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 





	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public void save(final UsersBean objUsersBean) 
	{
		jdbcTemplate = custom.getJdbcTemplate();
		if(objUsersBean.getUpdatedTime() == null)
		{
			objUsersBean.setUpdatedTime( new Date());
		}
		final java.sql.Timestamp updatedTime = 
				new java.sql.Timestamp(objUsersBean.getUpdatedTime().getTime()); 
	if(objUsersBean.getId() == 0)	{
		
	KeyHolder keyHolder = new GeneratedKeyHolder();
	int update = jdbcTemplate.update(
			new PreparedStatementCreator() {
					public PreparedStatement 
					createPreparedStatement(Connection connection) throws SQLException {
	
					if(objUsersBean.getCreatedTime() == null)
					{
						objUsersBean.setCreatedTime( new Date());
					}
					if(objUsersBean.getDob1() == null)
					{
						objUsersBean.setDob1( new Date());
					}
					if(objUsersBean.getLast_login1() == null)
					{
						objUsersBean.setLast_login1( new Date());
					}
					java.sql.Timestamp createdTime = 
						new java.sql.Timestamp(objUsersBean.getCreatedTime().getTime()); 
					
					java.sql.Timestamp dob = 
							new java.sql.Timestamp(objUsersBean.getDob1().getTime()); 
					
					java.sql.Timestamp last_login = 
							new java.sql.Timestamp(objUsersBean.getLast_login1().getTime()); 
			
							
					PreparedStatement ps =
									connection.prepareStatement(INSERT_SQL,new String[]{"id"});
	ps.setTimestamp(1, createdTime);
	ps.setTimestamp(2, updatedTime);
	ps.setInt(3, objUsersBean.getRole_id());
	ps.setString(4, objUsersBean.getUsername());
	ps.setString(5, objUsersBean.getPassword());
	ps.setString(6, "mykey");
	ps.setString(7, objUsersBean.getEmail());
	ps.setString(8, objUsersBean.getName());
	ps.setString(9, objUsersBean.getSname());
	ps.setString(10, objUsersBean.getGender());
	ps.setString(11, objUsersBean.getHeight());
	ps.setString(12, objUsersBean.getMstatus());
	ps.setTimestamp(13, dob);
	ps.setString(14, objUsersBean.getTob());
	ps.setString(15, objUsersBean.getPob());
	ps.setString(16, objUsersBean.getCreated_by());
	ps.setString(17, objUsersBean.getCast());
	ps.setString(18, objUsersBean.getComplexion());
	ps.setString(19, objUsersBean.getMtongue());
	ps.setString(20, objUsersBean.getEducation());
	ps.setString(21, objUsersBean.getEmply_type());
	ps.setString(22, objUsersBean.getFname());
	ps.setString(23, objUsersBean.getFeducation());
	ps.setString(24, objUsersBean.getFoccupation());
	ps.setString(25, objUsersBean.getMname());
	ps.setString(26, objUsersBean.getMeducation());
	ps.setString(27, objUsersBean.getMoccupation());
	ps.setString(28, objUsersBean.getAddress());
	ps.setString(29, objUsersBean.getCountry());
	ps.setString(30, objUsersBean.getMobile());
	ps.setString(31, objUsersBean.getBranch());
	ps.setString(32, objUsersBean.getRegister_with());
	ps.setString(33, objUsersBean.getProfile_pic_status());
	ps.setTimestamp(34,last_login);
	ps.setString(35, objUsersBean.getLast_ip());
	ps.setString(36, objUsersBean.getStatus());
	ps.setString(37, objUsersBean.getShowall());

							return ps;
						}
				},
				keyHolder);
				
				Number unId = keyHolder.getKey();
				objUsersBean.setId(unId.intValue());
				

		}
		else
		{

			String sql = "UPDATE users set updated_time = ? ,  email=?, name = ?, sname=?, gender=?, height=?, mstatus=?, dob=?, tob=?, pob=?, created_by=?, cast=?, complexion=?, mtongue=?, education=?, emply_type=?, fname=?, feducation=?, foccupation=?, mname=?, meducation=?, moccupation=?, Address=?, country=?, mobile=?, branch=?, register_with=?, profile_pic_status=?, last_login=?, last_ip=?,showall=? where id = ? ";
	
			jdbcTemplate.update(sql, new Object[]{updatedTime, objUsersBean.getEmail(),objUsersBean.getName(),objUsersBean.getSname(),objUsersBean.getGender(),objUsersBean.getHeight(), objUsersBean.getMstatus(),objUsersBean.getDob(),objUsersBean.getTob(),objUsersBean.getPob(),objUsersBean.getCreated_by(),objUsersBean.getCast(),objUsersBean.getComplexion(),objUsersBean.getMtongue(),objUsersBean.getEducation(),objUsersBean.getEmply_type(),objUsersBean.getFname(),objUsersBean.getFeducation(),objUsersBean.getFoccupation(),objUsersBean.getMname(),objUsersBean.getMeducation(),objUsersBean.getMoccupation(),objUsersBean.getAddress(),objUsersBean.getCountry(),objUsersBean.getMobile(),objUsersBean.getBranch(),objUsersBean.getRegister_with(),objUsersBean.getProfile_pic_status(),objUsersBean.getLast_login1(),objUsersBean.getLast_ip(),objUsersBean.getShowall(),objUsersBean.getId()});
		}
	}
		
		@Transactional
		public void delete(int id) {
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "DELETE FROM users WHERE id=?";
			jdbcTemplate.update(sql, new Object[]{id});
		}
		

	 public UsersBean getById(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from users u ,userdetails ud where u.id = ud.userId and u.id= "+id;
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	 public UsersBean getByEmail(String email) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from users u ,userdetails ud where u.id = ud.userId and u.email= '"+email+"'";
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	 public List<UsersBean> getAllProfiles() {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from users ";
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist;
			return null;
		}
	
	

	

}
