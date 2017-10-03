package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.MemberShipBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseMemberShipDao;
@Repository(value="MemberShipDao")
public class MemberShipDao extends BaseMemberShipDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<MemberShipBean> getAllPackage() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from package where status= '1'  ";
		List<MemberShipBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(MemberShipBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public MemberShipBean getByName(MemberShipBean objMemberShipBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from package where name = ?";
			List<MemberShipBean> retlist = jdbcTemplate.query(sql,
			new Object[]{objMemberShipBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(MemberShipBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}
	
}
