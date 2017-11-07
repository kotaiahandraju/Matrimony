
package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.UserrequirementBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseUserrequirementDao;




@Repository(value = "userrequirementDao")
public class UserrequirementDao extends BaseUserrequirementDao
{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate;
	 public UsersBean getByUserId(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from userrequirement where userId = ? ";
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	 public UsersBean getByFilterUserId(int id) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from userrequirement where userId = ? ";
			List<UsersBean> retlist = jdbcTemplate.query(sql,
			new Object[]{id},
			ParameterizedBeanPropertyRowMapper.newInstance(UsersBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}


}

