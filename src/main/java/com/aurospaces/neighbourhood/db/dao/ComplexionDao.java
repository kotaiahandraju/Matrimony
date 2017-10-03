package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.ComplexionBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseComplexionDao;
@Repository(value="ComplexionDao")
public class ComplexionDao extends BaseComplexionDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<ComplexionBean> getAllComplexions() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from complexion where status= '1'  ";
		List<ComplexionBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(ComplexionBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public ComplexionBean getByName(ComplexionBean objComplexionBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from complexion where name = ?";
			List<ComplexionBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objComplexionBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(ComplexionBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
}
