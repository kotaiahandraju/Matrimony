package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.occupationBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseOccupationDao;
@Repository(value="OccupationDao")
public class OccupationDao extends BaseOccupationDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<occupationBean> getAllOccupations() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from occupation where status= '1'  ";
		List<occupationBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(occupationBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public occupationBean getByName(occupationBean objoccupationBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from occupation where name = ?";
			List<occupationBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objoccupationBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(occupationBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
}
