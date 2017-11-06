/*package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.BodyTypeBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseUserDetailsDao;
@Repository(value="UserDetailsDao")
public class UserDetailsDao extends BaseUserDetailsDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<BodyTypeBean> getAllUsers() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from body_type  ";
		List<BodyTypeBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(BodyTypeBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public List<EducationBean> populate(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<EducationBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(EducationBean.class));
					return retlist;
		 }
	 public List<HeightBean> populate1(String sql ){
		 jdbcTemplate = custom.getJdbcTemplate();
				List<HeightBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(HeightBean.class));
					return retlist;
		 }
	 public int getNewUserId(){
			jdbcTemplate = custom.getJdbcTemplate();
			String sql = "select max(id) from users";
			int maxId = jdbcTemplate.queryForInt(sql);
			return (maxId+1);
		}
}
*/