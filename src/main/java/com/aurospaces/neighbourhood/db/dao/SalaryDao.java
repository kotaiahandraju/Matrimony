package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.SalaryBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseSalaryDao;
@Repository(value="SalaryDao")
public class SalaryDao extends BaseSalaryDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<SalaryBean> getAllSalaries() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from salary where status= '1'  ";
		List<SalaryBean> retlist = jdbcTemplate.query(sql, new Object[] {},
				ParameterizedBeanPropertyRowMapper.newInstance(SalaryBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public SalaryBean getByName(SalaryBean salaryBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from salary where name = ?";
			List<SalaryBean> retlist = jdbcTemplate.query(sql,
			new Object[]{salaryBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(SalaryBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
}
