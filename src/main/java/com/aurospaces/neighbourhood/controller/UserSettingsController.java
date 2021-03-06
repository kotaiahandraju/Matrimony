package com.aurospaces.neighbourhood.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.UserSettingsDao;

@Controller
@RequestMapping(value="/users")
public class UserSettingsController {
	private Logger logger = Logger.getLogger(UserSettingsController.class);
	
   @Autowired UserSettingsDao settingsDao;
   
	@RequestMapping(value = "/saveUserMailAlertsSettings")
	public @ResponseBody String  saveUserMailAlertsSettings(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
		JSONObject jsonObj = new JSONObject();
		try {
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objuserBean == null){
				return "redirect:HomePage";
			}
			String product_promotions = request.getParameter("product_promotions").equalsIgnoreCase("true")?"1":"0";
			String daily_match_alerts = request.getParameter("daily_match_alerts").equalsIgnoreCase("true")?"1":"0";
			String weekly_match_alerts = request.getParameter("weekly_match_alerts").equalsIgnoreCase("true")?"1":"0";
			String auto_login = request.getParameter("auto_login").equalsIgnoreCase("true")?"1":"0";
			boolean success = settingsDao.saveUserMailAlertsSettings(objuserBean.getId()+"", product_promotions, daily_match_alerts, weekly_match_alerts, auto_login);
			if(success){
				jsonObj.put("message", "success");
			}else{
				jsonObj.put("message", "failed");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in saveUserMailAlertsSettings method  ");
		}
		return jsonObj.toString();
	}
	
	@RequestMapping(value = "/getMailAlertsSettings")
	public  @ResponseBody String getMailAlertsSettings(@ModelAttribute("settingsForm") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
	   JSONObject jsOnObj = new JSONObject();
	    
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			Map<String,Object> mail_settings = settingsDao.getMailAlertsSettings(sessionBean.getId()+"");
			if(mail_settings!=null){
				jsOnObj.put("message", "success");
				jsOnObj.put("settings", mail_settings);
			}else{
				jsOnObj.put("message", "failed");
				jsOnObj.put("settings", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			//logger.error(e);
			//logger.fatal("error in CreateProfile class createProfile method  ");
			jsOnObj.put("message", "failed");
		}
		return jsOnObj.toString();
	}
	/////////// pending task...methods to insert entries into user_settings for every user in users table
	
	@RequestMapping(value = "/saveContactFilterSettings")
	public @ResponseBody String  saveContactFilterSettings(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
		JSONObject jsonObj = new JSONObject();
		try {
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objuserBean == null){
				return "redirect:HomePage";
			}
			Map<String,String> filter_criteria = new HashMap<String,String>();
			String selected_contact_filter = request.getParameter("contact_filter");
			if(StringUtils.isNotBlank(selected_contact_filter) && selected_contact_filter.equalsIgnoreCase("filter")){
				filter_criteria.put("age_from", request.getParameter("age_from"));
				filter_criteria.put("age_to", request.getParameter("age_to"));
				String rMaritalStatus = objUsersBean.getrMaritalStatus();
				filter_criteria.put("marital_status", objUsersBean.getrMaritalStatus()==null || objUsersBean.getrMaritalStatus().equalsIgnoreCase("null")?"":objUsersBean.getrMaritalStatus());
				filter_criteria.put("religion", objUsersBean.getrReligion()==null || objUsersBean.getrReligion().equalsIgnoreCase("null")?"":objUsersBean.getrReligion());
				filter_criteria.put("caste", objUsersBean.getrCaste()==null || objUsersBean.getrCaste().equalsIgnoreCase("null")?"":objUsersBean.getrCaste());
				filter_criteria.put("mothertongue", objUsersBean.getrMotherTongue()==null || objUsersBean.getrMotherTongue().equalsIgnoreCase("null")?"":objUsersBean.getrMotherTongue());
				filter_criteria.put("country", objUsersBean.getrCountry()==null || objUsersBean.getrCountry().equalsIgnoreCase("null")?"":objUsersBean.getrCountry());
				filter_criteria.put("state", objUsersBean.getrState()==null || objUsersBean.getrState().equalsIgnoreCase("null")?"":objUsersBean.getrState());
				filter_criteria.put("city", objUsersBean.getrCity()==null || objUsersBean.getrCity().equalsIgnoreCase("null")?"":objUsersBean.getrCity());
			}
			boolean success = settingsDao.saveContactFilterSettings(objuserBean.getId()+"", selected_contact_filter, filter_criteria);
			if(success){
				jsonObj.put("message", "success");
				// put updated values back in session
				Map<String,Object> user_settings = settingsDao.getUserSettings(objuserBean.getId()+"");
				session.removeAttribute("user_settings");
				session.setAttribute("user_settings", user_settings);
			}else{
				jsonObj.put("message", "failed");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in saveContactFilterSettings method  ");
		}
		return jsonObj.toString();
	}
	
	@RequestMapping(value = "/getContactFilterSettings")
	public  @ResponseBody String getContactFilterSettings(@ModelAttribute("settingsForm") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
	   JSONObject jsOnObj = new JSONObject();
	    
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			Map<String,Object> contact_filter_settings = settingsDao.getContactFilterSettings(sessionBean.getId()+"");
			if(contact_filter_settings!=null){
				jsOnObj.put("message", "success");
				jsOnObj.put("settings", contact_filter_settings);
			}else{
				jsOnObj.put("message", "failed");
				jsOnObj.put("settings", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			//logger.error(e);
			//logger.fatal("error in CreateProfile class createProfile method  ");
			jsOnObj.put("message", "failed");
		}
		return jsOnObj.toString();
	}
	
	@RequestMapping(value = "/saveUnsubscribeFromCallingList")
	public @ResponseBody String  saveUnsubscribeFromCallingList(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
		JSONObject jsonObj = new JSONObject();
		try {
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objuserBean == null){
				return "redirect:HomePage";
			}
			String unsubscribe_from_val = request.getParameter("unsubscribe_from_val");
			boolean success = settingsDao.saveUnsubscribeFromCallingList(objuserBean.getId()+"", unsubscribe_from_val);
			if(success){
				jsonObj.put("message", "success");
			}else{
				jsonObj.put("message", "failed");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in saveUnsubscribeFromCallingList method  ");
		}
		return jsonObj.toString();
	}
	
	@RequestMapping(value = "/saveProfileSettings")
	public @ResponseBody String  saveProfileSettings(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
		JSONObject jsonObj = new JSONObject();
		try {
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objuserBean == null){
				return "redirect:HomePage";
			}
			String show_profile_to = request.getParameter("show_profile_to");
			String know_shortlisted_option = request.getParameter("know_shortlisted_option").equalsIgnoreCase("true")?"1":"0";
			boolean success = settingsDao.saveProfileSettings(objuserBean.getId()+"", show_profile_to, know_shortlisted_option);
			if(success){
				jsonObj.put("message", "success");
			}else{
				jsonObj.put("message", "failed");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in saveProfileSettings method  ");
		}
		return jsonObj.toString();
	}
	
	@RequestMapping(value = "/savePrivacySettings")
	public @ResponseBody String  savePrivacySettings(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
		JSONObject jsonObj = new JSONObject();
		try {
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objuserBean == null){
				return "redirect:HomePage";
			}
			String show_mobileno_to = request.getParameter("show_mobileno_to");
			boolean success = settingsDao.savePrivacySettings(objuserBean.getId()+"", show_mobileno_to);
			if(success){
				jsonObj.put("message", "success");
			}else{
				jsonObj.put("message", "failed");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in savePrivacySettings method  ");
		}
		return jsonObj.toString();
	}
	
	@RequestMapping(value = "/getUnsubscribeFromCallingList")
	public  @ResponseBody String getUnsubscribeFromCallingList(@ModelAttribute("settingsForm") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
	   JSONObject jsOnObj = new JSONObject();
	    
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			Map<String,Object> settings = settingsDao.getUserSettings(sessionBean.getId()+"");
			if(settings!=null){
				jsOnObj.put("message", "success");
				jsOnObj.put("settings", settings);
			}else{
				jsOnObj.put("message", "failed");
				jsOnObj.put("settings", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			//logger.error(e);
			//logger.fatal("error in CreateProfile class createProfile method  ");
			jsOnObj.put("message", "failed");
		}
		return jsOnObj.toString();
	}
	
	@RequestMapping(value = "/getProfileSettings")
	public  @ResponseBody String getProfileSettings(@ModelAttribute("settingsForm") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
	   JSONObject jsOnObj = new JSONObject();
	    
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			Map<String,Object> settings = settingsDao.getUserSettings(sessionBean.getId()+"");
			if(settings!=null){
				jsOnObj.put("message", "success");
				jsOnObj.put("settings", settings);
			}else{
				jsOnObj.put("message", "failed");
				jsOnObj.put("settings", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			//logger.error(e);
			//logger.fatal("error in CreateProfile class createProfile method  ");
			jsOnObj.put("message", "failed");
		}
		return jsOnObj.toString();
	}
	
	@RequestMapping(value = "/getPrivacySettings")
	public  @ResponseBody String getPrivacySettings(@ModelAttribute("settingsForm") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
	   JSONObject jsOnObj = new JSONObject();
	    
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			Map<String,Object> settings = settingsDao.getUserSettings(sessionBean.getId()+"");
			if(settings!=null){
				jsOnObj.put("message", "success");
				jsOnObj.put("settings", settings);
			}else{
				jsOnObj.put("message", "failed");
				jsOnObj.put("settings", "");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			//logger.error(e);
			//logger.fatal("error in CreateProfile class createProfile method  ");
			jsOnObj.put("message", "failed");
		}
		return jsOnObj.toString();
	}
	
	/***********   for one time use --- URL to run in the browser directly to intialise data in DB for existing users     ************/
	
}