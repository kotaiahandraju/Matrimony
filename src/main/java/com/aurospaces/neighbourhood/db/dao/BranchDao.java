package com.aurospaces.neighbourhood.db.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.daosupport.CustomConnection;
import com.aurospaces.neighbourhood.db.basedao.BaseBranchDao;
@Repository(value="BranchDao")
public class BranchDao extends BaseBranchDao {
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ; 
	public List<BranchBean> getAllBranches() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT * from branch where status= '1'  ";
		List<BranchBean> retlist = jdbcTemplate.query(sql, new Object[] {  },
				ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
		if (retlist.size() > 0)
			return retlist;
		return null;
	}
	 public BranchBean getByName(BranchBean branchBean) {
		 jdbcTemplate = custom.getJdbcTemplate();
			String sql = "SELECT * from branch where name = ?";
			List<BranchBean> retlist = jdbcTemplate.query(sql,
			new Object[]{branchBean.getName()},
			ParameterizedBeanPropertyRowMapper.newInstance(BranchBean.class));
			if(retlist.size() > 0)
				return retlist.get(0);
			return null;
		}

	
}
