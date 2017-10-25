package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.BodyTypeBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseUserImageUploadDao;
@Repository(value="UserImageUploadDao")
public class UserImageUploadDao extends BaseUserImageUploadDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<BodyTypeBean> getAllBodyTypes() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from body_type where status= '1'  ";
		List<BodyTypeBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(BodyTypeBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public BodyTypeBean getByName(BodyTypeBean bodyTyeBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from body_type where name = ?";
			List<BodyTypeBean> retlist = jdbcTemplate.query(sql,
			new Object[]{bodyTyeBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(BodyTypeBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
}
