package com.aurospaces.neighbourhood.db.dao;

import java.util.List;
import java.util.Map;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.aurospaces.neighbourhood.daosupport.CustomConnection;
@Repository(value="userSettingsDao")
public class UserSettingsDao{
	@Autowired
	CustomConnection custom;
	JdbcTemplate jdbcTemplate ;
	
	public boolean saveUserMailAlertsSettings(String user_id, String product_promotions, String daily_match_alerts, String weekly_match_alerts, String auto_login){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		try {
			buffer.append("update user_settings set updated_time = '"+new java.sql.Timestamp(new DateTime().getMillis())+"',product_promotion_emails='"+product_promotions+"',daily_matches_emails='"+daily_match_alerts+"',weekly_matches_emails='"+weekly_match_alerts+"',auto_login='"+auto_login+"' "
							+" where user_id="+user_id);
			int updated_count = jdbcTemplate.update(buffer.toString());
			if (updated_count == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public Map<String,Object> getMailAlertsSettings(String user_id){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		try {
			buffer.append("select * from user_settings  where user_id="+user_id);
			Map<String,Object> settingsMap = jdbcTemplate.queryForMap(buffer.toString());
			return settingsMap;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean saveContactFilterSettings(String user_id, String filter_option, Map<String,String> filter_criteria){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		try {
			if(filter_option.equalsIgnoreCase("anyone")){
				buffer.append("update user_settings set updated_time = '"+new java.sql.Timestamp(new DateTime().getMillis())+"', contact_filter='"+filter_option+"', "
						+" filter_age_from=null,filter_age_to=null,filter_marital_status=null, "
						+" filter_religion=null,filter_caste=null,filter_mothertongue=null, "
						+" filter_country=null "
						+" where user_id="+user_id);
			}else if(filter_option.equalsIgnoreCase("filter")){
				buffer.append("update user_settings set updated_time = '"+new java.sql.Timestamp(new DateTime().getMillis())+"', contact_filter='"+filter_option+"', "
						+" filter_age_from='"+filter_criteria.get("age_from")+"',filter_age_to='"+filter_criteria.get("age_to")+"',filter_marital_status='"+filter_criteria.get("marital_status")+"', "
						+" filter_religion='"+filter_criteria.get("religion")+"',filter_caste='"+filter_criteria.get("caste")+"',filter_mothertongue='"+filter_criteria.get("mothertongue")+"', "
						+" filter_country='"+filter_criteria.get("country")+"' "
						+" where user_id="+user_id);
			}
			
			int updated_count = jdbcTemplate.update(buffer.toString());
			if (updated_count == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
	 
	public Map<String,Object> getContactFilterSettings(String user_id){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		try {
			buffer.append("select * from user_settings  where user_id="+user_id);
			Map<String,Object> settingsMap = jdbcTemplate.queryForMap(buffer.toString());
			return settingsMap;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Map<String,Object> getUserSettings(String user_id){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		try {
			buffer.append("select * from user_settings  where user_id="+user_id);
			Map<String,Object> settingsMap = jdbcTemplate.queryForMap(buffer.toString());
			return settingsMap;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean saveUnsubscribeFromCallingList(String user_id, String unsubscribe_from_val){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		try {
			buffer.append("update user_settings set updated_time = '"+new java.sql.Timestamp(new DateTime().getMillis())+"', marketing_calls_permission='"+unsubscribe_from_val+"' "
							+" where user_id="+user_id);
			int updated_count = jdbcTemplate.update(buffer.toString());
			if (updated_count == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public boolean saveProfileSettings(String user_id, String show_profile_to, String shortlist_option){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		try {
			buffer.append("update user_settings set updated_time = '"+new java.sql.Timestamp(new DateTime().getMillis())+"', show_profile_to = '"+show_profile_to+"', know_shortlisted_option = '"+shortlist_option+"' "
							+" where user_id="+user_id);
			int updated_count = jdbcTemplate.update(buffer.toString());
			if (updated_count == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public boolean savePrivacySettings(String user_id, String show_mobileno_to){
		jdbcTemplate = custom.getJdbcTemplate();
		StringBuffer buffer = new StringBuffer();
		try {
			buffer.append("update user_settings set updated_time = '"+new java.sql.Timestamp(new DateTime().getMillis())+"', show_mobile_no_to = '"+show_mobileno_to+"' "
							+" where user_id="+user_id);
			int updated_count = jdbcTemplate.update(buffer.toString());
			if (updated_count == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public void insertSettings(){
		jdbcTemplate = custom.getJdbcTemplate();
		String qry = "select id from users";
		List<Map<String,Object>> users = jdbcTemplate.queryForList(qry);
		for(Map<String,Object> user:users){
			String serrings_insert = "insert into user_settings(created_time,updated_time,user_id,product_promotion_emails,daily_matches_emails,weekly_matches_emails,auto_login,contact_filter,marketing_calls_permission) "
					+" values('"+new java.sql.Timestamp(new DateTime().getMillis())+"','"+new java.sql.Timestamp(new DateTime().getMillis())+"',"+user.get("id")+",'1','0','1','1','anyone','1m'  ) ";
			jdbcTemplate.update(serrings_insert);
		}
	}
}
