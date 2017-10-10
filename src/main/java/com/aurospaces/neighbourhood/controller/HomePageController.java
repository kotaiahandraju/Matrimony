package com.aurospaces.neighbourhood.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.bean.ContriesBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.CountriesDao;
import com.aurospaces.neighbourhood.db.dao.UserDetailsDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.MiscUtils;

@Controller
public class HomePageController {
	private Logger logger = Logger.getLogger(CreateProfileController.class);
	@Autowired
	CountriesDao objCountriesDao;
	 @Autowired BranchDao objBranchDao;
   @Autowired UsersDao objUsersDao;
   @Autowired UserDetailsDao objUserDetailsDao;
   @Autowired
	ServletContext objContext;
	@RequestMapping(value = "/HomePage")
	public String CreateProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
		System.out.println("CreateProfile Page");
		try {
//			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
			return "countriesHome";
		}
		return "homepage";
	}
	
	@RequestMapping(value = "/emailChecking")
	public @ResponseBody String emailChecking(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
		System.out.println("emailChecking Page");
		JSONObject objJson = new JSONObject();
		
		try {
			UsersBean userbean = objUsersDao.emailExistOrNot(objUsersBean);
			if(userbean == null){
				objJson.put("msg", "notexist");
			}else{
				objJson.put("msg", "exist");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
			objJson.put("msg", e);
		}
		return String.valueOf(objJson);
	}
	
	@RequestMapping(value = "/userRegistration")
	public String userRegistration(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
		System.out.println("userRegistration Page");
		
		try {
			
			UsersBean userbean = objUsersDao.emailExistOrNot(objUsersBean);
			if(userbean != null){
				request.setAttribute("mesg", "1");
				return "homepage";
			}
			objUsersDao.save(objUsersBean);
			objUserDetailsDao.save(objUsersBean);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
		}
		return "registration";
	}
}
