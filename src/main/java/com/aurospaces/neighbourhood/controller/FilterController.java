package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.CountriesDao;
import com.aurospaces.neighbourhood.db.dao.UserDetailsDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;

@Controller
@RequestMapping(value="/admin")
public class FilterController {
	private Logger logger = Logger.getLogger(FilterController.class);
	@Autowired
	CountriesDao objCountriesDao;
	 @Autowired BranchDao objBranchDao;
   @Autowired UsersDao objUsersDao;
   @Autowired UserDetailsDao objUserDetailsDao;
   @Autowired
	ServletContext objContext;
   @RequestMapping(value = "/AllProfilesHome")
	public String getAllProfiles(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		System.out.println("getAllProfiles Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean,"all");
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CountriesController class CountriesHome method  ");
			return "CreateProfile";
		}
		return "allProfiles";
	}
   @RequestMapping(value = "/DeleteProfilesHome")
	public String DeleteProfilesHome(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		System.out.println("getAllProfiles Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean,"delete");
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CountriesController class CountriesHome method  ");
			return "CreateProfile";
		}
		return "deleteProfiles";
	}

}
