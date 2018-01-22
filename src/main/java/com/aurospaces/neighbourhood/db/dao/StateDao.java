package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

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
	public List<Map<String,Object>> getAllStates() {
		jdbcTemplate = custom.getJdbcTemplate();
		String sql = "SELECT *,(select c.name from countries c where c.id=state.country_id) as country_name from state where status= '1'  ";
		List<Map<String,Object>> retlist = jdbcTemplate.queryForList(sql, new Object[] {});
			return retlist;
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
	 
	 public List<Map<String,Object>> getFilteredStates(String countryIds){
			jdbcTemplate = custom.getJdbcTemplate();
			String qryStr = "select * from state  where find_in_set(country_id,'"+countryIds+"')>0 and status='1' order by name asc";
			try{
				List<Map<String,Object>> list = jdbcTemplate.queryForList(qryStr);
				if(list!=null)
					return list;
			}catch(Exception e){
				e.printStackTrace();
				return null;
			}
			return null;
		}
	 public List<StateBean> populate(String sql ){	
			jdbcTemplate = custom.getJdbcTemplate();
			List<StateBean> retlist = jdbcTemplate.query(sql,ParameterizedBeanPropertyRowMapper.newInstance(StateBean.class));
						return retlist;
		}
}
