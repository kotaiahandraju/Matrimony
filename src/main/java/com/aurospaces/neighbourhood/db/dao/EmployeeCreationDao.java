package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
@Repository(value="EmployeeCreationDao")
public class EmployeeCreationDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	
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
	public UsersBean getByEmployee( String username,String email) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from users where username = ? or email=?";  
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{username,email},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	public UsersBean getByEmployeeByEmail( String email) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from users where  email=?";  
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{email},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
	public UsersBean getByEmployeeByUserName( String username) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from users where username = ? ";  
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{username},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	

}
