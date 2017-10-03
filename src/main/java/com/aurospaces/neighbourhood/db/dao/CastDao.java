package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.CastBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseCastDao;
@Repository(value="CastDao")
public class CastDao extends BaseCastDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<CastBean> getAllCasts() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from cast where status= '1'  ";
		List<CastBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(CastBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public CastBean getByName(CastBean objCastBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from cast where name = ?";
			List<CastBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objCastBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(CastBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
}
