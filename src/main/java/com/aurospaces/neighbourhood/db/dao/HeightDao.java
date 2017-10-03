package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseHeightDao;
@Repository(value="HeightDao")
public class HeightDao extends BaseHeightDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<HeightBean> getAllHeights() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from height where status= '1'  ";
		List<HeightBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(HeightBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public HeightBean getByName(HeightBean objHeightBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from height where inches = ? or cm = ?";
			List<HeightBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objHeightBean.getInches(),objHeightBean.getCm()},
			ParameterizedBeanPropertyRowMapper.newInstance(HeightBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
}
