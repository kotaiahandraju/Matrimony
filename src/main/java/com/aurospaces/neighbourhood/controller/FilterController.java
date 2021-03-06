package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.CityDao;
import com.aurospaces.neighbourhood.db.dao.CountriesDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.EmailUtil;
import com.aurospaces.neighbourhood.util.MatrimonyConstants;
import com.aurospaces.neighbourhood.util.MiscUtils;
import com.aurospaces.neighbourhood.util.SendSMS;

@Controller
@RequestMapping(value = "/admin")
public class FilterController {
	private Logger logger = Logger.getLogger(FilterController.class);
	@Autowired
	CountriesDao objCountriesDao;
	@Autowired
	BranchDao objBranchDao;
	@Autowired
	UsersDao objUsersDao;
	// @Autowired UserDetailsDao objUserDetailsDao;
	@Autowired
	ServletContext objContext;
	@Autowired
	CityDao objCityDao;

	@RequestMapping(value = "/AllProfilesHome")
	public String getAllProfiles(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		//System.out.println("getAllProfiles Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "all");
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
			logger.fatal("error in FilterController class getAllProfiles method");
			return "CreateProfile";
		}
		return "allProfiles";
	}

	@RequestMapping(value = "/InactiveProfilesHome")
	public String inactiveProfilesHome(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("inactiveProfiles Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "inactive");
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
			logger.fatal("error in FilterController class inactiveProfilesHome method");
			// return "CreateProfile";
		}
		return "inactiveProfiles";
	}

	@RequestMapping(value = "/AdminRegisterProfiles")
	public String adminRegisterProfiles(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		System.out.println("adminRegisterProfiles Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "admin");
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
			logger.fatal("error in FilterController class adminRegisterProfiles method");
			// return "CreateProfile";
		}
		return "adminCreateProfile";
	}

	@RequestMapping(value = "/DeleteProfilesHome")
	public String deleteProfilesHome(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("deleteProfilesHome Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "delete");
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
			logger.fatal("error in FilterController class deleteProfilesHome method");
			return "CreateProfile";
		}
		return "deleteProfiles";
	}

	@RequestMapping(value = "/HiddenProfilesHome")
	public String hiddenProfilesHome(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("hiddenProfilesHome Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "hidden");
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
			logger.fatal("error in FilterController class hiddenProfilesHome method");
			return "CreateProfile";
		}
		return "hiddenProfiles";
	}

	@RequestMapping(value = "/updateStatus")
	public @ResponseBody String updateStatus(UsersBean objUsersBean, ModelMap model, HttpServletRequest request,
			HttpSession session, BindingResult objBindingResult) {
		// System.out.println("updateStatus page...");
		List<Map<String, String>> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		String statusName = null;
		
		UsersBean  usersBean = objUsersDao.getById(objUsersBean.getId());
		try {
			if (objUsersBean.getStatus() != "0" && objUsersBean.getStatusName() != null) {
				delete = objUsersDao.updateStatus(objUsersBean);
				statusName = objUsersBean.getStatusName();
				if (delete && objUsersBean.getStatus().equalsIgnoreCase("1")) { 
					jsonObj.put("message", "Success");
					
					Map<String,Integer> counts_map = (Map<String,Integer>)session.getAttribute("display_counts");
					int existing_count = (Integer)counts_map.get("inactive_count");
					counts_map.put("inactive_count", existing_count-1);
					session.setAttribute("display_counts",counts_map);
					
					//EmailUtil EmailUtil=new EmailUtil();
//					EmailUtil.sendActiveProfileMail(usersBean,objContext);
					try {
						String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
						objUsersDao.saveEmailData(null, usersBean, baseurl, "active_profile_mail");
					} catch (Exception e) {
						// TODO: handle exception
					}
					

					 String mobileNum = usersBean.getMobile();
			            try{
							   String response = SendSMS.sendSMS("Dear "  +usersBean.getFirstName()+ " "+usersBean.getLastName() +","+"\nYour Profile is Active Now..\nLogin and complete your profile for best response from matches.\nWishing You the best life partner \nTeam - Aarna Matrimony", mobileNum);
							   
							   if("OK".equalsIgnoreCase(response)){
								   
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
					
					
				}else if (delete){
					jsonObj.put("message", "Success");
				}else {
					jsonObj.put("message", "Failed");
				}
			}
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, statusName);
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
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("FilterController class updateStatus method");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);

		}
		return String.valueOf(jsonObj);
	}
	
	@RequestMapping(value = "/permanentDeleteProfile")
	public @ResponseBody String permanentDeleteProfile(UsersBean objUsersBean, ModelMap model, HttpServletRequest request,
			HttpSession session, BindingResult objBindingResult) {
		// System.out.println("updateStatus page...");
		List<Map<String, String>> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean delete = false;
		String statusName = null;
		try {
			
				delete = objUsersDao.delete(objUsersBean.getId());
				statusName = objUsersBean.getStatusName();
				if (delete) {
					jsonObj.put("message", "success");
				} else {
					jsonObj.put("message", "failed");
				}
			
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, statusName);
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
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("FilterController class updateStatuspermanentDeleteProfile method");
			jsonObj.put("message", "excetption" + e);
			return String.valueOf(jsonObj);

		}
		return String.valueOf(jsonObj);
	}

	/*
	 * @RequestMapping(value = "/moveToHidden") public @ResponseBody String
	 * moveToHidden( UsersBean objUsersBean,ModelMap model,HttpServletRequest
	 * request,HttpSession session,BindingResult objBindingResult) {
	 * System.out.println(" moveToHidden action..."); List<Map<String, String>>
	 * listOrderBeans = null; JSONObject jsonObj = new JSONObject();
	 * ObjectMapper objectMapper = null; String sJson=null; boolean delete =
	 * false; String statusName= null; try{ delete=
	 * objUsersDao.moveToHidden(objUsersBean); statusName =
	 * objUsersBean.getStatusName(); if(delete){ jsonObj.put("message",
	 * "Success"); }else{ jsonObj.put("message", "Failed"); }
	 * 
	 * listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean,statusName);
	 * objectMapper = new ObjectMapper(); if (listOrderBeans != null &&
	 * listOrderBeans.size() > 0) {
	 * 
	 * objectMapper = new ObjectMapper(); sJson =
	 * objectMapper.writeValueAsString(listOrderBeans);
	 * request.setAttribute("allOrders1", sJson); jsonObj.put("allOrders1",
	 * listOrderBeans); // System.out.println(sJson); } else { objectMapper =
	 * new ObjectMapper(); sJson =
	 * objectMapper.writeValueAsString(listOrderBeans);
	 * request.setAttribute("allOrders1", "''"); jsonObj.put("allOrders1",
	 * listOrderBeans); } }catch(Exception e){ e.printStackTrace();
	 * System.out.println(e); logger.error(e); logger.fatal(
	 * "BranchController class deleteBodyType method  "); jsonObj.put("message",
	 * "excetption"+e); return String.valueOf(jsonObj);
	 * 
	 * } return String.valueOf(jsonObj); }
	 */

	@RequestMapping(value = "/resetPassword")
	public @ResponseBody String resetPassword(UsersBean objUsersBean, ModelMap model, HttpServletRequest request,
			HttpSession session, BindingResult objBindingResult) {
		System.out.println(" resetPassword action...");
		List<Map<String, String>> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson = null;
		boolean updated = false;
		String statusName = null;
		try {
			objUsersBean.setPassword(MiscUtils.generateRandomString(6));
			updated = objUsersDao.updatePassword(objUsersBean);
			try {
				EmailUtil emailUtil = new EmailUtil();
//				emailUtil.sendResetPasswordEmail(objUsersBean, objContext, "admin_reset_password");
				String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
				objUsersDao.saveEmailData(null, objUsersBean, baseurl, "admin_reset_password");
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (updated) {
				jsonObj.put("message", "Reset Password Success");
			} else {
				jsonObj.put("message", "Reset Password Failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			// logger.fatal("BranchController class deleteBodyType method ");
			jsonObj.put("message", "excetption:" + e);
			return String.valueOf(jsonObj);

		}
		return String.valueOf(jsonObj);
	}

	@RequestMapping(value = "/FreeRegisterProfile")
	public String freeRegisterProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("getAllProfiles Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "free");
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
			logger.fatal("error in FilterController class freeRegisterProfile method");
			return "CreateProfile";
		}
		return "freeRegisterProfile";
	}
	
	@RequestMapping(value = "/UndefinedProfile")
	public String undefinedProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("getAllProfiles Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "undefined");
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
			logger.fatal("error in FilterController class freeRegisterProfile method");
			return "CreateProfile";
		}
		return "undefinedProfile";
	}

	@RequestMapping(value = "/PremiumProfile")
	public String premiumProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("getAllProfiles Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "premium");
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
			logger.fatal("error in FilterController class premiumProfile method");
			return "CreateProfile";
		}
		return "premiumProfile";
	}

	@RequestMapping(value = "/ClassicProfile")
	public String classicProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "classic");
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
		return "classicProfile";
	}

	@RequestMapping(value = "/ClassicPlusProfile")
	public String classicPlusProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "classic_plus");
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
		return "classicPlusProfile";
	}

	@RequestMapping(value = "/AarnaPremiumProfile")
	public String aarnaPremiumProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "aarna_premium");
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
		return "aarnaPremiumProfile";
	}
	@RequestMapping(value = "/launchingProfile")
	public String launchingProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "LAUNCHING_OFFER");
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
		return "launchingProfile";
	}
	@RequestMapping(value = "/PremiumPlusProfile")
	public String premiumPlusProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "premium_plus");
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
		return "premiumPlusProfile";
	}

	/*@RequestMapping(value = "/interestRequests")
	public String interestRequests(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("interestRequests Page");
		List<Map<String, Object>> requestsList = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheUserBean");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			requestsList = objUsersDao.getInterestRequests(0);
			if (requestsList != null && requestsList.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(requestsList);
				request.setAttribute("requestsList", sJson);
				// System.out.println(sJson);
			} else {
				request.setAttribute("requestsList", "''");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in FilterController class interestRequests method");
			return "CreateProfile";
		}
		return "interestRequests";
	}*/

   
    @RequestMapping(value = "/fullProfile")
	public String fullProfile(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel,
			HttpServletRequest request, HttpSession session) {
		// System.out.println("fullProfile Page");
		List<Map<String, String>> listOrderBeans = null;
		UsersBean objUsersBean = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		String profileId = request.getParameter("id");
		try {

			UsersBean sessionBean = (UsersBean) session.getAttribute("cacheUserBean");
			if (sessionBean == null) {
				return "redirect:HomePage";
			}
			//int profile_id = objUserssBean.getId();
			int profile_id = Integer.parseInt(profileId);
			UsersBean profileBean = objUsersDao.loginChecking(profile_id);
			request.setAttribute("profileBean", profileBean);
			List<Map<String, Object>> photosList = objUsersDao.getUserPhotos(profile_id);
			request.setAttribute("photosList", photosList);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in FilterController class fullProfile method");
		}
		return "userFullProfile";
	}

    @RequestMapping(value = "/adminNotificationFullProfile")
   	public String notificationfullProfile(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel,
   			HttpServletRequest request, HttpSession session) {
   		// System.out.println("fullProfile Page");
   		List<Map<String, String>> listOrderBeans = null;
   		UsersBean objUsersBean = null;
   		ObjectMapper objectMapper = null;
   		String sJson = null;
   		String profileId = request.getParameter("id");
   		try {

   			UsersBean sessionBean = (UsersBean) session.getAttribute("cacheUserBean");
   			if (sessionBean == null) {
   				return "redirect:HomePage";
   			}
   			//int profile_id = objUserssBean.getId();
   			int profile_id = Integer.parseInt(profileId);
   			UsersBean profileBean = objUsersDao.loginChecking(profile_id);
   			request.setAttribute("profileBean", profileBean);
   			List<Map<String, Object>> photosList = objUsersDao.getUserPhotos(profile_id);
   			request.setAttribute("photosList", photosList);

   		} catch (Exception e) {
   			e.printStackTrace();
   			System.out.println(e);
   			logger.error(e);
   			logger.fatal("error in FilterController class fullProfile method");
   		}
   		return "adminNotificationFullProfile";
   	}
	@RequestMapping(value = "/updatedProfiles")
	public String updatedProfiles(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("updatedProfiles Page");
		List<Map<String, Object>> profilesList = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

			long total_records = 0;
			profilesList = objUsersDao.getUpdatedProfiles(0);
			if (profilesList != null && profilesList.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(profilesList);
				request.setAttribute("updatedProfilesList", sJson);
				total_records = (Long) profilesList.get(0).get("total_count");
				// System.out.println(sJson);
			} else {
				request.setAttribute("updatedProfilesList", "''");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in FilterController class updatedProfiles method");
			return "updatedProfiles";
		}
		return "updatedProfiles";
	}

	@RequestMapping(value = "/updatedProfilesPagination")
	public @ResponseBody String updatedProfilesPagination(@ModelAttribute("createProfile") UsersBean searchCriteriaBean,
			ModelMap model, HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("interestRequests Page");
		List<Map<String, Object>> profilesList = null;
		JSONObject objJson =new JSONObject();
		int page_no = searchCriteriaBean.getPage_no();
		try {
			UsersBean userBean = (UsersBean) session.getAttribute("cacheUserBean");
			if (userBean == null) {
				return "redirect:HomePage";
			}
			if (page_no != 0)
				page_no = page_no - 1;
			long total_records = 0;
			profilesList = objUsersDao.getUpdatedProfiles(page_no);
			if (profilesList != null && profilesList.size() > 0) {
				objJson.put("updatedProfilesList", profilesList);
				total_records = (Long)profilesList.get(0).get("total_count");
			} else {
				objJson.put("updatedProfilesList", "");
			}
			objJson.put("total_records", total_records);
			objJson.put("page_size", MatrimonyConstants.PAGINATION_SIZE);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in FilterController class updatedProfilesPagination method");
			return "updatedProfiles";
		}
		return objJson.toString();
	}

	@RequestMapping(value = "/approvePhoto")
	public @ResponseBody String approvePhoto(@ModelAttribute("createProfile") UsersBean searchCriteriaBean,
			ModelMap model, HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("approvePhoto Page");
		JSONObject objJson = new JSONObject();
		try {
			UsersBean userBean = (UsersBean) session.getAttribute("cacheUserBean");
			if (userBean == null) {
				return "redirect:HomePage";
			}
			String photoId = request.getParameter("photoId");
			String approvedStatus = request.getParameter("approvedStatus");
			String user_id = request.getParameter("user_id");
			if (StringUtils.isNotBlank(photoId)) {
				boolean success = objUsersDao.approvePhoto(photoId, approvedStatus);
				if (success) {
					int approval_pending_count = objUsersDao.getApprovalPendingPhotosOf(user_id);
					Map<String,Integer> counts_map = (Map<String,Integer>)session.getAttribute("display_counts");
					counts_map.put("updated_count", approval_pending_count);
					session.setAttribute("display_counts",counts_map);
					objJson.put("message", "success");
					objJson.put("approval_pending_count", approval_pending_count);
				} else {
					objJson.put("message", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in FilterController class approvePhoto method");
			return "updatedProfiles";
		}
		return objJson.toString();
	}
	
	@RequestMapping(value = "/approvePhotoAll")
	public @ResponseBody String approvePhotoAll(@ModelAttribute("createProfile") UsersBean searchCriteriaBean,
			ModelMap model, HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("approvePhoto Page");
		JSONObject objJson = new JSONObject();
		try {
			UsersBean userBean = (UsersBean) session.getAttribute("cacheUserBean");
			if (userBean == null) {
				return "redirect:HomePage";
			}
			String photoIds = request.getParameter("photoId");
			String approvedStatus = request.getParameter("approvedStatus");
			String user_id = request.getParameter("user_id");
		     	if (StringUtils.isNotBlank(photoIds)) {
		     	String profileArry[] =photoIds.split(",");
			    int updated_count = objUsersDao.approvePhotoAll(photoIds,approvedStatus);
				if (updated_count == profileArry.length) {
					objJson.put("message", "success");
					int approval_pending_count = objUsersDao.getApprovalPendingPhotosOf(user_id);
					Map<String,Integer> counts_map = (Map<String,Integer>)session.getAttribute("display_counts");
					counts_map.put("updated_count", approval_pending_count);
					session.setAttribute("display_counts",counts_map);
					objJson.put("approval_pending_count", approval_pending_count);
				} else {
					objJson.put("message", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in FilterController class approvePhoto method");
			return "updatedProfiles";
		}
		return objJson.toString();
	}
	
	@RequestMapping(value = "/verifyProfile")
	public @ResponseBody String verifyProfile(ModelMap model, HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("approvePhoto Page");
		JSONObject objJson = new JSONObject();
		try {
			UsersBean userBean = (UsersBean) session.getAttribute("cacheUserBean");
			if (userBean == null) {
				return "redirect:HomePage";
			}
			String id = request.getParameter("id");
			if(id != null){
				boolean tt =objUsersDao.profileVerifyedBy(Integer.parseInt(id),userBean.getId()) ;
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in FilterController class approvePhoto method");
			return "updatedProfiles";
		}
		return objJson.toString();
	}
	
	@RequestMapping(value = "/loginProfiles")
	public String loginProfiles(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("updatedProfiles Page");
		List<Map<String, Object>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			listOrderBeans = objUsersDao.getLoginUsers();
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
			logger.fatal("error in FilterController class updatedProfiles method");
		}
		return "loginProfiles";
	}
	
	 @RequestMapping(value = "/removeNotificationInAdmin")
		public @ResponseBody String removeNotificationInAdmin( HttpServletRequest request, HttpSession session,UsersBean objUsersBean) {
			 System.out.println("removeNotification page...");
			 List<Map<String, Object>> notifications = null;
			JSONObject jsonObj = new JSONObject();
			boolean delete = false;
			String idParam=request.getParameter("id");
			String mail_type="admin";
			try {
					delete = objUsersDao.deleteNotification(Integer.parseInt(idParam),mail_type);
					if (delete) {
						jsonObj.put("message", "delete");
						//get payment notifications 
						List<Map<String,Object>> paymentNotificationsList = objUsersDao.getAdminNotifications("payment",false);
						if(paymentNotificationsList!=null && paymentNotificationsList.size()>0){
							session.setAttribute("paymentNotificationsList", paymentNotificationsList);
							session.setAttribute("paymentNotificationsList_size", paymentNotificationsList.size());
						}else{
							session.setAttribute("paymentNotificationsList", "");
							session.setAttribute("paymentNotificationsList_size", "0");
						}
					} else {
						jsonObj.put("message", "");
					}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in userNotifications class removeNotification method");
				jsonObj.put("message", "excetption" + e);
				return String.valueOf(jsonObj);
			}
			return String.valueOf(jsonObj);
		}

	   @RequestMapping(value = "/removeALLNotificationInAdmin")
		public @ResponseBody String removeALLNotificationInAdmin( HttpServletRequest request, HttpSession session,UsersBean objUsersBean) {
			 System.out.println("removeALLNotification page...");
			 List<Map<String, Object>> notifications = null;
			JSONObject jsonObj = new JSONObject();
			boolean delete = false;
			String mail_type="admin";
			try {
					String String;
					delete = objUsersDao.deleteALLNotification( mail_type);
					if (delete) {
						jsonObj.put("message", "delete");
						//get payment notifications 
						List<Map<String,Object>> paymentNotificationsList = objUsersDao.getAdminNotifications("payment",false);
						if(paymentNotificationsList!=null && paymentNotificationsList.size()>0){
							session.setAttribute("paymentNotificationsList", paymentNotificationsList);
						}else{
							session.setAttribute("paymentNotificationsList", "");
						}
					} else {
						jsonObj.put("message", "");
					}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in userNotifications class removeAllNotification method");
				jsonObj.put("message", "excetption" + e);
				return String.valueOf(jsonObj);
			}
			return String.valueOf(jsonObj);
		}
	
	
	
	
	
}
