package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.DoshamBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseDoshamDao;
@Repository(value="DoshamDao")
public class DoshamDao extends BaseDoshamDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<DoshamBean> getAllDoshams() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from dosham where status= '1'  ";
		List<DoshamBean> retlist = jdbcTemplate.query(sql, new Object[] {},
				ParameterizedBeanPropertyRowMapper.newInstance(DoshamBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public DoshamBean getByName(DoshamBean doshamBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from dosham where name = ?";
			List<DoshamBean> retlist = jdbcTemplate.query(sql,
			new Object[]{doshamBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(DoshamBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
}
