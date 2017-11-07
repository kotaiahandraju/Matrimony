package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.CityBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.CityDao;
import com.aurospaces.neighbourhood.db.dao.CountriesDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.EmailUtil;
import com.aurospaces.neighbourhood.util.MiscUtils;

@Controller
@RequestMapping(value="/admin")
public class FilterController {
	private Logger logger = Logger.getLogger(FilterController.class);
	@Autowired
	CountriesDao objCountriesDao;
	 @Autowired BranchDao objBranchDao;
   @Autowired UsersDao objUsersDao;
//   @Autowired UserDetailsDao objUserDetailsDao;
   @Autowired
	ServletContext objContext;
   @Autowired CityDao objCityDao;
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
   @RequestMapping(value = "/InactiveProfilesHome")
	public String InactiveProfilesHome(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		System.out.println("InactiveProfiles Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean,"inactive");
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
			logger.fatal("error in FilterController class InactiveProfilesHome method  ");
//			return "CreateProfile";
		}
		return "inactiveProfiles";
	}
   @RequestMapping(value = "/AdminRegisterProfiles")
  	public String AdminRegisterProfiles(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
  			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
  		System.out.println("AdminRegisterProfiles Page");
  		List<Map<String, String>> listOrderBeans = null;
  		ObjectMapper objectMapper = null;
  		String sJson = null;
  		try {
  			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean,"admin");
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
  			logger.fatal("error in FilterController class InactiveProfilesHome method  ");
//  			return "CreateProfile";
  		}
  		return "adminCreateProfile";
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
   @RequestMapping(value = "/updateStatus")
	public @ResponseBody String updateStatus( UsersBean objUsersBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
		System.out.println(" create Profile updateStatus page...");
		List<Map<String, String>> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean delete = false;
		String statusName= null;
		try{
			if(objUsersBean.getStatus() != "0" && objUsersBean.getStatusName() !=null){
				delete=	objUsersDao.updateStatus(objUsersBean);
				statusName = objUsersBean.getStatusName();
				if(delete){
					jsonObj.put("message", "Success");
				}else{
					jsonObj.put("message", "Faile");
				}
			}
				
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean,statusName);
			 objectMapper = new ObjectMapper();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				jsonObj.put("allOrders1", listOrderBeans);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
				jsonObj.put("allOrders1", listOrderBeans);
			}
		}catch(Exception e){
			e.printStackTrace();
	System.out.println(e);
			logger.error(e);
			logger.fatal("BranchController class deleteBodyType method  ");
			jsonObj.put("message", "excetption"+e);
			return String.valueOf(jsonObj);
			
		}
		return String.valueOf(jsonObj);
	}
   
   @RequestMapping(value = "/resetPassword")
	public @ResponseBody String resetPassword( UsersBean objUsersBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
		System.out.println(" resetPassword action...");
		List<Map<String, String>> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean updated = false;
		String statusName= null;
		try{
				objUsersBean.setPassword(MiscUtils.generateRandomString(6));
				updated=	objUsersDao.updatePassword(objUsersBean);
				try{
					EmailUtil emailUtil = new EmailUtil();
					emailUtil.sendResetPasswordEmail(objUsersBean, objContext, "admin_reset_password");
				}catch(Exception e) {
					e.printStackTrace();
				}
				if(updated){
					jsonObj.put("message", "Reset Password Success");
				}else{
					jsonObj.put("message", "Reset Password Failed");
				}
		}catch(Exception e){
			e.printStackTrace();
	System.out.println(e);
			logger.error(e);
			//logger.fatal("BranchController class deleteBodyType method  ");
			jsonObj.put("message", "excetption:"+e);
			return String.valueOf(jsonObj);
			
		}
		return String.valueOf(jsonObj);
	}
   
   @RequestMapping(value = "/FreeRegisterProfile")
  	public String freeRegisterProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
  			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
  		System.out.println("getAllProfiles Page");
  		List<Map<String, String>> listOrderBeans = null;
  		ObjectMapper objectMapper = null;
  		String sJson = null;
  		try {
  			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean,"free");
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
  		return "freeRegisterProfile";
  	}
   @RequestMapping(value = "/PremiumProfile")
 	public String premiumProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
 			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
 		System.out.println("getAllProfiles Page");
 		List<Map<String, String>> listOrderBeans = null;
 		ObjectMapper objectMapper = null;
 		String sJson = null;
 		try {
 			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean,"premium");
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
 		return "premiumProfile";
 	}
  
   
}
