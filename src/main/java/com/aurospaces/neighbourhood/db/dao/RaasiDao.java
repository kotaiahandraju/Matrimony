package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.RaasiBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseRaasiDao;
@Repository(value="RassiDao")
public class RaasiDao extends BaseRaasiDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<RaasiBean> getAllRaasis() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from raasi where status= '1' ";
		List<RaasiBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(RaasiBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public RaasiBean getByName(RaasiBean objRaasiBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from raasi where name = ?";
			List<RaasiBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objRaasiBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(RaasiBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
}
