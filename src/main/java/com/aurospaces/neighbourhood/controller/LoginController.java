package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.StateDao;
import com.aurospaces.neighbourhood.db.dao.UserrequirementDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.HRMSUtil;
import com.aurospaces.neighbourhood.util.MatrimonyConstants;
import com.aurospaces.neighbourhood.util.MiscUtils;
import com.aurospaces.neighbourhood.util.SendSMS;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Controller
public class LoginController {
	@Autowired
	UsersDao objUsersDao;
	@Autowired UserrequirementDao objUserrequirementDao;
	@Autowired StateDao stateDao;

	
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
				//update login time
				objUsersDao.updateLoginTime(objUserBean);
				
					Map<String,Object> interestCounts = objUsersDao.getInterestCounts(objUserBean);
					long notificationsCount = (Long)interestCounts.get("receivedInterestCount")
											+ (Long)interestCounts.get("mobileNumViewedCount")
											+ (Long)interestCounts.get("profileViewedCount")
											+ (Long)interestCounts.get("shortListedCount");
					if(objUserBean.getStatus().equals("1")){
						session.setAttribute("notificationsCount", notificationsCount);
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
				}
				
				if(objUserBean.getRoleId() ==1 || objUserBean.getRoleId() == 3){
					session.setAttribute("cacheUserBean", objUserBean);
					session.setAttribute("rolId", objUserBean.getRoleId());
					session.setAttribute("userName", objUserBean.getUsername());
					return "redirect:admin/dashboard";
				}else if(objUserBean.getRoleId() == 4){
					
					String otpStatus = objUsersDao.getOtpStatus(objUserBean);
					
					objUserBean.setOtpStatus(otpStatus);
					session.setAttribute("allowed_profiles_limit", 0);
					session.setAttribute("cacheGuest", objUserBean);
					session.setAttribute("rolId", objUserBean.getRoleId());
					session.setAttribute("userName", objUserBean.getUsername());
					
					int filled_status = objUsersDao.getProfileFilledStatus(objUserBean);
					session.setAttribute("profile_filled_status", 45+filled_status);
					if(StringUtils.isBlank(objUserBean.getFatherName())){
						return "redirect:family-details";
					}else if(StringUtils.isBlank(objUserBean.getImage())){
						return "redirect:uploadPhotos";
					}else if(StringUtils.isBlank(objUserBean.getrAgeFrom()) && StringUtils.isBlank(objUserBean.getrAgeTo()) &&
							StringUtils.isBlank(objUserBean.getrMaritalStatus()) ){
						return "redirect:partner-profile";
					}
					else{
						if(StringUtils.isBlank(otpStatus) || "0".equals(otpStatus)){
							return "redirect:sendOtp";
						}else
							return "redirect:dashboard";
					}
					
				}else if(objUserBean.getRoleId() != 4){
					int allowed_profiles_limit = objUsersDao.getAllowedProfilesLimit(objUserBean.getId());
					session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
					session.setAttribute("cacheGuest", objUserBean);
					session.setAttribute("rolId", objUserBean.getRoleId());
					session.setAttribute("userName", objUserBean.getUsername());
					//session.setAttribute("profile_filled_status", "100");
					int filled_status = objUsersDao.getProfileFilledStatus(objUserBean);
					session.setAttribute("profile_filled_status", 45+filled_status);
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
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
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
			}
			return "redirect:HomePage";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		return "LoginHome";
	}

}
