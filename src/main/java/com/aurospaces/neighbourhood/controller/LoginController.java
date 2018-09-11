package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.CastBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.ReligionBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.CastDao;
import com.aurospaces.neighbourhood.db.dao.StateDao;
import com.aurospaces.neighbourhood.db.dao.UserSettingsDao;
import com.aurospaces.neighbourhood.db.dao.UserrequirementDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.EmailUtil;
import com.aurospaces.neighbourhood.util.HRMSUtil;
import com.aurospaces.neighbourhood.util.MiscUtils;
import com.aurospaces.neighbourhood.util.SendSMS;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Controller
public class LoginController {
	private Logger logger = Logger.getLogger(LoginController.class);
	@Autowired
	UsersDao objUsersDao;
	@Autowired UserrequirementDao objUserrequirementDao;
	@Autowired StateDao stateDao;
	 @Autowired CastDao objCastDao;
	@Autowired UserSettingsDao settingsDao;
	 @Autowired	ServletContext objContext;
	
	@RequestMapping(value = "/LoginHome")
	public String LoginHome(Map<String, Object> model1, ModelMap model, HttpServletRequest request,
			HttpSession session) throws JsonGenerationException, JsonMappingException, IOException {
//		System.out.println("LoginHome page...");
		LoginBean loginBean = new LoginBean();
		model.put("loginForm", loginBean);
		try {
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				int rolId =objuserBean.getRoleId();
				if(rolId == 1 ){
					return "redirect:admin/BodyTypeHome";
				}else{
//					return "redirect:employeeHome1.htm";
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "loginPage";
	}

	@RequestMapping(value = "/loginAction")
	public  String loginAction(@Valid @ModelAttribute("loginForm") LoginBean userObj, BindingResult result,
			ModelMap model, HttpServletRequest request, HttpSession session, HttpServletResponse responses,RedirectAttributes redirect)
					throws JsonGenerationException, JsonMappingException, IOException {
//		System.out.println("loginAction page...");
		UsersBean objUserBean = null;
		JSONObject obj = new JSONObject();
		String object1 = null;
		try {
			if (result.hasErrors()) {
//				model.addAttribute("newUser", userObj);
				return "loginPage";
			}
			objUserBean = objUsersDao.loginChecking(userObj);
			if (objUserBean != null ) {
				
				return this.setInitialData(objUserBean, session);
					
			} else {
				redirect.addFlashAttribute("msg", "Login Failed");
				return "redirect:HomePage";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return object1;
	}

	@RequestMapping(value = "/logoutHome")
	public String logoutHome(ModelMap model, HttpServletRequest request, HttpSession objSession,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, IOException {
//		System.out.println("logout page...");
		try {

			HttpSession session = request.getSession(false);
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheGuest");
			if (objuserBean != null) {
				objUsersDao.updateLoginTime(objuserBean,"0");
			}
				session.removeAttribute("cacheUserBean");
				session.removeAttribute("cacheGuest");
				session.removeAttribute("rolId");
				session.removeAttribute("userName");
				session.invalidate();
				response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");// HTTP
																							// 1.1
				response.setHeader("Pragma", "no-cache"); // HTTP 1.0
				response.setDateHeader("Expires", -1); // prevents caching at
														// the proxy server
				// String baseUrl = MiscUtils.getBaseUrl(request);
				// System.out.println(baseUrl);
				// response.sendRedirect(baseUrl+"/LoginHome1.htm" );
//				response.sendRedirect(request.getContextPath() + "/LoginHome");
			//}
			return "redirect:HomePage";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return "LoginHome";
	}
	
	@RequestMapping(value = "/HomePage")
	public String CreateProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("Home Page");
		try {
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				int rolId =objuserBean.getRoleId();
				if(rolId == 1 ){
					return "redirect:admin/dashboard";
				}
			}else{
				objuserBean = (UsersBean) session.getAttribute("cacheGuest");
				if (objuserBean != null) {
					
						return "redirect:users/dashboard";
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
		}
		return "homepage";
	}
	
	@RequestMapping(value = "/userRegistration")
	public String userRegistration(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
//		System.out.println("userRegistration Page");
		String ipAddress = null;
		try {
			ipAddress =MiscUtils.getClientIpAddress(request);
			if(StringUtils.isNotBlank(ipAddress)){
				objUsersBean.setLast_ip(ipAddress);
			}
			Date dob1 = HRMSUtil.dateFormate(objUsersBean.getDob());
			if(dob1 !=null){
				objUsersBean.setDob1(dob1);
			}
			objUsersBean.setRoleId(4);
			objUsersBean.setStatus("0");
			objUsersBean.setUsername("AM"+MiscUtils.generateRandomNumber(6));
			UsersBean userbean = objUsersDao.emailExistOrNot(objUsersBean);
			if(userbean != null){	
				request.setAttribute("msg", "Email Already Exist ");
				return "homepage";
			}
			if(StringUtils.isNotBlank(objUsersBean.getEmail())){
			objUsersDao.save(objUsersBean);
			int id= objUsersBean.getId();
			objUsersBean.setUserId(id);
			objUserrequirementDao.save(objUsersBean);
			objUsersBean.setId(id);
//			objUserDetailsDao.save(objUsersBean);
			session.setAttribute("cacheGuest", objUsersBean);
//			response.sendRedirect("profile?gp=page_1");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
		}
		return "redirect:users/profile.htm?page=1";
	}
	
	@RequestMapping(value = "/emailChecking")
	public @ResponseBody String emailChecking(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
//		System.out.println("emailChecking Page");
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
	
	@ModelAttribute("religion")
	public Map<Integer, String> populatereligion() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from religion  where status='1' order by name asc";
			List<EducationBean> list = objUsersDao.populate(sSql);
			for (EducationBean bean : list) {
				statesMap.put(bean.getId(), bean.getName());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	
	@ModelAttribute("religionList")
	public Map<String,Integer> homePageReligion(HttpServletRequest request) {
		Map<String, Integer> statesMap = new LinkedHashMap<String,Integer>();
		try {
			String sSql = "select id,name from religion  where status='1' order by name asc";
			List<EducationBean> list = objUsersDao.populate(sSql);
			for (EducationBean bean : list) {
				statesMap.put( bean.getName(),bean.getId());
				request.setAttribute("religionList", statesMap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	@ModelAttribute("castList")
	public Map<String,Integer> homePageCast(HttpServletRequest request) {
		Map<String,Integer> statesMap = new LinkedHashMap<String,Integer>();
		try {
			String sSql = "select id,name from cast  where status='1' order by name asc";
			List<EducationBean> list = objUsersDao.populate(sSql);
			for (EducationBean bean : list) {
				statesMap.put(bean.getName(),bean.getId());
				request.setAttribute("castList", statesMap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	@ModelAttribute("cast")
	public Map<Integer, String> populatecast() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from cast  where status='1' order by name asc";
			List<EducationBean> list = objUsersDao.populate(sSql);
			for (EducationBean bean : list) {
				statesMap.put(bean.getId(), bean.getName());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	
	@ModelAttribute("language")
	public Map<Integer, String> populatelanguage() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from language  where status='1' order by name asc";
			List<EducationBean> list = objUsersDao.populate(sSql);
			for (EducationBean bean : list) {
				statesMap.put(bean.getId(), bean.getName());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	
	@ModelAttribute("countries")
	public Map<Integer, String> populatecountries() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from countries  where status='1' order by name asc";
			List<EducationBean> list = objUsersDao.populate(sSql);
			for (EducationBean bean : list) {
				statesMap.put(bean.getId(), bean.getName());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	
	public String setInitialData(UsersBean objUserBean,HttpSession session){
		//update login time
		objUsersDao.updateLoginTime(objUserBean,"1");
		
			Map<String,Object> user_settings = settingsDao.getUserSettings(objUserBean.getId()+"");
			session.setAttribute("user_settings", user_settings);
			Map<String,Object> interestCounts = objUsersDao.getInterestCounts(objUserBean);
			long notificationsCount = (Long)interestCounts.get("notificationsCount");
			// get the logged in users's photos
			List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(objUserBean.getId());
			session.setAttribute("logged_in_user_photosList", photosList);
			if(objUserBean.getStatus().equals("1")){
				session.setAttribute("notificationsCount", notificationsCount);
				List<Map<String,Object>> notificationsList = objUsersDao.getNotifications(objUserBean,false);
				if(notificationsList!=null && notificationsList.size()>0){
					session.setAttribute("notificationsList", notificationsList);
				}else{
					session.setAttribute("notificationsList", "");
				}
				objUserBean.setSentInterestCount((String.valueOf(interestCounts.get("sentInterestCount"))));
				objUserBean.setAwaitingInterestCount((String.valueOf(interestCounts.get("awaitingInterestCount"))));
				objUserBean.setReceivedInterestCount((String.valueOf(interestCounts.get("receivedInterestCount"))));
				objUserBean.setAcceptedInterestCount((String.valueOf(interestCounts.get("acceptedInterestCount"))));
				objUserBean.setProfileViewedCount((String.valueOf(interestCounts.get("profileViewedCount"))));
				
				objUserBean.setRejectedInterestCount((String.valueOf(interestCounts.get("rejectedInterestCount"))));
				objUserBean.setProfilesViewedByMeCount((String.valueOf(interestCounts.get("profilesViewedByMeCount"))));
				objUserBean.setMobileNumViewedCount((String.valueOf(interestCounts.get("mobileNumViewedCount"))));
				objUserBean.setMobileNumViewedByMeCount((String.valueOf(interestCounts.get("mobileNumViewedByMeCount"))));
				objUserBean.setPendingRequestsCount((String.valueOf(interestCounts.get("pendingRequestsCount"))));
				objUserBean.setYetToBeViewedCount((String.valueOf(interestCounts.get("yetToBeViewedCount"))));
				objUserBean.setViewedNotContactedCount((String.valueOf(interestCounts.get("viewedNotContactedCount"))));
				objUserBean.setShortListedCount((String.valueOf(interestCounts.get("shortListedCount"))));
				session.setAttribute("default_text_option", interestCounts.get("default_text_option"));
				session.setAttribute("mail_default_text", interestCounts.get("mail_default_text"));
		}else{
			session.setAttribute("notificationsCount", 0);
			objUserBean.setSentInterestCount("0");
			objUserBean.setReceivedInterestCount("0");
			objUserBean.setAcceptedInterestCount("0");
			objUserBean.setProfileViewedCount("0");
			objUserBean.setRejectedInterestCount("0");
			objUserBean.setProfilesViewedByMeCount((String.valueOf(interestCounts.get("profilesViewedByMeCount"))));
			objUserBean.setMobileNumViewedCount("0");
			objUserBean.setMobileNumViewedByMeCount("0");
			objUserBean.setPendingRequestsCount("0");
			objUserBean.setYetToBeViewedCount((String.valueOf(interestCounts.get("yetToBeViewedCount"))));
			objUserBean.setViewedNotContactedCount((String.valueOf(interestCounts.get("viewedNotContactedCount"))));
			objUserBean.setShortListedCount("0");
			session.setAttribute("notificationsList", "");
			session.setAttribute("default_text_option", "0");
			session.setAttribute("mail_default_text", "");
		}
		
		if(objUserBean.getRoleId() ==1 || objUserBean.getRoleId() == 3){
			session.setAttribute("cacheUserBean", objUserBean);
			session.setAttribute("rolId", objUserBean.getRoleId());
			session.setAttribute("userName", objUserBean.getUsername());
			//get payment notifications 
			List<Map<String,Object>> paymentNotificationsList = objUsersDao.getAdminNotifications("payment",false);
			if(paymentNotificationsList!=null && paymentNotificationsList.size()>0){
				session.setAttribute("paymentNotificationsList", paymentNotificationsList);
			}else{
				session.setAttribute("paymentNotificationsList", "");
			}
			return "redirect:admin/dashboard";
		}else if(objUserBean.getRoleId() == 4){
			
			String otpStatus = objUsersDao.getOtpStatus(objUserBean);
			
			objUserBean.setOtpStatus(otpStatus);
			session.setAttribute("allowed_profiles_limit", "0");
			session.setAttribute("cacheGuest", objUserBean);
			session.setAttribute("rolId", objUserBean.getRoleId());
			session.setAttribute("userName", objUserBean.getUsername());
			session.setAttribute("otpStatus", otpStatus);
			session.setAttribute("upgrade_msg_flag", "1");
			
			int filled_status = objUsersDao.getProfileFilledStatus(objUserBean);
			if(StringUtils.isBlank(objUserBean.getCurrentState()) ||
			   StringUtils.isBlank(objUserBean.getMaritalStatus()) ||
			   StringUtils.isBlank(objUserBean.getCaste())){
				return "redirect:users/profile.htm?page=1";
			}
			filled_status += 15;
			if(StringUtils.isBlank(objUserBean.getEducation()) ||
			   StringUtils.isBlank(objUserBean.getOccupation())){
				return "redirect:users/profile.htm?page=2";
			}
			filled_status += 15;
			if(StringUtils.isBlank(objUserBean.getHeight()) ||
					StringUtils.isBlank(objUserBean.getSmoking()) ||
					StringUtils.isBlank(objUserBean.getDrinking()) ||
					StringUtils.isBlank(objUserBean.getMobile())){
				return "redirect:users/profile.htm?page=3";
			}
			filled_status += 15;
			session.setAttribute("profile_filled_status", filled_status);
			if(StringUtils.isBlank(otpStatus) || "0".equals(otpStatus)){
				if(StringUtils.isBlank(objUserBean.getAboutMyself())){
					return "redirect:users/profile.htm?page=4";
				}
				
				if(StringUtils.isBlank(objUserBean.getFatherName())){
					return "redirect:users/family-details";
				}
				if(StringUtils.isBlank(objUserBean.getImage())){
					return "redirect:users/uploadPhotos";
				}
				if(StringUtils.isBlank(objUserBean.getrAgeFrom()) && StringUtils.isBlank(objUserBean.getrAgeTo()) &&
						StringUtils.isBlank(objUserBean.getrMaritalStatus()) ){
					return "redirect:users/partner-profile";
				}
				return "redirect:users/sendOtp";
			}else
				return "redirect:users/dashboard";
			//}
			
		}else if(objUserBean.getRoleId() != 4){
			String allowed_profiles_limit = objUsersDao.getAllowedProfilesLimit(objUserBean.getId());
			session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
			session.setAttribute("cacheGuest", objUserBean);
			session.setAttribute("rolId", objUserBean.getRoleId());
			session.setAttribute("userName", objUserBean.getUsername());
			//session.setAttribute("profile_filled_status", "100");
			int filled_status = objUsersDao.getProfileFilledStatus(objUserBean);
			
			if(StringUtils.isBlank(objUserBean.getMaritalStatus())){
				return "redirect:users/profile.htm?page=1";
			}
			filled_status += 15;
			if(StringUtils.isBlank(objUserBean.getEducation())){
				return "redirect:users/profile.htm?page=2";
			}
			filled_status += 15;
			if(StringUtils.isBlank(objUserBean.getHeight())){
				return "redirect:users/profile.htm?page=3";
			}
			filled_status += 15;
			if(StringUtils.isBlank(objUserBean.getAboutMyself()) && StringUtils.isBlank(objUserBean.getDisability())){
				//return "redirect:profile.htm?page=4";
			}
			session.setAttribute("profile_filled_status", filled_status);
			String otpStatus = objUsersDao.getOtpStatus(objUserBean);
			if(StringUtils.isBlank(otpStatus) || "0".equals(otpStatus)){
				return "redirect:users/sendOtp";
			}else
				return "redirect:users/dashboard";
		}else{
			session.setAttribute("cacheGuest", objUserBean);
			session.setAttribute("rolId", objUserBean.getRoleId());
			session.setAttribute("userName", objUserBean.getUsername());
			return "redirect:users/profile.htm?page=1";
		}
	}
	@RequestMapping(value = "/insertUserSettings")
	public  String insertUserSettings(Model objeModel ,
			HttpServletRequest request, HttpSession session) {
	   JSONObject jsOnObj = new JSONObject();
	    
		try {
			
			settingsDao.insertSettings();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			//logger.error(e);
			//logger.fatal("error in CreateProfile class createProfile method  ");
			jsOnObj.put("message", "failed");
		}
		return null;
	}
	 @RequestMapping(value = "/homePageSearchResults")
	 public  @ResponseBody String getHomePageSearchResults( UsersBean searchCriteriaBean, Model objeModel, HttpServletRequest request, HttpSession session) {
			List<Map<String,Object>> searchList=null;
		 ObjectMapper objectMapper = null;
		String sJson = null;
		JSONObject objJson =new JSONObject();
		try {
			
			 searchList = objUsersDao.getHomeSearchResult(searchCriteriaBean);
			 if(searchList != null && searchList.size()>0) {
			 objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(searchList);
				objJson.put("searchListOrders", searchList);
			 }else {
				 objJson.put("searchListOrders", "");
			 }
			 
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class homePageSearch method");
	  }
		return String.valueOf(objJson);
	 }
	 
	 @RequestMapping(value = "/homePageReligionAndCast")
	 public  @ResponseBody String getHomePageSearchResults1( UsersBean searchCriteriaBean, Model objeModel, HttpServletRequest request, HttpSession session) {
			List<Map<String,Object>> searchList=null;
		 ObjectMapper objectMapper = null;
		String sJson = null;
		JSONObject objJson =new JSONObject();
		String inputVal = request.getParameter("list_type");
		try {
			
			 searchList = objUsersDao.getHomeSearchResult1(searchCriteriaBean,inputVal);
			 if(searchList != null && searchList.size()>0) {
			 objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(searchList);
				objJson.put("searchListOrders", searchList);
			 }else {
				 objJson.put("searchListOrders", "");
			 }
			 
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class homePageSearch method");
	  }
		return String.valueOf(objJson);
	 }
	   @RequestMapping(value = "/forgotPassword")
		public String forgotPassword(@ModelAttribute("forgotPassword") UsersBean objUsersBean, Model objeModel ,
				HttpServletRequest request, HttpSession session) {

			try {
				
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				//logger.error(e);
				//logger.fatal("error in CreateProfile class createProfile method  ");
				return "redirect:HomePage.htm";
			}
			return "forgotPassword";
		}
	   
	   @RequestMapping(value = "/forgotPasswordPreAction")
		public  @ResponseBody String forgotPasswordPreAction(@ModelAttribute("forgotPassword") UsersBean objUsersBean, Model objeModel ,
				HttpServletRequest request, HttpSession session) {
		   JSONObject jsOnObj = new JSONObject();
		   String emailStr = "",mobileStr=""; 
			try {
				String inputVal = request.getParameter("forgotPasswordInput");
				if(StringUtils.isNotBlank(inputVal)){
					UsersBean userBean = objUsersDao.getUser(inputVal.trim());
					session.setAttribute("userBean", userBean);
					if(userBean == null){
						jsOnObj.put("message", "no-data");
					}else{
						String email = userBean.getEmail();
						emailStr = email.substring(email.indexOf("@")-3);
						String mobileNum = userBean.getMobile();
						if(StringUtils.isNotBlank(mobileNum)){
							mobileStr = mobileNum.substring(mobileNum.length()-3);
						}
						session.setAttribute("emailStr", emailStr);
						session.setAttribute("mobileStr", mobileStr);
					}
				}
				jsOnObj.put("emailStr", emailStr);
				jsOnObj.put("mobileStr", mobileStr);
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				//logger.error(e);
				//logger.fatal("error in CreateProfile class createProfile method  ");
				return "redirect:HomePage.htm";
			}
			return jsOnObj.toString();
		}
	   @RequestMapping(value = "/forgotPasswordAction")
		public  String forgotPasswordAction(@ModelAttribute("forgotPassword") UsersBean objUsersBean, Model objeModel ,
				HttpServletRequest request, HttpSession session) {
		   JSONObject jsOnObj = new JSONObject();
		   String emailStr = "",mobileStr=""; 
			try {
					String selectedOption = request.getParameter("sendTo");
					UsersBean userBean = (UsersBean)session.getAttribute("userBean");
					userBean.setPassword(MiscUtils.generateRandomString(6));
					boolean updated = objUsersDao.updatePassword(userBean);
					if("emailTo".equalsIgnoreCase(selectedOption)){
						try {
							EmailUtil emailUtil = new EmailUtil();
							emailUtil.sendResetPasswordEmail(userBean, objContext, "forgot_password");
							request.setAttribute("sentToStr", "email id xxxxxxxx"+session.getAttribute("emailStr"));
							request.setAttribute("message", "success");
						} catch (Exception e) {
							e.printStackTrace();
							request.setAttribute("message", "failed");
						}
						if (!updated) {
							
							request.setAttribute("message", "failed");
						}
					}else if("smsTo".equalsIgnoreCase(selectedOption)){
						try{
							   String response = SendSMS.sendSMS("New password has been generated for your Aarna Matrimony account "+userBean.getEmail()+". \n New password: "+userBean.getPassword(),userBean.getMobile());
							   
							   if("OK".equalsIgnoreCase(response)){
								   request.setAttribute("sentToStr", "mobile number xxxxxxx"+session.getAttribute("mobileStr"));
								   request.setAttribute("message", "success");
							   }else{
								   request.setAttribute("message", "failed"); 
							   }
							   //throw new Exception();
						   }catch(Exception e){
							   e.printStackTrace();
							   request.setAttribute("message", "failed");
							   //objUsersDao.delete(sessionBean.getId());
						   }
					}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				//logger.error(e);
				//logger.fatal("error in CreateProfile class createProfile method  ");
				return "redirect:HomePage.htm";
			}
			return "forgotPasswordSuccess";
		}
	   @RequestMapping(value = "/castesBasedOnReligion")
		public @ResponseBody String castesBasedOnReligion(ReligionBean religionBean,
				HttpServletResponse response, HttpServletRequest request,
				HttpSession objSession) throws JsonGenerationException, JsonMappingException, IOException 
		{
		   JSONObject objJson =new JSONObject();
			List<Map<String, Object>> filterBean=null;
			String json="";
			String religionId =religionBean.getReligionId();
			
			ObjectMapper objmapper=new ObjectMapper();
			filterBean =  objCastDao.getCastesBasedOnReligion(religionId);
			if(filterBean.size()>0) {
				json=objmapper.writeValueAsString(filterBean);
				objJson.put("allOrders1", filterBean);
			}else {
				objJson.put("allOrders1", "");
				System.out.println();
			}
			
			
		  return String.valueOf(objJson);

		}
	   @RequestMapping(value = "/successStory&*")
		public String successStory() {
			
			return "successStory";
		}
	   
	   @RequestMapping(value = "/fullProfile")
		 public String fullProfile(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
		   String sender_username = request.getParameter("un");
			String profile_username = request.getParameter("pun");
			String sender_unique_code = request.getParameter("suc");
			String profile_unique_code = request.getParameter("puc");
		   UsersBean senderBean = objUsersDao.getUser(sender_username.trim());
			UsersBean profileBean = objUsersDao.getUser(profile_username.trim());
			if(senderBean.getUnique_code().equals(sender_unique_code) && profileBean.getUnique_code().equals(profile_unique_code)){
				LoginBean userObj = new LoginBean();
				userObj.setUserName(sender_username);
				userObj.setPassword(senderBean.getPassword());
				UsersBean objUserBean = objUsersDao.loginChecking(userObj);
				this.setInitialData(objUserBean, session);
				objUserssBean.setId(profileBean.getId());// for local use
			}else{
				return "redirect:HomePage";
			}
		   return "redirect:users/fullProfile?un="+sender_username+"&pun="+profile_username+"&suc="+sender_unique_code+"&puc="+profile_unique_code+"";
		 }
	   
	   /*****     back-end jobs    start       ********//*
	   @RequestMapping(value="/weeklyMatchEmails")
	   public String weeklyMatchEmails(HttpSession session,HttpServletRequest request){
		   UsersBean userSessionBean = (UsersBean) session.getAttribute("cacheGuest");
		   if(userSessionBean==null)
			   return "redirect:HomePage";
		   List<Map<String,Object>> activeProfilesList = objUsersDao.getAllSubscribedUsersForWeeklyMatchEmails();
		   for(Map<String,Object> profile:activeProfilesList){
			   UsersBean receiverBean = new UsersBean();
			   receiverBean.setId((Integer)profile.get("id"));
			   receiverBean.setUsername((String)profile.get("username"));
			   receiverBean.setUnique_code((String)profile.get("unique_code"));
			   Object emailId = profile.get("email");
			   receiverBean.setEmail((String)emailId);
			   List<Map<String,String>> preferredProfiles = objUsersDao.getProfilesFilteredByPreferences(profile);
			   try{
				   EmailUtil.sendProfilesListEmail(receiverBean,preferredProfiles, "profiles_list_email",objContext,request);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
			   
		   }
		   
		   return "";
	   }
	   
	 
	   *//*****     Not required in current release -- as per client      ************//*
	   
	   @RequestMapping(value="/dailyMatchEmails")
	   public String dailyMatchEmails(HttpSession session,HttpServletRequest request){
		   List<Map<String,Object>> activeProfilesList = objUsersDao.getAllSubscribedUsersForDailyMatchEmails();
		   for(Map<String,Object> profile:activeProfilesList){
			   UsersBean receiverBean = new UsersBean();
			   receiverBean.setId((Integer)profile.get("id"));
			   receiverBean.setUsername((String)profile.get("username"));
			   receiverBean.setUnique_code((String)profile.get("unique_code"));
			   Object emailId = profile.get("email");
			   receiverBean.setEmail((String)emailId);
			   List<Map<String,String>> preferredProfiles = objUsersDao.getProfilesFilteredByPreferences(profile);
			   try{
				   EmailUtil.sendProfilesListEmail(receiverBean,preferredProfiles, "profiles_list_email",objContext,request);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
			   
		   }
		   
		   return "";
	   }
	   
	   
	    * 
	    * checks the validity of each paid member and updates his status accordingly
	    
	   @RequestMapping(value="/checkMembershipValidity")
	   public void checkMembershipValidity(HttpSession session,HttpServletRequest request){
		   
		   int updated_count = objUsersDao.updateMembershipStatusBasedOnValidity();
		   
			   System.out.println("Membership plan duration completed for:"+updated_count+": members");
		   
		   
	   }
	   
	    * Total profiles list should be divided equally  among all the employees of aarna matrimony
	    
	   @RequestMapping(value="/splitProfilesToEmployees")
	   public String splitProfilesToEmployees(HttpSession session,HttpServletRequest request){
		   try{
			   int free_users_count = 100;//objUsersDao.getFreeMembersCount();
			   List<Map<String, Object>> emp_list = objUsersDao.getEmployeesList();
			   int slot_size = 0;
			   if(emp_list!=null && emp_list.size()>0){
				   slot_size = free_users_count/emp_list.size();
			   }
			   int start_index = 1;
			   for(Map<String,Object> emp:emp_list){
				   objUsersDao.updateEmployeeProfilesSlot((Integer)emp.get("id"), start_index, slot_size);
				   start_index += slot_size;
			   }
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   
		   
		   return "";
	   }
	   
	   
	    * To rotate the profiles_slots  among the employees...this script runs every month end.
	    * Before running this URL..run 'splitProfilesToEmployees' URL
	    
	   @RequestMapping(value="/rotateEmployeesProfilesSlot")
	   public String rotateEmployeesProfilesSlot(HttpSession session,HttpServletRequest request){
		   try{
			   int free_users_count = objUsersDao.getFreeMembersCount(); 
			   objUsersDao.rotateEmployeesProfilesSlot(free_users_count);
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   
		   
		   return "";
	   }
	   
	   
	    * 
	    
	   @RequestMapping(value="/createActivityLogDataForOldReqs")
	   public String createActivityLogDataForOldReqs(HttpSession session,HttpServletRequest request){
		   try{
			   List<Map<String,Object>> old_requests = objUsersDao.getOldRequests(); 
			   for(Map<String,Object> req:old_requests){
				   StringBuffer buffer = new StringBuffer("");
					try{
						String status = (String)req.get("status");
						String mobile_no_viewed_status = (String)req.get("mobile_no_viewed_status");
						String message_sent_status = (String)req.get("message_sent_status");
						String message_status = (String)req.get("message_status");
						if(status.equalsIgnoreCase("1")){
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','interest_request',"+req.get("user_id")+","+req.get("profile_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
						}
						if(status.equalsIgnoreCase("2")){
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','interest_request',"+req.get("user_id")+","+req.get("profile_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
							
							buffer = new StringBuffer("");
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','interest_accepted',"+req.get("profile_id")+","+req.get("user_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
						}
						if(status.equalsIgnoreCase("3")){
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','interest_request',"+req.get("user_id")+","+req.get("profile_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
							
							buffer = new StringBuffer("");
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','interest_rejected',"+req.get("profile_id")+","+req.get("user_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
						}
						if(mobile_no_viewed_status.equalsIgnoreCase("1")){
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','mobile_no_viewed',"+req.get("user_id")+","+req.get("profile_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
						}
						if(message_sent_status.equalsIgnoreCase("1")){
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','email',"+req.get("user_id")+","+req.get("profile_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
						}
						if(message_status.equalsIgnoreCase("1")){
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','email',"+req.get("user_id")+","+req.get("profile_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
							
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','message_accepted',"+req.get("user_id")+","+req.get("profile_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
						}
						if(message_status.equalsIgnoreCase("2")){
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','email',"+req.get("user_id")+","+req.get("profile_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
							
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','message_replied',"+req.get("profile_id")+","+req.get("user_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
						}
						if(message_status.equalsIgnoreCase("3")){
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','email',"+req.get("user_id")+","+req.get("profile_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
							
							buffer.append("insert into users_activity_log(created_time,activity_type,act_done_by_user_id,act_done_on_user_id) "
									+" values('"+req.get("created_on")+"','message_rejected',"+req.get("profile_id")+","+req.get("user_id")+")");
							objUsersDao.createActivityLogEntry(buffer.toString());
						}
						
						//boolean inserted = objUsersDao.createActivityLogEntry(buffer.toString());
						
					}catch(Exception e){
						e.printStackTrace();
					} 
			   }
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   
		   
		   return "";
	   }
	   
	   @RequestMapping(value="/sendEmails")
	   public String sendEmails(HttpSession session,HttpServletRequest request){
		   new EmailUtil().sendEmails(session, request, objContext,objUsersDao);
		   return "";
	   }
	   */
	   /*****     back-end jobs   end        ********/
}
