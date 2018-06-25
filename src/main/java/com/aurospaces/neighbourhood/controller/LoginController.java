package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.StateDao;
import com.aurospaces.neighbourhood.db.dao.UserSettingsDao;
import com.aurospaces.neighbourhood.db.dao.UserrequirementDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Controller
public class LoginController {
	@Autowired
	UsersDao objUsersDao;
	@Autowired UserrequirementDao objUserrequirementDao;
	@Autowired StateDao stateDao;
	@Autowired UserSettingsDao settingsDao;
	
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
			session.setAttribute("allowed_profiles_limit", 0);
			session.setAttribute("cacheGuest", objUserBean);
			session.setAttribute("rolId", objUserBean.getRoleId());
			session.setAttribute("userName", objUserBean.getUsername());
			session.setAttribute("otpStatus", otpStatus);
			session.setAttribute("upgrade_msg_flag", "1");
			
			int filled_status = objUsersDao.getProfileFilledStatus(objUserBean);
			if(StringUtils.isBlank(objUserBean.getCurrentState()) ||
			   StringUtils.isBlank(objUserBean.getMaritalStatus()) ||
			   StringUtils.isBlank(objUserBean.getCaste())){
				return "redirect:profile.htm?page=1";
			}
			filled_status += 15;
			if(StringUtils.isBlank(objUserBean.getEducation()) ||
			   StringUtils.isBlank(objUserBean.getOccupation())){
				return "redirect:profile.htm?page=2";
			}
			filled_status += 15;
			if(StringUtils.isBlank(objUserBean.getHeight()) ||
					StringUtils.isBlank(objUserBean.getSmoking()) ||
					StringUtils.isBlank(objUserBean.getDrinking()) ||
					StringUtils.isBlank(objUserBean.getMobile())){
				return "redirect:profile.htm?page=3";
			}
			filled_status += 15;
			session.setAttribute("profile_filled_status", filled_status);
			if(StringUtils.isBlank(otpStatus) || "0".equals(otpStatus)){
				if(StringUtils.isBlank(objUserBean.getAboutMyself())){
					return "redirect:profile.htm?page=4";
				}
				
				if(StringUtils.isBlank(objUserBean.getFatherName())){
					return "redirect:family-details";
				}
				if(StringUtils.isBlank(objUserBean.getImage())){
					return "redirect:uploadPhotos";
				}
				if(StringUtils.isBlank(objUserBean.getrAgeFrom()) && StringUtils.isBlank(objUserBean.getrAgeTo()) &&
						StringUtils.isBlank(objUserBean.getrMaritalStatus()) ){
					return "redirect:partner-profile";
				}
				return "redirect:sendOtp";
			}else
				return "redirect:dashboard";
			//}
			
		}else if(objUserBean.getRoleId() != 4){
			int allowed_profiles_limit = objUsersDao.getAllowedProfilesLimit(objUserBean.getId());
			session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
			session.setAttribute("cacheGuest", objUserBean);
			session.setAttribute("rolId", objUserBean.getRoleId());
			session.setAttribute("userName", objUserBean.getUsername());
			//session.setAttribute("profile_filled_status", "100");
			int filled_status = objUsersDao.getProfileFilledStatus(objUserBean);
			
			if(StringUtils.isBlank(objUserBean.getMaritalStatus())){
				return "redirect:profile.htm?page=1";
			}
			filled_status += 15;
			if(StringUtils.isBlank(objUserBean.getEducation())){
				return "redirect:profile.htm?page=2";
			}
			filled_status += 15;
			if(StringUtils.isBlank(objUserBean.getHeight())){
				return "redirect:profile.htm?page=3";
			}
			filled_status += 15;
			if(StringUtils.isBlank(objUserBean.getAboutMyself()) && StringUtils.isBlank(objUserBean.getDisability())){
				//return "redirect:profile.htm?page=4";
			}
			session.setAttribute("profile_filled_status", filled_status);
			String otpStatus = objUsersDao.getOtpStatus(objUserBean);
			if(StringUtils.isBlank(otpStatus) || "0".equals(otpStatus)){
				return "redirect:sendOtp";
			}else
				return "redirect:dashboard";
		}else{
			session.setAttribute("cacheGuest", objUserBean);
			session.setAttribute("rolId", objUserBean.getRoleId());
			session.setAttribute("userName", objUserBean.getUsername());
			return "redirect:profile.htm?page=1";
		}
	}
}
