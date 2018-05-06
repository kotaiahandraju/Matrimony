package com.aurospaces.neighbourhood.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
}