package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.ContriesBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseCountriesDao;
@Repository(value="CountriesDao")
public class CountriesDao extends BaseCountriesDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<ContriesBean> getAllCountries() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from countries where status= '1'  ";
		List<ContriesBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(ContriesBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public ContriesBean getByName(ContriesBean objContriesBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from countries where name = ?";
			List<ContriesBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objContriesBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(ContriesBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
}
