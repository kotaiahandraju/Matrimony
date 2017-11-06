package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.StateBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseStateDao;;
@Repository(value="StateDao")
public class StateDao extends BaseStateDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<StateBean> getAllStates() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from state where status= '1'  ";
		List<StateBean> retlist = jdbcTemplate.query(sql, new Object[] {},
				ParameterizedBeanPropertyRowMapper.newInstance(StateBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public StateBean getByName(StateBean stateBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from state where name = ?";
			List<StateBean> retlist = jdbcTemplate.query(sql,
			new Object[]{stateBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(StateBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
}
