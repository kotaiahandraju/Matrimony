package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.ReligionBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseReligionDao;
@Repository(value="ReligionDao")
public class ReligionDao extends BaseReligionDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<ReligionBean> getAllReligions() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from religion where status='1' ";
		List<ReligionBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(ReligionBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public ReligionBean getByName(ReligionBean objReligionBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from religion where name = ?";
			List<ReligionBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objReligionBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(ReligionBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		} 
	
}
