package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;


import com.aurospaces.neighbourhood.bean.CityBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseCityDao;
@Repository(value="CityDao")
public class CityDao extends BaseCityDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<CityBean> getAllCities() {
		jdbcTemplate = custom.getJdbcTemplate();
//		String sql = "SELECT * from city where status= '1'  ";
		String sql = "select s.name as stateName, c.* from state s,city c where c.status ='1' and c.state= s.id;";
		List<CityBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(CityBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	public List<CityBean> populate(String sql ){	
		jdbcTemplate = custom.getJdbcTemplate();
		List<CityBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(CityBean.class));
					return retlist;
	}
	 public CityBean getByName(CityBean cityBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from city where name = ?";
			List<CityBean> retlist = jdbcTemplate.query(sql,
			new Object[]{cityBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(CityBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	 public List<CityBean> filterByState(String  id) {
			jdbcTemplate = custom.getJdbcTemplate();
//			String sql = "SELECT * from city where status= '1'  ";
			String sql = "select id,name from city where state= ?";
			List<CityBean> retlist = jdbcTemplate.query(sql, new Object[] { id },
					ParameterizedBeanPropertyRowMapper.newInstance(CityBean.class));
			if (retlist.size() > 0)
				return retlist;
			return null;
		}
}
