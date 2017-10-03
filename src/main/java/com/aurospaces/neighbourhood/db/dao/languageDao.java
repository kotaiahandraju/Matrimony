package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.LanguageBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseLanguageDao;
@Repository(value="LanguageDao")
public class languageDao extends BaseLanguageDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<LanguageBean> getAllLanguages() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from language where status= '1'  ";
		List<LanguageBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(LanguageBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public LanguageBean getByName(LanguageBean objLanguageBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from language where name = ?";
			List<LanguageBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objLanguageBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(LanguageBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
}
