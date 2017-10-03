package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseEducationDao;
@Repository(value="EducationDao")
public class EducationDao extends BaseEducationDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<EducationBean> getAllEducations() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from education where status= '1'  ";
		List<EducationBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(EducationBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public EducationBean getByName(EducationBean objEducationBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from education where name = ?";
			List<EducationBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objEducationBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(EducationBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
}
