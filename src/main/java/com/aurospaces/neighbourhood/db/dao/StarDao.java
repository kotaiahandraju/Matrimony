package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.StarBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseStarDao;
@Repository(value="StarDao")
public class StarDao extends BaseStarDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<StarBean> getAllStars() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from star where status='1'  ";
		List<StarBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(StarBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public StarBean getByName(StarBean objStarBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from star where name = ?";
			List<StarBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objStarBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(StarBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}  
	
}
