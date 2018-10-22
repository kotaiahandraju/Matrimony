package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

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
		String sql = "SELECT c.name,c.id,r.name as religionname ,c.religionId FROM cast c,religion r where c.religionId=r.id and c.status= '1' and r.status = '1' ";
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
	 public List<Map<String, Object>> getCastesBasedOnReligion(String religion_id){

			jdbcTemplate = custom.getJdbcTemplate();
			StringBuffer buffer = new StringBuffer();
			buffer.append("select id,name from cast where religionId in ( "+religion_id+" ) and status = '1' ");
			String sql =buffer.toString();
			System.out.println("#### getCastesBasedOnReligion:"+sql);
			List<Map<String, Object>> castes = jdbcTemplate.queryForList(sql);
			return castes;
		}
}
