package com.aurospaces.neighbourhood.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpRequest;
import org.apache.log4j.Logger;
import org.castor.util.Base64Decoder;
import org.codehaus.jackson.map.ObjectMapper;
import org.joda.time.DateTime;
import org.json.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.AutoCompleteBean;
import com.aurospaces.neighbourhood.bean.CastBean;
import com.aurospaces.neighbourhood.bean.CityBean;
import com.aurospaces.neighbourhood.bean.ContriesBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.bean.LoginBean;
import com.aurospaces.neighbourhood.bean.MemberShipBean;
import com.aurospaces.neighbourhood.bean.Members;
import com.aurospaces.neighbourhood.bean.Paymenthistory;
import com.aurospaces.neighbourhood.bean.ReligionBean;
import com.aurospaces.neighbourhood.bean.UserImagesBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.CastDao;
import com.aurospaces.neighbourhood.db.dao.CityDao;
import com.aurospaces.neighbourhood.db.dao.CountriesDao;
import com.aurospaces.neighbourhood.db.dao.PaymenthistoryDao;
import com.aurospaces.neighbourhood.db.dao.StateDao;
import com.aurospaces.neighbourhood.db.dao.UserImageUploadDao;
import com.aurospaces.neighbourhood.db.dao.UserSettingsDao;
import com.aurospaces.neighbourhood.db.dao.UserrequirementDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.filter.JavaIntegrationKit;
import com.aurospaces.neighbourhood.util.EmailUtil;
import com.aurospaces.neighbourhood.util.HRMSUtil;
import com.aurospaces.neighbourhood.util.MatrimonyConstants;
import com.aurospaces.neighbourhood.util.MiscUtils;
import com.aurospaces.neighbourhood.util.SendSMS;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Controller
@RequestMapping(value="/users")
public class HomePageController {
	private Logger logger = Logger.getLogger(HomePageController.class);
	@Autowired
	CountriesDao objCountriesDao;
	 @Autowired BranchDao objBranchDao;
   @Autowired UsersDao objUsersDao;
   @Autowired UserrequirementDao objUserrequirementDao;
   @Autowired	ServletContext objContext;
   @Autowired CityDao objCityDao;
   @Autowired UserImageUploadDao objUserImageUploadDao;
   @Autowired PaymenthistoryDao paymenthistoryDao;
   @Autowired StateDao stateDao;
   @Autowired CastDao objCastDao;
   @Autowired UserSettingsDao settingsDao;
   
	/*@RequestMapping(value = "/HomePage")
	public String CreateProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
//		System.out.println("Home Page");
		try {
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				int rolId =objuserBean.getRoleId();
				if(rolId == 1 ){
					return "redirect:admin/BodyTypeHome";
				}else{
					return "redirect:HomePage.htm";
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
	}*/
	
	@RequestMapping(value = "/mobileNumChecking")
	public @ResponseBody String mobileNumChecking(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		JSONObject objJson = new JSONObject();
		
		try {
			boolean exists = objUsersDao.mobileNumExistOrNot(objUsersBean);
			if(!exists){
				objJson.put("msg", "notexist");
			}else{
				objJson.put("msg", "exist");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in mobileNumChecking method  ");
			objJson.put("msg", e);
		}
		return String.valueOf(objJson);
	}
	
	/*@RequestMapping(value = "/userRegistration")
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
		return "redirect:profile.htm?page=1";
	}*/
	@RequestMapping(value = "/profile")
	public String profile(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
//		System.out.println("userRegistration Page");
		String pageName =  null;
		
		try {
			 //session checking
			if(session.getAttribute("cacheGuest") != null){
				UsersBean sessionBean =(UsersBean)session.getAttribute("cacheGuest");
			//get session bean values 
			 objUsersBean = objUsersDao.getById(sessionBean.getId());
			 if(objUsersBean != null){
			 List<Map<String,Object>> statesList = stateDao.getFilteredStates(objUsersBean.getCurrentCountry());
			 Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			 for (Map<String,Object> map : statesList) {
					statesMap.put((Integer)map.get("id"), (String)map.get("name"));
			}
			 request.setAttribute("country_based_states", statesMap);
			 ///
			 List<Map<String,Object>> castes_list =  objCastDao.getCastesBasedOnReligion(sessionBean.getReligion());
			Map<Integer, String> castesMap = new LinkedHashMap<Integer, String>();
			for (Map<String,Object> caste : castes_list) {
				castesMap.put((Integer)caste.get("id"),(String)caste.get("name"));
			}
			request.setAttribute("castes_list", castesMap);
			///
			 objeModel.addAttribute("createProfile", objUsersBean);
			 }
			}else{
				return "redirect:HomePage";
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
		}
		return "registration_form";
	}
	@RequestMapping(value = "/saveUserProfile")
	public String saveUserProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
//		System.out.println("saveUserProfile Page");
		String redirectPage = "dashboard";
		String ipAddress = null;
		try {
			if(StringUtils.isBlank(objUsersBean.getEmail())){
				objUsersBean = (UsersBean)session.getAttribute("profileToBeCreated");
			}
			ipAddress =MiscUtils.getClientIpAddress(request);
			if(StringUtils.isNotBlank(ipAddress)){
				objUsersBean.setLast_ip(ipAddress);
			}
			Date dob1 = HRMSUtil.dateFormate(objUsersBean.getDob());
			if(dob1 !=null){
				objUsersBean.setDob1(dob1);
			}
			
			if(session.getAttribute("cacheGuest") != null){
				UsersBean objUserrequirementBean =  new UsersBean();
				BeanUtils.copyProperties(objUsersBean,objUserrequirementBean,getNullPropertyNames(objUsersBean));
				//objUserrequirementBean = objUsersBean;
					UsersBean sessionBean =(UsersBean)session.getAttribute("cacheGuest");
				//get session bean values 
				UsersBean  objUsersBean1 = objUsersDao.getById(sessionBean.getId());
				objUsersBean1.setMobile(objUsersBean.getMobile());
				 if(objUsersBean != null){
				 objeModel.addAttribute("createProfile", objUsersBean);
				 }
				 BeanUtils.copyProperties(objUsersBean1,objUsersBean,getNullPropertyNames(objUsersBean1));
				 objUsersDao.save(objUsersBean1);
				 if(StringUtils.isNotBlank(objUsersBean.getRedirectPage())){
					if(!("dashboard".equalsIgnoreCase(objUsersBean.getRedirectPage()))){ // send email only on create.
						session.setAttribute("profile_filled_status", 45);
						Map<String,Object> user_settings = settingsDao.getUserSettings(objUsersBean1.getId()+"");
						session.setAttribute("user_settings", user_settings);
						Map<String,Object> interestCounts = objUsersDao.getInterestCounts(objUsersBean);
						//long notificationsCount = (Long)interestCounts.get("notificationsCount");
						int notificationsCount = objUsersDao.getNotificationsCount(objUsersBean);
						session.setAttribute("notificationsCount", notificationsCount);
						sessionBean.setYetToBeViewedCount((String.valueOf(interestCounts.get("yetToBeViewedCount"))));
						sessionBean.setSentInterestCount("0");
						sessionBean.setAwaitingInterestCount("0");
						sessionBean.setReceivedInterestCount("0");
						sessionBean.setAcceptedInterestCount("0");
						sessionBean.setRejectedInterestCount("0");
						sessionBean.setProfileViewedCount("0");
						sessionBean.setProfilesViewedByMeCount("0");
						sessionBean.setMobileNumViewedCount("0");
						sessionBean.setMobileNumViewedByMeCount("0");
						sessionBean.setPendingRequestsCount("0");
						sessionBean.setViewedNotContactedCount("0");
						sessionBean.setShortListedCount("0");
						try{
							 EmailUtil emailUtil = new EmailUtil();
							 // email to user
							 if(StringUtils.isNotBlank(objUsersBean.getEmail())){
//								emailUtil.sendWelcomeMail(objUsersBean1, objContext);
								String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
								objUsersDao.saveEmailData(null, objUsersBean1, baseurl, "welcome_Mail");
							 }
							 //email to Admin
							 emailUtil = new EmailUtil();
							 emailUtil.sendUserRegisteredNotification(objUsersBean1, objContext);
//							 String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
//								objUsersDao.saveEmailData(null, objUsersBean1, baseurl, "user_registered");
//							 
							 /// 
						 }catch(Exception e){
							 
						 }
					}
				}
				 
				 
				 if(objUsersBean.getRoleId() == 4){
					 session.setAttribute("allowed_profiles_limit", "0"); 
					 session.setAttribute("upgrade_msg_flag", "1");
				 }else{
					 String allowed_profiles_limit = objUsersDao.getAllowedProfilesLimit(objUsersBean.getId());
					 session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
				 }
				 
				 if(StringUtils.isNotBlank(objUsersBean.getRedirectPage())){
					if("dashboard".equalsIgnoreCase(objUsersBean.getRedirectPage())){
						objUserrequirementBean.setUserId(sessionBean.getId());
						objUserrequirementBean.setUserrequirementId(objUsersBean1.getUserrequirementId());
						objUserrequirementDao.save(objUserrequirementBean);
					}
					redirectPage = objUsersBean.getRedirectPage();
				}
				 
				 
				 UsersBean newSessionBean = objUsersDao.loginChecking(objUsersBean1.getId());
				 
							newSessionBean.setSentInterestCount(sessionBean.getSentInterestCount());
							newSessionBean.setAwaitingInterestCount(sessionBean.getAwaitingInterestCount());
							newSessionBean.setReceivedInterestCount(sessionBean.getReceivedInterestCount());
							newSessionBean.setAcceptedInterestCount(sessionBean.getAcceptedInterestCount());
							newSessionBean.setProfileViewedCount(sessionBean.getProfileViewedCount());
							newSessionBean.setRejectedInterestCount(sessionBean.getRejectedInterestCount());
							newSessionBean.setProfilesViewedByMeCount(sessionBean.getProfilesViewedByMeCount());
							newSessionBean.setMobileNumViewedCount(sessionBean.getMobileNumViewedCount());
							newSessionBean.setMobileNumViewedByMeCount(sessionBean.getMobileNumViewedByMeCount());
							newSessionBean.setPendingRequestsCount(sessionBean.getPendingRequestsCount());
							newSessionBean.setYetToBeViewedCount(sessionBean.getYetToBeViewedCount());
							newSessionBean.setViewedNotContactedCount(sessionBean.getViewedNotContactedCount());
			
				 int filled_status = objUsersDao.getProfileFilledStatus(newSessionBean);
				 //int filled_status = (Integer)session.getAttribute("profile_filled_status");
				 /*if(StringUtils.isBlank(sessionBean.getAboutMyself()) && StringUtils.isNotBlank(newSessionBean.getAboutMyself())){
					 filled_status += 10;
				 }
				 if(StringUtils.isBlank(sessionBean.getDisability()) && StringUtils.isNotBlank(newSessionBean.getDisability())){
					 filled_status += 5;
				 }
				 int new_filled_status = this.getPartnerReqFilledStatus(filled_status, sessionBean, newSessionBean);
				 new_filled_status = this.getFamilyDetailsFilledStatus(new_filled_status, sessionBean, newSessionBean);
				 session.setAttribute("profile_filled_status", new_filled_status);*/
				 session.setAttribute("profile_filled_status", 45+filled_status);
				 session.setAttribute("cacheGuest",newSessionBean);
				 return "redirect:"+redirectPage+"";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
		}
		//return "redirect:family-details";
		
			
		return "redirect:dashboard";
		
	}
	
	
	 @RequestMapping(value = "/family-details")
	 public String familyDetails(@ModelAttribute("familyDetails") UsersBean objUsersBean, Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
//	  System.out.println("familyDetails Page");
	  try {
		  if(session.getAttribute("cacheGuest") != null){
			  UsersBean sessionBean =(UsersBean)session.getAttribute("cacheGuest");
			  UsersBean UserrequirementBean=  objUsersDao.getById(sessionBean.getId());
			if(UserrequirementBean != null){
			objeModel.addAttribute("familyDetails", UserrequirementBean);
			}
			   
		   }else{
			   return "redirect:HomePage";
		   }	   
	  } catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class familyDetails method");
	   return "familyDetails";
	  }
	  return "familyDetails";
	 }
	
	 
	 @RequestMapping(value = "/saveImproveFamilyDetails")
	 public String saveImproveFamilyDetails(@ModelAttribute("familyDetails") UsersBean objUsersBean, Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
//	  System.out.println("saveImproveFamilyDetails..... Page");
	  try {
		  UsersBean sessionBean =  null;
		  UsersBean objUsersBean1 =new UsersBean();
		  if(session.getAttribute("cacheGuest") != null){
				 sessionBean =(UsersBean)session.getAttribute("cacheGuest");
			//get session bean values 
			 objUsersBean1 = objUsersDao.getById(sessionBean.getId());
			 objUsersBean1.setFatherName(objUsersBean.getFatherName());
			 objUsersBean1.setMotherName(objUsersBean.getMotherName());
			 objUsersBean1.setfOccupation(objUsersBean.getfOccupation());
			 objUsersBean1.setmOccupation(objUsersBean.getmOccupation());
			 objUsersBean1.setNoOfBrothers(objUsersBean.getNoOfBrothers());
			 objUsersBean1.setNoOfSisters(objUsersBean.getNoOfSisters());
			 objUsersBean1.setNoOfBrothersMarried(objUsersBean.getNoOfBrothersMarried());
			 objUsersBean1.setNoOfSistersMarried(objUsersBean.getNoOfSistersMarried());
			 objUsersDao.save(objUsersBean1);
			 UsersBean newBean = objUsersDao.loginChecking(objUsersBean1.getId());
			 int filled_status = objUsersDao.getProfileFilledStatus(newBean);
			 session.setAttribute("profile_filled_status", 45+filled_status);
			 /*int filled_status = (Integer)session.getAttribute("profile_filled_status");
			 int new_filled_status = getFamilyDetailsFilledStatus(filled_status,sessionBean,newBean);
			 session.setAttribute("profile_filled_status",new_filled_status);*/
			 /*if(StringUtils.isBlank(objUsersBean.getNoOfSistersMarried()) && StringUtils.isNotBlank(newBean.getNoOfSistersMarried())){
					 filled_status += 1;
			 }*/
			 
			 /*if(StringUtils.isBlank(newBean.getFatherName())){
					session.setAttribute("profile_filled_status", "55");
				}else if(StringUtils.isBlank(newBean.getImage())){
					session.setAttribute("profile_filled_status", "65");
				}else if(StringUtils.isBlank(newBean.getrAgeFrom()) && StringUtils.isBlank(newBean.getrAgeTo()) &&
						StringUtils.isBlank(newBean.getrMaritalStatus()) ){
					session.setAttribute("profile_filled_status", "90");
				}
				else{
					session.setAttribute("profile_filled_status", "100");
				}*/
			 /*String filled_status = (String)session.getAttribute("profile_filled_status");
			 int intValOfStatus = 0;
			 if(StringUtils.isNotBlank(filled_status)){
				 intValOfStatus = Integer.parseInt(filled_status);
			 }
			 if(StringUtils.isBlank(sessionBean.getFatherName()) && StringUtils.isBlank(sessionBean.getMotherName())){
				 if(StringUtils.isNotBlank(objUsersBean1.getFatherName()) || StringUtils.isNotBlank(objUsersBean1.getMotherName())){
					 session.setAttribute("profile_filled_status", (intValOfStatus+10)+"");
				 } 
			 }*/
			 
			}else{
				return "redirect:HomePage";
			}	   
	  } catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class familyDetails method");
	  }
	  //return "redirect:partner-profile";
	  return "redirect:uploadPhotos";
	 }
	 @RequestMapping(value = "/uploadPhotos")
	 public String uploadPhotos(@ModelAttribute("uploadPhoto") UsersBean objUsersBean, Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
//	  System.out.println("uploadPhotos Page");
	  try {
		  if(session.getAttribute("cacheGuest") != null){
			  UsersBean sessionBean =(UsersBean)session.getAttribute("cacheGuest");
			  UsersBean UserrequirementBean=  objUsersDao.getById(sessionBean.getId());
			if(UserrequirementBean != null){
			//objeModel.addAttribute("familyDetails", UserrequirementBean);
			}
			   
		   }else{
			   return "redirect:HomePage";
		   }
	   
	  } catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   return "redirect:HomePage";
	  }
	  return "uploadPhoto";
	 }
	 
	 @RequestMapping(value = "/croppedPhotoUpload")
		public @ResponseBody String croppedPhotoUpload(@RequestParam("fullImg") MultipartFile fullImage, ModelMap model,
					HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		 //String imgData = request.getParameter("imageData");
		 String temp;
		 
		 FileOutputStream osf;
		 String id =null;
		String msg= null;
		String name=null;
		String sTomcatRootPath = null;
		String sDirPath = null;
		String filepath = null,fullImgfilepath = null;
		UserImagesBean objUerImagesBean = null;
		JSONObject objJson =new JSONObject();
		try {
			
			 
			 UsersBean sessionBean =(UsersBean)session.getAttribute("cacheGuest");
				if(sessionBean!=null){
					
				
					objUerImagesBean = new UserImagesBean();
					id=sessionBean.getId()+"";
					if(StringUtils.isNotBlank(id)){
						objUerImagesBean.setUserId(id);
					}
					String imgData = request.getParameter("imageData");
					//String fullImage = request.getParameter("fullImg");
					if (StringUtils.isNotBlank(imgData)) {
						Base64Decoder decoder = new Base64Decoder(); 
						 byte[] imgBytes = decoder.decode(imgData.split(",")[1]);
						 byte[] fullImageBytes = fullImage.getBytes();
						//byte[] bytes = file.getBytes();
						//name = imgData.split(",")[0].split("")   //file.getOriginalFilename();
						//int n=name.lastIndexOf(".");
						/*name=name.substring(n + 1);
						name=name+".png";*/
						long millis = System.currentTimeMillis() % 1000;
						filepath= id+millis+".png";
						fullImgfilepath= id+millis+".png";
						
						
						
						 String latestUploadPhoto = "";
					        //String rootPath = request.getSession().getServletContext().getRealPath("/");
						 	String rootPath = System.getProperty("catalina.base");
					        //File dir = new File(rootPath + File.separator + "img");
						 	File dir = new File(rootPath + File.separator + "webapps"+ File.separator + "aarna-user-images");
					        if (!dir.exists()) {
					            dir.mkdirs();
					        }
					        //for saving full image
					        File fullImgdir = new File(rootPath + File.separator + "webapps"+ File.separator + "aarna-user-images"+ File.separator +"full-images");
					        if (!fullImgdir.exists()) {
					        	fullImgdir.mkdirs();
					        }
					         
					        //File serverFile = new File(dir.getAbsolutePath() + File.separator + filepath);
					      //  latestUploadPhoto = file.getOriginalFilename();
	//				        file.transferTo(serverFile);
					    //write uploaded image to disk
					        try {
					            
					            osf = new FileOutputStream(new File(dir.getAbsolutePath() + File.separator + filepath));
					    		
								 osf.write(imgBytes);
								 osf.flush();
					        } catch (IOException e) {
					            System.out.println("error : " + e);
					        }
					        
					        try {
					            
					            osf = new FileOutputStream(new File(fullImgdir.getAbsolutePath() + File.separator + fullImgfilepath));
					    		
								 osf.write(fullImageBytes);
								 osf.flush();
					        } catch (IOException e) {
					            System.out.println("error : " + e);
					        }
						  
					        //filepath= "img/"+filepath;
					        filepath= "aarna-user-images/"+filepath;
					        objJson.put("image_path", filepath);
					        objUerImagesBean.setImage(filepath);
					        objUerImagesBean.setStatus("1");
					        
					     /*   ----------------------------------------*/
					        sTomcatRootPath = System.getProperty("catalina.base");
							sDirPath = sTomcatRootPath + File.separator + "webapps"+ File.separator + "img" ;
							System.out.println(sDirPath);
							File file1 = new File(sDirPath);
						    //file.transferTo(file1);
						    try{
						    	objUserImageUploadDao.save(objUerImagesBean);
						    	UsersBean newBean = objUsersDao.loginChecking(sessionBean.getId());
						    	int filled_status = objUsersDao.getProfileFilledStatus(newBean);
								session.setAttribute("profile_filled_status", 45+filled_status);
						    	/*int filled_status = (Integer)session.getAttribute("profile_filled_status");
								 if(StringUtils.isBlank(sessionBean.getImage()) && StringUtils.isNotBlank(newBean.getImage())){
									 filled_status += 20;
								 }
								 session.setAttribute("profile_filled_status",filled_status);*/
								 /*if(StringUtils.isBlank(newBean.getFatherName())){
										session.setAttribute("profile_filled_status", "55");
									}else if(StringUtils.isBlank(newBean.getImage())){
										session.setAttribute("profile_filled_status", "65");
									}else if(StringUtils.isBlank(newBean.getrAgeFrom()) && StringUtils.isBlank(newBean.getrAgeTo()) &&
											StringUtils.isBlank(newBean.getrMaritalStatus()) ){
										session.setAttribute("profile_filled_status", "90");
									}
									else{
										session.setAttribute("profile_filled_status", "100");
									}*/
						    	
						    	/*Object filled_status = session.getAttribute("profile_filled_status");
						    	int intValOfStatus = 0;
						    	if(filled_status != null){
									 intValOfStatus = Integer.parseInt((String)filled_status);
								 }
						    	if(StringUtils.isBlank(sessionBean.getImage())){
						    		session.setAttribute("profile_filled_status", (intValOfStatus+25)+"");
						    	}*/
								
						    	/*BranchBean imageBean = objUserImageUploadDao.getByUserId(objUerImagesBean.getUserId());
						    	if(imageBean != null){
						    		String profileImage = imageBean.getImage();
						    		sessionBean.setProfileImage(profileImage);
						    		session.setAttribute("cacheGuest",sessionBean);
						    	}*/
						    	List<Map<String,Object>> photosList = objUsersDao.getUserPhotos(Integer.parseInt(objUerImagesBean.getUserId()));
						    	objJson.put("photosList", photosList);
						    	objJson.put("message", "success");
						    }catch(Exception e){
						    	e.printStackTrace();
						    	objJson.put("message", "failed");
						    }
					}
				}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return objJson.toString();
	 }
	 
	 @RequestMapping(value = "/photoUpload")
	public @ResponseBody String photoUpload(@RequestParam("imageName") MultipartFile file, ModelMap model,
				HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
			String id =null;
			String msg= null;
			String name=null;
			String sTomcatRootPath = null;
			String sDirPath = null;
			String filepath = null;
			UserImagesBean objUerImagesBean = null;
			JSONObject objJson =new JSONObject();
			try {
				UsersBean sessionBean =(UsersBean)session.getAttribute("cacheGuest");
				if(sessionBean!=null){
					
				
					objUerImagesBean = new UserImagesBean();
					id=sessionBean.getId()+"";
					if(StringUtils.isNotBlank(id)){
						objUerImagesBean.setUserId(id);
					}
					String imgData = request.getParameter("imageData");
					if (!file.isEmpty()) {
						byte[] bytes = file.getBytes();
						name =file.getOriginalFilename();
						int n=name.lastIndexOf(".");
						/*name=name.substring(n + 1);
						name=name+".png";*/
						long millis = System.currentTimeMillis() % 1000;
						filepath= id+millis+".png";
						
						
						
						 String latestUploadPhoto = "";
					        String rootPath = request.getSession().getServletContext().getRealPath("/");
					        File dir = new File(rootPath + File.separator + "img");
					        if (!dir.exists()) {
					            dir.mkdirs();
					        }
					         
					        File serverFile = new File(dir.getAbsolutePath() + File.separator + filepath);
					      //  latestUploadPhoto = file.getOriginalFilename();
	//				        file.transferTo(serverFile);
					    //write uploaded image to disk
					        try {
					            try (InputStream is = file.getInputStream(); BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile))) {
					                int i;
					                while ((i = is.read()) != -1) {
					                    stream.write(i);
					                }
					                stream.flush();
					                //send photo name to jsp
					            }
					        } catch (IOException e) {
					            System.out.println("error : " + e);
					        }
						  
						
					        filepath= "img/"+filepath;
					        objUerImagesBean.setImage(filepath);
					        objUerImagesBean.setStatus("1");
					        
					     /*   ----------------------------------------*/
					        sTomcatRootPath = System.getProperty("catalina.base");
							sDirPath = sTomcatRootPath + File.separator + "webapps"+ File.separator + "img" ;
							System.out.println(sDirPath);
							File file1 = new File(sDirPath);
						    file.transferTo(file1);
						    try{
						    	objUserImageUploadDao.save(objUerImagesBean);
						    	UsersBean newBean = objUsersDao.loginChecking(sessionBean.getId());
						    	int filled_status = objUsersDao.getProfileFilledStatus(newBean);
								session.setAttribute("profile_filled_status", 45+filled_status);
						    	/*int filled_status = (Integer)session.getAttribute("profile_filled_status");
								 if(StringUtils.isBlank(sessionBean.getImage()) && StringUtils.isNotBlank(newBean.getImage())){
									 filled_status += 20;
								 }
								 session.setAttribute("profile_filled_status",filled_status);*/
								 /*if(StringUtils.isBlank(newBean.getFatherName())){
										session.setAttribute("profile_filled_status", "55");
									}else if(StringUtils.isBlank(newBean.getImage())){
										session.setAttribute("profile_filled_status", "65");
									}else if(StringUtils.isBlank(newBean.getrAgeFrom()) && StringUtils.isBlank(newBean.getrAgeTo()) &&
											StringUtils.isBlank(newBean.getrMaritalStatus()) ){
										session.setAttribute("profile_filled_status", "90");
									}
									else{
										session.setAttribute("profile_filled_status", "100");
									}*/
						    	
						    	/*Object filled_status = session.getAttribute("profile_filled_status");
						    	int intValOfStatus = 0;
						    	if(filled_status != null){
									 intValOfStatus = Integer.parseInt((String)filled_status);
								 }
						    	if(StringUtils.isBlank(sessionBean.getImage())){
						    		session.setAttribute("profile_filled_status", (intValOfStatus+25)+"");
						    	}*/
								
						    	/*BranchBean imageBean = objUserImageUploadDao.getByUserId(objUerImagesBean.getUserId());
						    	if(imageBean != null){
						    		String profileImage = imageBean.getImage();
						    		sessionBean.setProfileImage(profileImage);
						    		session.setAttribute("cacheGuest",sessionBean);
						    	}*/
						    	List<Map<String,Object>> photosList = objUsersDao.getUserPhotos(Integer.parseInt(objUerImagesBean.getUserId()));
						    	objJson.put("photosList", photosList);
						    	objJson.put("message", "success");
						    }catch(Exception e){
						    	e.printStackTrace();
						    	objJson.put("message", "failed");
						    }
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in CreateProfile class addProfile method  ");
			}
			return objJson.toString();
		}
	 
	 @RequestMapping(value = "/partner-profile")
	 public String partnerProfile(@ModelAttribute("partnerProfile") UsersBean objUsersBean, Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
//	  System.out.println("Partner Profile Page");
	  try {
	   if(session.getAttribute("cacheGuest") != null){
		  UsersBean sessionBean =(UsersBean)session.getAttribute("cacheGuest");
		  UsersBean UserrequirementBean=  objUserrequirementDao.getByFilterUserId(sessionBean.getId());
		if(UserrequirementBean != null){
		objeModel.addAttribute("partnerProfile", UserrequirementBean);
		}
		   
	   }else{
		   return "redirect:HomePage";
	   }
	   
	  } catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class partnerProfile method");
	   return "partnerRequirement";
	  }
	  return "partnerRequirement";
	 }
	 
	 
	 @RequestMapping(value = "/memberShipPage")
	 public String memberShipPage(@ModelAttribute("payment") UsersBean objUserrequirementBean,  Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
//	  System.out.println("membershipPlans Page");
		 UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			List<MemberShipBean> packagesList = objUsersDao.getPackagesList();
			request.setAttribute("packagesList", packagesList);
	  return "memberShipPage3";
	  
	 }
	 
	 
	 @RequestMapping(value = "/newsavePartnerProfile")
	 public String newsavePartnerProfile(@ModelAttribute("partnerProfileFrm") UsersBean objUserrequirementBean, Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
	  return "redirect:sendOtp";
	 }
	 
	 @RequestMapping(value = "/savePartnerProfile")
	 public String savePartnerProfile(@ModelAttribute("partnerProfile") UsersBean objUserrequirementBean, Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
//	  System.out.println("Partner Profile save Page");
	  try {
		  UsersBean sessionBean =  null;
		  UsersBean objUsersBean1 =new UsersBean();
		  if(session.getAttribute("cacheGuest") != null){
				 sessionBean =(UsersBean)session.getAttribute("cacheGuest");
			//get session bean values 
			 objUsersBean1 = objUsersDao.getById(sessionBean.getId());
			 objUserrequirementBean.setUserId(sessionBean.getId());
			 /*if(rCountry != null)
			 {
				 String reqCountry = Arrays.toString(rCountry);
				 reqCountry = reqCountry.replace("[", "");
				 reqCountry = reqCountry.replace(", ", ",");
				 reqCountry = reqCountry.replace("]", "");
				 objUserrequirementBean.setrCountry(reqCountry);
			 }*/
//			 objUserrequirementBean.setrCountry(Arrays.toString(rCountry).replaceAll("/[", "").replaceAll("/]", ""));
			 objUserrequirementDao.save(objUserrequirementBean);
			 UsersBean newBean = objUsersDao.loginChecking(sessionBean.getId());
			 int filled_status = objUsersDao.getProfileFilledStatus(newBean);
			 session.setAttribute("profile_filled_status", 45+filled_status);
			 /*String otpStatus = objUsersDao.getOtpStatus(newBean);
			  if(StringUtils.isNotBlank(otpStatus) && "1".equals(otpStatus)){
					
					return "redirect:dashboard";
			  }
			  return "redirect:sendOtp";*/
			 
			}else{
				return "redirect:HomePage";
			}
		  
	  } catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class partnerProfile method");
	  }
	  return "redirect:sendOtp";
	 }

	 @RequestMapping(value = "/thankyou")
	 public String thankYou(@ModelAttribute("thankYou") UsersBean objUsersBean, Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
//	  System.out.println("thankYou Page");
	  try {
	//   
		  List<MemberShipBean> packagesList = objUsersDao.getPackagesList();
		  request.setAttribute("packagesList", packagesList);
	   
	  } catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class thankYou method");
	   return "thankYou";
	  }
	  return "thankYou";
	 }
	 /*@RequestMapping(value = "/membershipPlans")
	 public String membershipPlans(@ModelAttribute("familyDetails") UsersBean objUsersBean, Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
	  System.out.println("membershipPlans Page");
	  try {
	//   
	   
	  } catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class familyDetails method");
	   return "familyDetails";
	  }
	  return "membership1";
	 }*/
	 @RequestMapping(value = "/myProfile")
	 public String myProfile(@ModelAttribute("editProfileForm") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  List<Map<String, String>> listOrderBeans = null;
	  UsersBean objUsersBean = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<CastBean> castList = null;
		  List<ReligionBean> religionList = null;
		  List<EducationBean> educationList = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			UsersBean profileBean = objUsersDao.loginChecking(sessionBean.getId());
			request.setAttribute("profileBean", profileBean);
			BeanUtils.copyProperties(profileBean,objUserssBean,getNullPropertyNames(profileBean));
			List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(sessionBean.getId());
			request.setAttribute("photosList", photosList);
			request.setAttribute("photosListSize", photosList.size());
			///////
			List<Map<String,Object>> castes_list =  objCastDao.getCastesBasedOnReligion(sessionBean.getReligion());
			Map<Integer, String> castesMap = new LinkedHashMap<Integer, String>();
			for (Map<String,Object> caste : castes_list) {
				castesMap.put((Integer)caste.get("id"),(String)caste.get("name"));
			}
			request.setAttribute("castes_list", castesMap);
			/////
			List<Map<String,Object>> results = stateDao.getFilteredStates(sessionBean.getCurrentCountry());
			Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
			for (Map<String,Object> state : results) {
				statesMap.put((Integer)state.get("id"),(String)state.get("name"));
			}
			request.setAttribute("states_map", statesMap);
			//////
			Map<Integer, String> citiesMap = new LinkedHashMap<Integer, String>();
			List<CityBean> ojCityBean = objCityDao.filterByState(sessionBean.getCurrentState());
			for (CityBean city : ojCityBean) {
				citiesMap.put(city.getId(),city.getName());
			}
			request.setAttribute("cities_map", citiesMap);
			
			Map<Integer,String> filtered_states = new HashMap<Integer,String>();
			if(StringUtils.isNotBlank(sessionBean.getrCountry())){
				List<Map<String,Object>> resultss = stateDao.getFilteredStates(sessionBean.getrCountry());
				
				for(Map<String,Object> state:resultss){
					filtered_states.put((Integer)state.get("id"), (String)state.get("name"));
				}
				request.setAttribute("filtered_states", filtered_states);
			}
			Map<Integer,String> filtered_cities = new HashMap<Integer,String>();
			if(StringUtils.isNotBlank(sessionBean.getrCountry())){
				List<Map<String,Object>> resultss = objCityDao.getFilteredCities(sessionBean.getrState());
				
				for(Map<String,Object> state:resultss){
					filtered_cities.put((Integer)state.get("id"), (String)state.get("name"));
				}
				request.setAttribute("filtered_cities", filtered_cities);
			}
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class myProfile method");
	  }
		return "myProfile";
	 }
	 
	 @RequestMapping(value = "/myPhotos")
	 public String myPhotos(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
//	  System.out.println("myPhotos Page");
	  
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			List<Map<String,Object>> photosList = objUsersDao.getUserPhotos(sessionBean.getId());
			request.setAttribute("photosList", photosList);
			
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class familyDetails method");
	  }
	  return "myPhotos";
	 }
	 

	 @RequestMapping(value = "/searchById")
	 public String searchById(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			request.setAttribute("allOrders1", "null");
			request.setAttribute("total_records", MatrimonyConstants.FREE_USER_PROFILES_LIMIT);
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);

			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in searchById method");
	  }
	  return "searchById";
	 }
	 
	 @RequestMapping(value = "/searchByIdAction")
	 public @ResponseBody String searchByIdAction(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
		 List<Map<String, String>> listOrderBeans = null;
		 JSONObject objJson =new JSONObject(); 
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			//make sure all other search criteria options are empty;
			String userName = objUserssBean.getUsername();
			objUserssBean = new UsersBean();
			objUserssBean.setUsername(userName);
			
			int page_no = 0;
			String clicked_btn = request.getParameter("btn_id");
			if(StringUtils.isNotBlank(clicked_btn))
				page_no = (Integer.parseInt(clicked_btn))-1;
			//request.setAttribute("total_records", listOfEmplyees.get(0).getToal_records());
			
			listOrderBeans = objUsersDao.getSearchResults(objUserssBean,page_no,"");
			int total_records = 0;//limit - viewed_count;
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				//get photos
				for(Map<String,String> profileObj:listOrderBeans){
					List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(Integer.parseInt(profileObj.get("id")));
					if(photosList!=null && photosList.size()>0){
						String imgStr = "";
						for(Map<String,Object> photo:photosList){
							if(StringUtils.isBlank(imgStr)){
								imgStr = (String)photo.get("image");
							}else
								imgStr += ","+photo.get("image");
						}
						profileObj.put("photosList", imgStr);
					}else{
						profileObj.put("photosList", "");
					}
					
					
				}
				objJson.put("results", listOrderBeans);
				total_records = Integer.parseInt(((Map<String, String>)listOrderBeans.get(0)).get("total_records"));
				objJson.put("total_records", total_records)	;
				//request.setAttribute("total_records", total_records);
				// System.out.println(sJson);
			} else {
				objJson.put("results", "");
				objJson.put("total_records", 0);
			}
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in searchByIdAction method");
	  }
	  return objJson.toString();
	 }
	 
	 /*@RequestMapping(value = "/newMatches")
	 public String newMatches(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			request.setAttribute("allOrders1", "null");
			request.setAttribute("total_records", MatrimonyConstants.FREE_USER_PROFILES_LIMIT);
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);

			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in newMatches method");
	  }
	  return "newMatches";
	 }*/
	 
	 /*@RequestMapping(value = "/newMatchesAction")
	 public @ResponseBody String newMatchesAction(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
		 List<Map<String, String>> listOrderBeans = null;
		 JSONObject objJson =new JSONObject(); 
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			//make sure all other search criteria options are empty;
			String userName = objUserssBean.getUsername();
			objUserssBean = new UsersBean();
			objUserssBean.setUsername(userName);
			
			int page_no = 0;
			String clicked_btn = request.getParameter("btn_id");
			if(StringUtils.isNotBlank(clicked_btn))
				page_no = (Integer.parseInt(clicked_btn))-1;
			//request.setAttribute("total_records", listOfEmplyees.get(0).getToal_records());
			UsersBean searchCriteriaBean = new UsersBean();
			listOrderBeans = objUsersDao.getSearchResults(searchCriteriaBean,page_no);
			int total_records = 0;//limit - viewed_count;
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objJson.put("results", listOrderBeans);
				total_records = Integer.parseInt(((Map<String, String>)listOrderBeans.get(0)).get("total_records"));
				objJson.put("total_records", total_records)	;
				//request.setAttribute("total_records", total_records);
				// System.out.println(sJson);
			} else {
				objJson.put("results", "");
				objJson.put("total_records", 0);
			}
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in searchByIdAction method");
	  }
	  return objJson.toString();
	 }*/
	 
	 @RequestMapping(value = "/fullProfile")
	 public String fullProfile(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
//	  System.out.println("fullProfile Page");
	  List<Map<String, String>> listOrderBeans = null;
	  UsersBean objUsersBean = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<CastBean> castList = null;
		  List<ReligionBean> religionList = null;
		  List<EducationBean> educationList = null;
		  String profileId = request.getParameter("id");
		try {
			
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			request.setAttribute("sessionBeanList", sessionBean);
				String sender_username = request.getParameter("un");
				String profile_username = request.getParameter("pun");
				String sender_unique_code = request.getParameter("suc");
				String profile_unique_code = request.getParameter("puc");
				String request_from = request.getParameter("rfrm");
				if(StringUtils.isNotBlank(request_from) && "notifications".equalsIgnoreCase(request_from)){
					String notification_id = request.getParameter("nid");
					String profile_id = request.getParameter("pid");
					objUserssBean.setId(Integer.parseInt(profile_id));// for local use
					//update notification status as read
					objUsersDao.updateNotificationStatus(notification_id);
				}else if(StringUtils.isNotBlank(sender_username) && StringUtils.isNotBlank(profile_username)){
					UsersBean profileBean = objUsersDao.getUser(profile_username.trim());
					objUserssBean.setId(profileBean.getId());// for local use
					/*UsersBean senderBean = objUsersDao.getUser(sender_username.trim());
					if(senderBean.getUnique_code().equals(sender_unique_code) && profileBean.getUnique_code().equals(profile_unique_code)){
						LoginBean userObj = new LoginBean();
						userObj.setUserName(sender_username);
						userObj.setPassword(senderBean.getPassword());
						UsersBean objUserBean = objUsersDao.loginChecking(userObj);
						this.setInitialData(objUserBean, session, request);
						sessionBean = (UsersBean)session.getAttribute("cacheGuest");
						objUserssBean.setId(profileBean.getId());// for local use
					}else{
						return "redirect:HomePage";
					}*/
				}else{
					if(sessionBean == null){
						return "redirect:HomePage";
					}
				}
			
			int profile_id = objUserssBean.getId();
			UsersBean profileBean = objUsersDao.loginChecking(profile_id);
			if((profile_id != 0) && (sessionBean.getId()!=profile_id)){
				boolean success = objUsersDao.viewedProfile(profile_id+"");
				
				if(!success){
					logger.fatal("error while updating profile viewed status in fullProfile method");
				}else{
					String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
					objUsersDao.saveEmailData(sessionBean, profileBean, baseurl, "profileviewed");
					
				}
			}else if(StringUtils.isNotBlank(request.getParameter("profileId"))){
				profile_id = Integer.parseInt(request.getParameter("profileId"));
			}
	
			request.setAttribute("profileBean", profileBean);
			List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(profile_id);
			request.setAttribute("fullProfilePhotosList", photosList);
			request.setAttribute("photosListSize", photosList.size());
			
			objUserssBean.setId(sessionBean.getId());
//			EmailUtil.viewFullProfileMail(sessionBean, profileBean, request, objContext);
			/*int notificationsCount = objUsersDao.getNotificationsCount(sessionBean);
			request.setAttribute("notificationsCount", notificationsCount);
			List<Map<String,Object>> notificationsList = objUsersDao.getNotifications(objUserssBean,false);
			if(notificationsList!=null && notificationsList.size()>0){
				session.setAttribute("notificationsList", notificationsList);
			}else{
				session.setAttribute("notificationsList", "");
			}*/
			List<Map<String,Object>> shortlistedByMeList = objUsersDao.getShortlistedByMeMembers(sessionBean.getId()+"",0);
			if(shortlistedByMeList!=null && shortlistedByMeList.size()>0){	
				
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(shortlistedByMeList);
				request.setAttribute("shortlistedList", sJson);
		}
		}
		catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class familyDetails method");
	  }
		return "fullProfile";
	 }
	 
	 @RequestMapping(value = "/searchProfiles")
	 public String searchProfiles(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
//	  System.out.println("searchProfiles Page");
	  List<Map<String, String>> listOrderBeans = null;
	  UsersBean objUsersBean = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<CastBean> castList = null;
		  List<ReligionBean> religionList = null;
		  List<EducationBean> educationList = null;
		try {
			/*UsersBean sessionBean =  null;
			  UsersBean objUsersBean1 =new UsersBean();
			  if(session.getAttribute("cacheGuest") != null){
					 sessionBean =(UsersBean)session.getAttribute("cacheGuest");
//				 objUsersBean1 = objUsersDao.getById1(sessionBean.getId());
				}else{
					return "redirect:HomePage";
				}*/
			
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			castList = objUsersDao.getCastList();
			//request.setAttribute("castList", castList!=null?castList:new LinkedList<Map<String, Object>>());
			session.setAttribute("castList", castList!=null?castList:new LinkedList<Map<String, Object>>());
			religionList = objUsersDao.getReligionList();
			//request.setAttribute("religionList", religionList!=null?religionList:new LinkedList<Map<String, Object>>());
			session.setAttribute("religionList", religionList!=null?religionList:new LinkedList<Map<String, Object>>());
			educationList = objUsersDao.getEducationList();
			//request.setAttribute("educationList", educationList!=null?educationList:new LinkedList<Map<String, Object>>());
			session.setAttribute("educationList", educationList!=null?educationList:new LinkedList<Map<String, Object>>());
			int page_no = 0;
			String clicked_btn = request.getParameter("btn_id");
			if(StringUtils.isNotBlank(clicked_btn))
				page_no = (Integer.parseInt(clicked_btn))-1;
			objUsersBean = new UsersBean();
			//listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean,"all");
			//listOrderBeans = objUsersDao.getProfilesFilteredByPreferences(page_no);
			/*if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);*/
				request.setAttribute("allOrders1", "null");
				request.setAttribute("total_records", MatrimonyConstants.FREE_USER_PROFILES_LIMIT);
				request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			//}
			
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class familyDetails method");
	  }
	  //return "profile_page";
		return "searchPage";
	 }
	 @RequestMapping(value = "/dashboard")
	 public String getPreferredProfiles(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  List<Map<String, String>> listOrderBeans = null;
	  List<CastBean> castList = null;
	  List<ReligionBean> religionList = null;
	  List<EducationBean> educationList = null;
	  //UsersBean objUsersBean = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		UsersBean userverifyBean = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			userverifyBean = objUsersDao.emailverifycationCheck(sessionBean.getEmail());
			if(userverifyBean != null){
				session.setAttribute("emailverify", "0");
			}else{
				session.setAttribute("emailverify", "1");
			}
			String otpStatus = objUsersDao.getOtpStatus(sessionBean);
			if(StringUtils.isBlank(otpStatus) || "0".equals(otpStatus)){
				return "redirect:redirect:sendOtp";
			}
			int page_no = 0;
			/*String clicked_btn = request.getParameter("btn_id");
			if(StringUtils.isNotBlank(clicked_btn))
				page_no = (Integer.parseInt(clicked_btn))-1;*/
			listOrderBeans = objUsersDao.getProfilesFilteredByPreferences(page_no);
			int total_records = 0;//MatrimonyConstants.FREE_USER_PROFILES_LIMIT;
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				total_records = Integer.parseInt(((Map<String, String>)listOrderBeans.get(0)).get("total_records"));
							
				request.setAttribute("total_records", total_records);
			} else {
				request.setAttribute("allOrders1", "''");
				request.setAttribute("total_records", "0");
			}
			listOrderBeans = objUsersDao.getSearchResults(objUsersBean,0,"newmatches");
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("new_matches", sJson);
			} else {
				request.setAttribute("new_matches", "''");
			}
			// get the logged in users's photos
			List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(sessionBean.getId());
			request.setAttribute("photosList", photosList);
			request.setAttribute("photosListSize", photosList.size());
			//membership details to display
			Map<String,Object> membership_details = objUsersDao.getMembershipDetails(sessionBean);
			if(membership_details!=null){
				session.setAttribute("membership_details", membership_details);
			}else{
				session.setAttribute("membership_details", null);
			}
			//to display pending requests block in dashboard
			List<Map<String,Object>> pending_requests = objUsersDao.getPendingInterestRequests(sessionBean.getId()+"",0);
			if(pending_requests!=null && pending_requests.size()>0){
				request.setAttribute("pending_reqs", pending_requests);
				request.setAttribute("pending_reqs_count", pending_requests.size());
			}else{
				request.setAttribute("pending_reqs", "");
			}
			// update notifications count also
			int notificationsCount = objUsersDao.getNotificationsCount(sessionBean);
			session.setAttribute("notificationsCount", notificationsCount);
			List<Map<String,Object>> notificationsList = objUsersDao.getNotifications(sessionBean,false);
			if(notificationsList!=null && notificationsList.size()>0){
				session.setAttribute("notificationsList", notificationsList);
			}else{
				session.setAttribute("notificationsList", "");
			}
			// get preferred location profiles
			List<Map<String,Object>> pref_loc_profiles = objUsersDao.getPreferredLocationProfiles(sessionBean);
			if(pref_loc_profiles!=null && pref_loc_profiles.size()>0){
				request.setAttribute("pref_loc_profiles", pref_loc_profiles);
				request.setAttribute("pref_loc_profiles_size", pref_loc_profiles.get(0).get("list_size"));
			}else{
				request.setAttribute("pref_loc_profiles", "");
				request.setAttribute("pref_loc_profiles_size", "0");
			}
			
			// get preferred profession profiles
			List<Map<String,Object>> pref_prof_profiles = objUsersDao.getPreferredProfessionProfiles(sessionBean);
			if(pref_prof_profiles!=null && pref_prof_profiles.size()>0){
				request.setAttribute("pref_prof_profiles", pref_prof_profiles);
				request.setAttribute("pref_prof_profiles_size", pref_prof_profiles.get(0).get("list_size"));
			}else{
				request.setAttribute("pref_prof_profiles", "");
				request.setAttribute("pref_prof_profiles_size", "0");
			}
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class familyDetails method");
	  }
	  return "dashboardPage";
	 }
	 
	 @RequestMapping(value = "/SearchResults")
	 public String getSearchResults(@ModelAttribute("createProfile") UsersBean searchCriteriaBean, Model objeModel, HttpServletRequest request, HttpSession session) {
//	  System.out.println("SearchResults Page");
	  List<Map<String, String>> listOrderBeans = null;
	  List<CastBean> castList = null;
	  List<ReligionBean> religionList = null;
	  List<EducationBean> educationList = null;
	  //UsersBean objUsersBean = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			int page_no = 0;
			String clicked_btn = request.getParameter("btn_id");
			if(StringUtils.isNotBlank(clicked_btn))
				page_no = (Integer.parseInt(clicked_btn))-1;
			//request.setAttribute("total_records", listOfEmplyees.get(0).getToal_records());
			
			listOrderBeans = objUsersDao.getSearchResults(searchCriteriaBean,page_no,"");
			int total_records = 0;//limit - viewed_count;
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				//get photos
				for(Map<String,String> profileObj:listOrderBeans){
					List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(Integer.parseInt(profileObj.get("id")));
					if(photosList!=null && photosList.size()>0){
						String imgStr = "";
						for(Map<String,Object> photo:photosList){
							if(StringUtils.isBlank(imgStr)){
								imgStr = (String)photo.get("image");
							}else
								imgStr += ","+photo.get("image");
						}
						profileObj.put("photosList", imgStr);
					}else{
						profileObj.put("photosList", "");
					}
					
					
				}
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				total_records = Integer.parseInt(((Map<String, String>)listOrderBeans.get(0)).get("total_records"));
					
				request.setAttribute("total_records", total_records);
				
				Map<Integer,String> filtered_states = new HashMap<Integer,String>();
				if(StringUtils.isNotBlank(searchCriteriaBean.getrCountry())){
					List<Map<String,Object>> results = stateDao.getFilteredStates(searchCriteriaBean.getrCountry());
					
					for(Map<String,Object> state:results){
						filtered_states.put((Integer)state.get("id"), (String)state.get("name"));
					}
					request.setAttribute("filtered_states", filtered_states);
				}
				Map<Integer,String> filtered_cities = new HashMap<Integer,String>();
				if(StringUtils.isNotBlank(searchCriteriaBean.getrCountry())){
					List<Map<String,Object>> results = objCityDao.getFilteredCities(searchCriteriaBean.getrState());
					
					for(Map<String,Object> state:results){
						filtered_cities.put((Integer)state.get("id"), (String)state.get("name"));
					}
					request.setAttribute("filtered_cities", filtered_cities);
				}
				//request.setAttribute("r_age_from", searchCriteriaBean.getrAgeFrom());
				//request.setAttribute("r_age_to", searchCriteriaBean.getrAgeTo());
				// System.out.println(sJson);
			} else {
				//objectMapper = new ObjectMapper();
				//sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
				request.setAttribute("total_records", "0");
			}
			
			
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class familyDetails method");
	  }
	  return "searchPage";
	 }
	 
	
	 
	 @RequestMapping(value = "/getCitys")
		public  @ResponseBody String getCitys( ModelMap model,
				HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
			JSONObject objJson =new JSONObject();
			List<CityBean> ojCityBean = null;
			try {
				String id = null;
				id=request.getParameter("id");
				String state_ids = request.getParameter("state_ids");
				if(StringUtils.isNotBlank(state_ids)){
					ojCityBean = objCityDao.filterByState(state_ids);
				}
				
				if(ojCityBean !=null){
					objJson.put("citys", ojCityBean);
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in CountriesController class CountriesHome method  ");
			}
			return String.valueOf(objJson);
		}
	 @RequestMapping(value = "/updateProfilesList")
		public  @ResponseBody String updateProfilesList(ModelMap model,
				HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
			JSONObject objJson =new JSONObject();
			List<Map<String, String>> filteredProfiles = null;
			try {
				UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
				if(sessionBean == null){
					return "redirect:HomePage";
				}
				String selectedCasts = request.getParameter("selected_casts");
				String selectedReligions = request.getParameter("selected_religions");
				String selectedEducations = request.getParameter("selected_educations");
				//if(selectedCasts!=null){
					filteredProfiles = objUsersDao.getProfilesFilteredByCast(selectedCasts,selectedReligions,selectedEducations,0);
					objJson.put("filtered_profiles", filteredProfiles.size()>0?filteredProfiles:"");
					int total_records = 0;//limit - viewed_count;
					if(filteredProfiles.size()>0){
						total_records = Integer.parseInt(((Map<String, String>)filteredProfiles.get(0)).get("total_records"));
					}else if(filteredProfiles.size()==0){
						total_records = 0;
					}
					objJson.put("total_records", total_records);
					objJson.put("page_size", MatrimonyConstants.PAGINATION_SIZE);
				//}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in CountriesController class CountriesHome method  ");
			}
			return String.valueOf(objJson);
		}
	 
	/* @RequestMapping(value = "/updateProfilesList")
		public  String updateProfilesList(ModelMap model,
				HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
			JSONObject objJson =new JSONObject();
			List<Map<String, String>> filteredProfiles = null;
			try {
				String selectedCasts = request.getParameter("selected_casts");
				String selectedReligions = request.getParameter("selected_religions");
				String selectedEducations = request.getParameter("selected_educations");
				//if(selectedCasts!=null){
					filteredProfiles = objUsersDao.getProfilesFilteredByCast(selectedCasts,selectedReligions,selectedEducations,0);
					request.setAttribute("allOrders1", filteredProfiles.size()>0?filteredProfiles:"");
					int total_records = MatrimonyConstants.FREE_USER_PROFILES_LIMIT;
					if(filteredProfiles.size()>0){
						int count = Integer.parseInt(((Map<String, String>)filteredProfiles.get(0)).get("total_records"));
						if(count<total_records){
							total_records = count;
						}
					}
					request.setAttribute("total_records", total_records);
					request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
				//}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in CountriesController class CountriesHome method  ");
			}
			return "searchPage";
		}*/
	 
/*	 @RequestMapping(value = "/searchProfiles")
		public  @ResponseBody String searchProfiles(ModelMap model,
				HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
			JSONObject objJson =new JSONObject();
			List<Map<String, String>> filteredProfiles = null;
			try {
				String ageFrom = request.getParameter("ageFrom");
				String ageTo = request.getParameter("ageTo");
				String education = request.getParameter("education");
				String currentCity = request.getParameter("currentCity");
				
				//if(selectedCasts!=null){
					filteredProfiles = objUsersDao.getProfilesFilteredByAge(ageFrom, ageTo, education, currentCity);
					objJson.put("filtered_profiles", filteredProfiles.size()>0?filteredProfiles:"");
				//}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in CountriesController class CountriesHome method  ");
			}
			return String.valueOf(objJson);
		}
	 */
	 
	 @RequestMapping(value = "/viewedMobileNumber")
		public  @ResponseBody String viewedMobileNumber(ModelMap model,
				HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
			JSONObject objJson =new JSONObject();
			List<Map<String, String>> filteredProfiles = null;
			try {
				UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
				if(userBean == null){
					return "redirect:HomePage";
				}
				String profile_id = request.getParameter("profile_id");
				if(StringUtils.isNotBlank(profile_id)){
					boolean success = objUsersDao.viewMobileNumber(profile_id);
					if(success){
						objJson.put("message", "success");
						String allowed_limit = (String)session.getAttribute("allowed_profiles_limit");
						objJson.put("allowed_limit", allowed_limit);
					}else{
						objJson.put("message", "failed");
					}
				}
				/*if(StringUtils.isNotBlank(list_type)){
					if("preferences".equalsIgnoreCase(list_type)){
						//filteredProfiles = objUsersDao.getProfilesFilteredByPreferences();
					}else if("search".equalsIgnoreCase(list_type)){
						//filteredProfiles = objUsersDao.getProfilesFilteredByAge(ageFrom, ageTo, education, currentCity)
					}else if("categories".equalsIgnoreCase(list_type)){
						//filteredProfiles = objUsersDao.getProfilesFilteredByCast(castValues, religionValues, educationValues)
					}
				}*/
				//if(selectedCasts!=null){
					//filteredProfiles = objUsersDao.getProfilesFilteredByCast(selectedCasts,selectedReligions,selectedEducations);
					//objJson.put("filtered_profiles", filteredProfiles.size()>0?filteredProfiles:"");
				//}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in CountriesController class CountriesHome method  ");
			}
			return String.valueOf(objJson);
		}
	 
	 @RequestMapping(value = "/shortList")
		public  @ResponseBody String shortList(ModelMap model,
				HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
			JSONObject objJson =new JSONObject();
			String profile_id1 = request.getParameter("profile_id");
			String mailContent = request.getParameter("mail_content");
			if(StringUtils.isNotBlank(profile_id1)){
				UsersBean receipientUser = objUsersDao.loginChecking(Integer.parseInt(profile_id1));
				receipientUser.setMail_content(mailContent);
			try {
				UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
				if(userBean == null){
					return "redirect:HomePage";
				}
				String profile_id = request.getParameter("profile_id");
				if(StringUtils.isNotBlank(profile_id)){
					boolean success = objUsersDao.shortlistProfile(profile_id);
					if(success){
						objJson.put("message", "success");
						String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
						objUsersDao.saveEmailData(userBean, receipientUser, baseurl, "shortlisted");
						 //EmailUtil.sendShortListToMail(userBean, receipientUser, request, objContext);
					}else{
						objJson.put("message", "failed");
					}
				}
				/*if(StringUtils.isNotBlank(list_type)){
					if("preferences".equalsIgnoreCase(list_type)){
						//filteredProfiles = objUsersDao.getProfilesFilteredByPreferences();
					}else if("search".equalsIgnoreCase(list_type)){
						//filteredProfiles = objUsersDao.getProfilesFilteredByAge(ageFrom, ageTo, education, currentCity)
					}else if("categories".equalsIgnoreCase(list_type)){
						//filteredProfiles = objUsersDao.getProfilesFilteredByCast(castValues, religionValues, educationValues)
					}
				}*/
				//if(selectedCasts!=null){
					//filteredProfiles = objUsersDao.getProfilesFilteredByCast(selectedCasts,selectedReligions,selectedEducations);
					//objJson.put("filtered_profiles", filteredProfiles.size()>0?filteredProfiles:"");
				//}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in shortList method  ");
			}}
			return String.valueOf(objJson);
		}
	 
	 
	 @RequestMapping(value = "/expressInterestAll")
		public  @ResponseBody String expressInterestAll(ModelMap model,
				HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
			JSONObject objJson =new JSONObject();
			//List<Map<String,String>> allProfiles = null;
			boolean success = false;
			int page_no = 0;
			String profileId = request.getParameter("profile_id");
			String mailContent = request.getParameter("mail_content");
			if(StringUtils.isNotBlank(profileId)){
				
			
			try {
				UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
				if(userBean == null){
					return "redirect:HomePage";
				}
				String clicked_btn = request.getParameter("btn_id");
				if(StringUtils.isNotBlank(clicked_btn)){
					page_no = (Integer.parseInt(clicked_btn))-1;
				}
				UsersBean receipientUser = new UsersBean();
				String profileArry[] =profileId.split(",");
				for (int i = 0; i < profileArry.length; i++) {
					success = objUsersDao.expressInterestTo(profileArry[i]);
					
				}
				
				if(success){
					objJson.put("message", "success");
					int sent_count = 0;
					if(StringUtils.isNotEmpty(userBean.getSentInterestCount())){
						sent_count = Integer.parseInt(userBean.getSentInterestCount());
					}
					userBean.setSentInterestCount((sent_count+1)+"");
					session.setAttribute("cacheGuest",userBean);
					String allowed_limit = (String)session.getAttribute("allowed_profiles_limit");
					objJson.put("allowed_limit", allowed_limit);
					for (int j = 0; j < profileArry.length; j++) {
				
						receipientUser = objUsersDao.loginChecking(Integer.parseInt(profileArry[j]));
						receipientUser.setMail_content(mailContent);
//					EmailUtil.sendExpressInterestToMail(userBean, receipientUser, request, objContext);
					String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
					objUsersDao.saveEmailData(userBean, receipientUser, baseurl, "interestrequest");
					}
				}
				else{
					objJson.put("message", "failed");
				}
				//allProfiles = objUsersDao.getProfilesFilteredByPreferences(page_no);
				/*if (allProfiles != null && allProfiles.size() > 0) {
					objJson.put("allProfiles", allProfiles);
				} else {
					objJson.put("allProfiles", "");
				}*/
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				objJson.put("message", "failed");
			}}
			return String.valueOf(objJson);
		}
	 
	 
	 @RequestMapping(value = "/expressInterestTo")
		public  @ResponseBody String expressInterestTo(ModelMap model,
				HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
			JSONObject objJson =new JSONObject();
			//List<Map<String,String>> allProfiles = null;
			boolean success = false;
			int page_no = 0;
			String profile_id = request.getParameter("profile_id");
			String mailContent = request.getParameter("mail_content");
			if(StringUtils.isNotBlank(profile_id)){
				UsersBean receipientUser = objUsersDao.loginChecking(Integer.parseInt(profile_id));
				receipientUser.setMail_content(mailContent);
			try {
				UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
				if(userBean == null){
					return "redirect:HomePage";
				}
				String clicked_btn = request.getParameter("btn_id");
				if(StringUtils.isNotBlank(clicked_btn)){
					page_no = (Integer.parseInt(clicked_btn))-1;
				}
				String profileId = request.getParameter("profile_id");
				success = objUsersDao.expressInterestTo(profileId);
				if(success){
					objJson.put("message", "success");
					int sent_count = 0;
					if(StringUtils.isNotEmpty(userBean.getSentInterestCount())){
						sent_count = Integer.parseInt(userBean.getSentInterestCount());
					}
					userBean.setSentInterestCount((sent_count+1)+"");
					session.setAttribute("cacheGuest",userBean);
					String allowed_limit = (String)session.getAttribute("allowed_profiles_limit");
					objJson.put("allowed_limit", allowed_limit);
//					 EmailUtil.sendExpressInterestToMail(userBean, receipientUser, request, objContext);
					 String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
						objUsersDao.saveEmailData(userBean, receipientUser, baseurl, "interestrequest");
					
				}
				else{
					objJson.put("message", "failed");
				}
				//allProfiles = objUsersDao.getProfilesFilteredByPreferences(page_no);
				/*if (allProfiles != null && allProfiles.size() > 0) {
					objJson.put("allProfiles", allProfiles);
				} else {
					objJson.put("allProfiles", "");
				}*/
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				objJson.put("message", "failed");
			}}
			return String.valueOf(objJson);
		}
	@RequestMapping(value = "/autoCompleteSave")
	public @ResponseBody String autoCompleteSave(AutoCompleteBean objAutoCompleteBean, Model objeModel ,
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
//		System.out.println("autoCompleteSave Page");
		String msg = null;
		String id =null;
		String value= null;
		String constant = null;
		try {
			
				objUsersDao.autoCompleteSave(objAutoCompleteBean);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
		}
		return null;
	}
	
	@RequestMapping(value = "/updateUserName")
	public @ResponseBody String updateUserName(AutoCompleteBean objAutoCompleteBean, Model objeModel ,
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		System.out.println("updateUserName...");
		try {
				int user_id = 0;
				String cityId = objAutoCompleteBean.getValue();
				UsersBean objuserBean = (UsersBean) session.getAttribute("cacheGuest");
				if(objuserBean == null){ // means request comes from admin
					user_id = Integer.parseInt(objAutoCompleteBean.getId());
				}else{
					user_id =objuserBean.getId();
				}
				objUsersDao.updateUserName(user_id,cityId);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in updateUserName method  ");
		}
		return null;
	}
	
	@RequestMapping(value = "/updateMobileNumber")
	public @ResponseBody String updateMobileNumber(UsersBean userBean, Model objeModel ,
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		JSONObject objJson =new JSONObject();
		try {
				UsersBean objuserBean = (UsersBean) session.getAttribute("cacheGuest");
				if(objuserBean==null){
					return "redirect:HomePage";
				}
				String mobileNum = request.getParameter("mobileNum");
				String user_id = request.getParameter("userId");
				userBean.setId(objuserBean.getId());
				userBean.setMobile(mobileNum);
				boolean exists = objUsersDao.mobileNumExistOrNot(userBean);
				if(exists){
					objJson.putOnce("message", "duplicate");
				}else{
					boolean success = objUsersDao.updateMobileNumber(user_id,mobileNum);
					if(success){
						objJson.putOnce("message", "success");
						objuserBean.setMobile(mobileNum);
						session.setAttribute("cacheGuest", objuserBean);
					}else{
						objJson.putOnce("message", "failed");
					}
				}
				
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in updateMobileNumber method  ");
			objJson.putOnce("message", "failed");
		}
		return objJson.toString();
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
	@ModelAttribute("education")
	public Map<Integer, String> populateeducation() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from education  where status='1' order by name asc";
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
	@ModelAttribute("occupation")
	public Map<Integer, String> populateoccupation() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from occupation  where status='1' order by name asc";
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
	
	@ModelAttribute("maleOccupation")
	public Map<Integer, String> populateMaleOccupation() {
		Map<Integer, String> occMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from occupation  where status='1' and upper(name) not like upper('%house%wife%') order by name asc";
			List<EducationBean> list = objUsersDao.populate(sSql);
			for (EducationBean bean : list) {
				occMap.put(bean.getId(), bean.getName());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return occMap;
	}
	@ModelAttribute("height")
	public Map<Integer, String> populateheight() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,inches from height  where status='1' ";
			List<HeightBean> list = objUsersDao.populate1(sSql);
			for (HeightBean bean : list) {
				statesMap.put(bean.getId(), bean.getInches());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	@ModelAttribute("complexion")
	public Map<Integer, String> populatecomplexion() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from complexion  where status='1' order by name asc";
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
	@ModelAttribute("raasi")
	public Map<Integer, String> populateraasi() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from raasi  where status='1' order by name asc";
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
	@ModelAttribute("star")
	public Map<Integer, String> populatestar() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from star  where status='1' order by name asc";
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
	@ModelAttribute("branch")
	public Map<Integer, String> populatebranch() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from branch  where status='1' order by name asc";
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
	@ModelAttribute("bodyType")
	public Map<Integer, String> populatebodyType() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from body_type  where status='1' order by name asc";
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
	@ModelAttribute("states")
	public Map<Integer, String> populateState(HttpSession session) {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			UsersBean userSessionBean = (UsersBean) session.getAttribute("cacheGuest");
			if(userSessionBean!=null)
			{
				String countryId = userSessionBean.getCurrentCountry();
				//String sSql = "select id,name from state  where country_id = "+countryId+" and  status='1' order by name asc";
				String sSql = "select id,name from state  where  status='1' order by name asc";
				List<EducationBean> list = objUsersDao.populate(sSql);
				for (EducationBean bean : list) {
					statesMap.put(bean.getId(), bean.getName());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return statesMap;
	}
	
	@ModelAttribute("citys")
	public Map<Integer, String> populateCity() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from city where status='1' order by name asc";
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
	public static String[] getNullPropertyNames (Object source) {
	    final BeanWrapper src = new BeanWrapperImpl(source);
	    java.beans.PropertyDescriptor[] pds = src.getPropertyDescriptors();

	    Set<String> emptyNames = new HashSet<String>();
	    for(java.beans.PropertyDescriptor pd : pds) {
	        Object srcValue = src.getPropertyValue(pd.getName());
	        if (srcValue == null) emptyNames.add(pd.getName());
	    }
	    String[] result = new String[emptyNames.size()];
	    return emptyNames.toArray(result);
	}
	
	@RequestMapping(value = "/savePayment")
	public String savePayment(@ModelAttribute("payment") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpServletResponse response, HttpSession session,RedirectAttributes redir) {
//		System.out.println("savePayment Page");
		List<ContriesBean> listOrderBeans = null;
		String msg= null;
		try{
			
			UsersBean userSessionBean = (UsersBean) session.getAttribute("cacheGuest");
			if(userSessionBean==null)
				return null;
			
			int userId = userSessionBean.getId();
			//String packId = request.getParameter("package_id"); commented temporarily
			String packId = "6";
			int price = objUsersDao.getPackagePriceById(Integer.parseInt(packId));
			session.setAttribute("packageId", packId);
			JavaIntegrationKit integrationKit = new JavaIntegrationKit();
	        Map<String, String> values = integrationKit.hashCalMethod(request, response, price);
			
	        Paymenthistory objPaymenthistoryBean =new Paymenthistory();
	         objPaymenthistoryBean.setTxid(values.get("txnid").trim());
	         objPaymenthistoryBean.setMemberId(String.valueOf(userId));
	         objPaymenthistoryBean.setPaymentStatus("In Progress");
	         objPaymenthistoryBean.setPrice(price);
	         
	         paymenthistoryDao.save(objPaymenthistoryBean);
	         
	         PrintWriter writer = response.getWriter();
	         
	         String htmlResponse = "<html> <body > <div align='center'><img src='../images/load.gif'/></div><div style='display:none;'> \n"
	                 + "      \n"
	                 + "  \n"
	                 + "  <h1>PayUForm </h1>\n"
	                 + "  \n" + "<div>"
	                 + "        <form id=\"payuform\" action=\"" + values.get("action") + "\"  name=\"payuform\" method=POST >\n"
	                 + "      <input type=\"hidden\" name=\"key\" value='rk9oLSp9'>"
	                 + "      <input type=\"hidden\" name=\"hash\" value=" + values.get("hash").trim() + ">"
	                 + "      <input type=\"hidden\" name=\"txnid\" value=" + values.get("txnid").trim() + ">"
	                 + "      <table>\n"
	                 + "        <tr>\n"
	                 + "          <td><b>Mandatory Parameters</b></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "         <td>Amount: </td>\n"
	                 + "          <td><input name=\"amount\" value=" + values.get("amount").trim() + " /></td>\n"
	                 + "          <td>First Name: </td>\n"
	                 + "          <td><input name=\"firstname\" id=\"firstname\" value=" + values.get("firstname").trim() + " /></td>\n"
	                 + "        <tr>\n"
	                 + "          <td>Email: </td>\n"
	                 + "          <td><input name=\"email\" id=\"email\" value=" + values.get("email").trim() + " /></td>\n"
	                 + "          <td>Phone: </td>\n"
	                 + "          <td><input name=\"phone\" value=" + values.get("phone") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Product Info: </td>\n"
	                 + "<td><input name=\"productinfo\" value=" + values.get("productinfo").trim() + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Success URI: </td>\n"
	                 + "          <td colspan=\"3\"><input name=\"surl\"  size=\"64\" value=" + values.get("surl") + "></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Failure URI: </td>\n"
	                 + "          <td colspan=\"3\"><input name=\"furl\" value=" + values.get("furl") + " size=\"64\" ></td>\n"
	                 + "        </tr>\n"
	                 + "\n"
	                 + "        <tr>\n"
	                 + "          <td colspan=\"3\"><input type=\"hidden\" name=\"service_provider\" value=\"payu_paisa\" /></td>\n"
	                 + "        </tr>\n"
	                 + "             <tr>\n"
	                 + "          <td><b>Optional Parameters</b></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Last Name: </td>\n"
	                 + "          <td><input name=\"lastname\" id=\"lastname\" value=" + values.get("lastname") + " ></td>\n"
	                 + "          <td>Cancel URI: </td>\n"
	                 + "          <td><input name=\"curl\" value=" + values.get("curl") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Address1: </td>\n"
	                 + "          <td><input name=\"address1\" value=" + values.get("address1") + " ></td>\n"
	                 + "          <td>Address2: </td>\n"
	                 + "          <td><input name=\"address2\" value=" + values.get("address2") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>City: </td>\n"
	                 + "          <td><input name=\"city\" value=" + values.get("city") + "></td>\n"
	                 + "          <td>State: </td>\n"
	                 + "          <td><input name=\"state\" value=" + values.get("state") + "></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Country: </td>\n"
	                 + "          <td><input name=\"country\" value=" + values.get("country") + " ></td>\n"
	                 + "          <td>Zipcode: </td>\n"
	                 + "          <td><input name=\"zipcode\" value=" + values.get("zipcode") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "          <td>UDF1: </td>\n"
	                 + "          <td><input name=\"udf1\" value=" + values.get("udf1") + "></td>\n"
	                 + "          <td>UDF2: </td>\n"
	                 + "          <td><input name=\"udf2\" value=" + values.get("udf2") + "></td>\n"
	                 + " <td><input name=\"hashString\" value=" + values.get("hashString") + "></td>\n"
	                 + "          <td>UDF3: </td>\n"
	                 + "          <td><input name=\"udf3\" value=" + values.get("udf3") + " ></td>\n"
	                 + "          <td>UDF4: </td>\n"
	                 + "          <td><input name=\"udf4\" value=" + values.get("udf4") + " ></td>\n"
	                 + "          <td>UDF5: </td>\n"
	                + "          <td><input name=\"udf5\" value=" + values.get("udf5") + " ></td>\n"
	                  + "          <td>PG: </td>\n"
	                + "          <td><input name=\"pg\" value=" + values.get("pg") + " ></td>\n"
	                 + "        <td colspan=\"4\"><input type=\"submit\" value=\"Submit\"  /></td>\n"
	                 + "      \n"
	                 + "    \n"
	                 + "      </table>\n"
	                 + "    </form>\n"
	                 + " <script> "
	                 + " document.getElementById(\"payuform\").submit(); "
	                 + " </script> "
	                 + "       </div>   "
	                 + "  \n"
	                 + " </div> </body>\n"
	                 + "</html>";
	 // return response
	         writer.println(htmlResponse);
			
			/*boolean success = paymentDao.save(objUsersBean.getPayment());
			if(success){
				msg = "Payment Done successfully.";
			}else{
				msg = "Payment is not saved. Please try again.";
			}
			redir.addFlashAttribute("msg", msg);
			if(StringUtils.isNotBlank(objUsersBean.getPageName())){
				return "redirect:"+objUsersBean.getPageName();
			}*/
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in savePayment method  ");
			//return "CreateProfile";
		}
		return null;
   }
   
   @RequestMapping(value = "/success")
	public  String success(Members objMembers, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redirect) {
		JSONObject objJson = new JSONObject();
		try{
			Enumeration paramNames = request.getParameterNames();
	        Map<String, String> params = new HashMap<String, String>();
	        Map<String, String> urlParams = new HashMap<String, String>();
	       while (paramNames.hasMoreElements()) {
	            String paramName = (String) paramNames.nextElement();
	            String paramValue = request.getParameter(paramName);
	            params.put(paramName, paramValue);
	        }
	       redirect.addFlashAttribute("params", params);
//	       request.setAttribute("params", params);
	       
					 
				
				//session.setAttribute("txnid", txnid);
	       // UPDATE paymenthistory TABLE
	       UsersBean userSessionBean = (UsersBean) session.getAttribute("cacheGuest");
		if(userSessionBean!=null){
				Paymenthistory objPamenthistory = new Paymenthistory();
				String unmappedstatus = params.get("unmappedstatus");
				String txnid=params.get("txnid");
				//String txnid = request.getParameter("txnid");
				String status = params.get("status");
				objPamenthistory.setRemarks(unmappedstatus);
				objPamenthistory.setPaymentStatus(status);
				objPamenthistory.setTxid(txnid);
				paymenthistoryDao.pamentStatusUpdate(objPamenthistory);
				
				session.setAttribute("txnid", txnid);
				
				// UPDATE USERS TABLE
				int userId = userSessionBean.getId();
				int roleId = 0;
				String packageId = (String)session.getAttribute("packageId");
				if(String.valueOf(MatrimonyConstants.CLASSIC_PACKAGE).equals(packageId)){
					roleId = MatrimonyConstants.CLASSIC_USER_ROLE_ID;
				}
				else if(String.valueOf(MatrimonyConstants.CLASSIC_PLUS_PACKAGE).equals(packageId)){
					roleId = MatrimonyConstants.CLASSIC_PLUS_USER_ROLE_ID;
				}
				else if(String.valueOf(MatrimonyConstants.PREMIUM_PACKAGE).equals(packageId)){
					roleId = MatrimonyConstants.PREMIUM_USER_ROLE_ID;
				}
				else if(String.valueOf(MatrimonyConstants.PREMIUM_PLUS_PACKAGE).equals(packageId)){
					roleId = MatrimonyConstants.PREMIUM_PLUS_USER_ROLE_ID;
				}
				else if(String.valueOf(MatrimonyConstants.AARNA_PREMIUM_PACKAGE).equals(packageId)){
					roleId = MatrimonyConstants.AARNA_PREMIUM_USER_ROLE_ID;
					
				}else if(String.valueOf(MatrimonyConstants.LAUNCHING_OFFER_999_PACK).equals(packageId)){
					roleId = MatrimonyConstants.LAUNCHING_OFFER_ROLE_ID;
				}
					
				if(roleId!=0){
					boolean success = objUsersDao.upgradeUser(userId, roleId,packageId);
					if(success)
						;
				}
				//SEND MAIL&SMS TO THE MEMBER
				List<Map<String,Object>> paymentDetails = this.objUsersDao.getPaymentDetailsForPrint(txnid);
				String retVal = EmailUtil.sendPostPaymentMail(userSessionBean, paymentDetails.get(0), request, objContext);
				String response = SendSMS.sendSMS("Dear member, Congratulations. The payment you made on "+paymentDetails.get(0).get("paymentDate")+" towards Aarna Matrimony membership is successful. Amount paid is:"+paymentDetails.get(0).get("price"), userSessionBean.getMobile());
				// notify Admin
				objUsersDao.addAdminNotifications(userId+"",String.valueOf(paymentDetails.get(0).get("price")));
		}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in payment success  method  ");
		}
		return "redirect:successPrint";
	}
	@RequestMapping(value = "/failed")
	public  String failed(Members objMembersBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
		JSONObject objJson = new JSONObject();
		try{
			Enumeration paramNames = request.getParameterNames();
	        Map<String, String> params = new HashMap<String, String>();
	        Map<String, String> urlParams = new HashMap<String, String>();
	       while (paramNames.hasMoreElements()) {
	            String paramName = (String) paramNames.nextElement();
	            String paramValue = request.getParameter(paramName);
	            params.put(paramName, paramValue);
	        }
	       String first_name = params.get("firstname").split("##")[0];
	       first_name = first_name.replaceAll("#", " ");
	       String last_name = params.get("firstname").split("##")[1];
	       last_name = last_name.replaceAll("#", " ");
	       params.put("firstname", first_name);
	       params.put("lastname", last_name);
	       
	       request.setAttribute("params", params);
	       Paymenthistory objPamenthistory = new Paymenthistory();
			String unmappedstatus = request.getParameter("unmappedstatus");
			String tx=params.get("txnid");
			String txnid = request.getParameter("txnid");
			String status = request.getParameter("status");
			objPamenthistory.setRemarks(unmappedstatus);
			objPamenthistory.setPaymentStatus(status);
			objPamenthistory.setTxid(txnid);
			paymenthistoryDao.pamentStatusUpdate(objPamenthistory);
			session.setAttribute("txnid", txnid);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in MembersController class AddMembers method  ");
		}
		return "failedPament";
	}
	@RequestMapping(value = "/successPrint")
	public  String successPrint(Members objMembersBean, ModelMap model,
			HttpServletRequest request, HttpSession session) {
		 List<Map<String, Object>> listOrderBeans  = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		try{
			
			List<Map<String,Object>> paymentDetails = objUsersDao.getPaymentDetailsForPrint((String)session.getAttribute("txnid"));
			if (paymentDetails != null && paymentDetails.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(paymentDetails);
				request.setAttribute("payment_details", sJson);
			}else{
				request.setAttribute("payment_details", "''");
			}
			
			/*request.getAttribute("params");
			request.getAttribute("requestBean");
			listOrderBeans = objMembersDao.getPrinting();
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
				request.setAttribute("allOrders1", "' '");
				jsonObj.put("allOrders1", "' '");
			}*/
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in MembersController class AddMembers method  ");
		}
		return "successPament";
	}
   
   @ModelAttribute("packages")
   public Map<Integer, String> populatepackages() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from package  where status='1' order by name asc";
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
   
   
   
 
   
   /*****     pagination function call **********/
   @RequestMapping(value = "/displayPage")
	public @ResponseBody String displayPage(@ModelAttribute("createProfile") UsersBean searchCriteriaBean,ModelMap model, HttpServletRequest request, HttpSession session)
														throws JsonGenerationException, JsonMappingException, IOException {
		JSONObject jsonObj = new JSONObject();
		List<Map<String, String>> results = null;
		List<Map<String, Object>> Objresults = null;
		try{
			int page_no = searchCriteriaBean.getPage_no();
			String request_coming_from = request.getParameter("request_from");
			String list_type = request.getParameter("list_type");
			String ageFrom = request.getParameter("rAgeFrom");
			// filter results options
			String with_photo = request.getParameter("with_photo");
			String with_in_day = request.getParameter("with_in_day");
			String with_in_week = request.getParameter("with_in_week");
			String with_in_month = request.getParameter("with_in_month");
			String all_created = request.getParameter("all");
			String age_from = request.getParameter("age_from");
			String age_to = request.getParameter("age_to");
			String city = request.getParameter("rCity");
			
			Map<String,String> filterOptions = new HashMap<String,String>();
			filterOptions.put("with_photo", (StringUtils.isNotBlank(with_photo))?with_photo:"false");
			filterOptions.put("with_in_day", (StringUtils.isNotBlank(with_in_day))?with_in_day:"false");
			filterOptions.put("with_in_week", (StringUtils.isNotBlank(with_in_week))?with_in_week:"false");
			filterOptions.put("with_in_month", (StringUtils.isNotBlank(with_in_month))?with_in_month:"false");
			filterOptions.put("created_at_any_time", (StringUtils.isNotBlank(all_created))?all_created:"false");
			filterOptions.put("age_from", age_from);
			filterOptions.put("age_to", age_to);
			filterOptions.put("city", (StringUtils.isNotBlank(city))?city:null);
			
			UsersBean userSessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(userSessionBean == null){
				return "redirect:HomePage";
			}
			if(page_no != 0)
				page_no = page_no-1;
			if(StringUtils.isNotBlank(request_coming_from)){
				if("dashboard".equalsIgnoreCase(request_coming_from)){
					results = objUsersDao.getProfilesFilteredByPreferences(page_no);
				}else if("myprofileviews".equalsIgnoreCase(request_coming_from)){
					Objresults = objUsersDao.getProfileViewedMembers(userSessionBean.getId()+"",page_no);
				}else if("newmatches".equalsIgnoreCase(request_coming_from)){
					String withPhoto = request.getParameter("withPhoto");
					String alreadyViewed = request.getParameter("alreadyViewed");
					String alreadyContacted = request.getParameter("alreadyContacted");
					results = objUsersDao.getSearchResults(searchCriteriaBean,page_no,"newmatches",withPhoto,alreadyViewed,alreadyContacted,filterOptions);
					
				}else if("search".equalsIgnoreCase(request_coming_from)){
					results = objUsersDao.getSearchResults(searchCriteriaBean,page_no,"",filterOptions);
				}else if("shortlisted".equalsIgnoreCase(request_coming_from)){
					if("shortListedMe".equalsIgnoreCase(list_type)){
						Objresults = objUsersDao.getShortlistedMeMembers(userSessionBean.getId()+"",page_no);
					}else{
						Objresults = objUsersDao.getShortlistedByMeMembers(userSessionBean.getId()+"",page_no);
					}
				}else if("viewednotcontacted".equalsIgnoreCase(request_coming_from)){
					String withPhoto = request.getParameter("withPhoto");
					Objresults = objUsersDao.getViewedNotContactedList(userSessionBean.getId()+"",page_no,withPhoto,filterOptions);
				}else if("yettobeviewed".equalsIgnoreCase(request_coming_from)){
					String withPhoto = request.getParameter("withPhoto");
					String alreadyContacted = request.getParameter("alreadyContacted");
					Objresults = objUsersDao.getyetToBeViewedList(userSessionBean.getId()+"",page_no,withPhoto,alreadyContacted,filterOptions);
				}else if("mobilenumviewedbyme".equalsIgnoreCase(request_coming_from)){
					Objresults = objUsersDao.getMobileNumViewedByMeList(userSessionBean.getId()+"",page_no);
				}else if("mymobilenumviews".equalsIgnoreCase(request_coming_from)){
					Objresults = objUsersDao.getMyMobileNoViewedByMembers(userSessionBean.getId()+"",page_no);
				}else if("pendingrequests".equalsIgnoreCase(request_coming_from)){
					Objresults = objUsersDao.getPendingInterestRequests(userSessionBean.getId()+"",page_no);
				}else if("acceptedrequests".equalsIgnoreCase(request_coming_from)){
					Objresults = objUsersDao.getacceptedRequests(userSessionBean.getId()+"",page_no);
				}else if("rejectedgrequests".equalsIgnoreCase(request_coming_from)){
					//Objresults = objUsersDao.getre(userSessionBean.getId()+"",page_no);
				}else if("sentrequests".equalsIgnoreCase(request_coming_from)){
					Objresults = objUsersDao.getsentRequests(userSessionBean.getId()+"",page_no);
				}else if("awaitingrequests".equalsIgnoreCase(request_coming_from)){
					Objresults = objUsersDao.getAwaitingRequests(userSessionBean.getId()+"",page_no);
				}else if("inbox".equalsIgnoreCase(request_coming_from)){
					String tabType = request.getParameter("tab_type");
					String listType = request.getParameter("list_type");
					if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("sent_requests")){
						Objresults = objUsersDao.getsentRequests(userSessionBean.getId()+"",page_no);
					}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("awaiting_requests")){
						Objresults = objUsersDao.getAwaitingRequests(userSessionBean.getId()+"",page_no);
					}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("pending_requests")){
						
						String filter_requests = request.getParameter("filter_requests_flag");
						if(StringUtils.isNotBlank(filter_requests) && filter_requests.equalsIgnoreCase("true")){
							
							String read = request.getParameter("read");
							String un_read = request.getParameter("un_read");
							
							String all = request.getParameter("all");
							String interests = request.getParameter("interests");
							String messages = request.getParameter("messages");
							String mobile_no_viewed = request.getParameter("mobile_no_viewed");
							
							Map<String,String> readStatusMap = new HashMap<String,String>();
							readStatusMap.put("read", read);
							readStatusMap.put("un_read", un_read);
							
							Map<String,String> communicationTypeMap = new HashMap<String,String>();
							communicationTypeMap.put("all", all);
							communicationTypeMap.put("interests", interests);
							communicationTypeMap.put("messages", messages);
							communicationTypeMap.put("mobile_no_viewed", mobile_no_viewed);
							
							Objresults = objUsersDao.getPendingRequestsByFilterCriteria(userSessionBean.getId()+"", readStatusMap, communicationTypeMap, 0);	
						}else{
							Objresults = objUsersDao.getPendingInterestRequests(userSessionBean.getId()+"",page_no);
						}
					}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("accepted_requests")){
						
						String filter_requests = request.getParameter("filter_requests_flag");
						if(StringUtils.isNotBlank(filter_requests) && filter_requests.equalsIgnoreCase("true")){
							
							String accepted_by_me = request.getParameter("by_me");
							String accepted_by_others = request.getParameter("by_others");
							
							String read = request.getParameter("read");
							String un_read = request.getParameter("un_read");
							
							String all = request.getParameter("all");
							String interests = request.getParameter("interests");
							String messages = request.getParameter("messages");
							String mobile_no_viewed = request.getParameter("mobile_no_viewed");
							
							Map<String,String> acceptedByMap = new HashMap<String,String>();
							acceptedByMap.put("accepted_by_me", accepted_by_me);
							acceptedByMap.put("accepted_by_others", accepted_by_others);
							
							Map<String,String> readStatusMap = new HashMap<String,String>();
							readStatusMap.put("read", read);
							readStatusMap.put("un_read", un_read);
							
							Map<String,String> communicationTypeMap = new HashMap<String,String>();
							communicationTypeMap.put("all", all);
							communicationTypeMap.put("interests", interests);
							communicationTypeMap.put("messages", messages);
							communicationTypeMap.put("mobile_no_viewed", mobile_no_viewed);
							
							Objresults = objUsersDao.getAcceptedRequestsByFilterCriteria(userSessionBean.getId()+"", acceptedByMap, readStatusMap, communicationTypeMap, 0);	
						}else{
							Objresults = objUsersDao.getacceptedRequests(userSessionBean.getId()+"",page_no);
						}
					}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("rejected_requests")){
						
						String filter_requests = request.getParameter("filter_requests_flag");
						if(StringUtils.isNotBlank(filter_requests) && filter_requests.equalsIgnoreCase("true")){
							
							String rejected_by_me = request.getParameter("by_me");
							String rejected_by_others = request.getParameter("by_others");
							
							String read = request.getParameter("read");
							String un_read = request.getParameter("un_read");
							
							String all = request.getParameter("all");
							String interests = request.getParameter("interests");
							String messages = request.getParameter("messages");
							String mobile_no_viewed = request.getParameter("mobile_no_viewed");
							
							Map<String,String> rejectedByMap = new HashMap<String,String>();
							rejectedByMap.put("rejected_by_me", rejected_by_me);
							rejectedByMap.put("rejected_by_others", rejected_by_others);
							
							Map<String,String> readStatusMap = new HashMap<String,String>();
							readStatusMap.put("read", read);
							readStatusMap.put("un_read", un_read);
							
							Map<String,String> communicationTypeMap = new HashMap<String,String>();
							communicationTypeMap.put("all", all);
							communicationTypeMap.put("interests", interests);
							communicationTypeMap.put("messages", messages);
							communicationTypeMap.put("mobile_no_viewed", mobile_no_viewed);
							
							Objresults = objUsersDao.getRejectedRequestsByFilterCriteria(userSessionBean.getId()+"", rejectedByMap, readStatusMap, communicationTypeMap, 0);	
						}else{
							Objresults = objUsersDao.getRejectedRequests(userSessionBean.getId()+"",page_no);
						}
					}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("filtered_requests")){
						Objresults = objUsersDao.getFilteredRequests(userSessionBean.getId()+"",0);
					}
					else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("profile_views")){
						Objresults = objUsersDao.getProfileViewedMembers(userSessionBean.getId()+"",page_no);
					}
					//Objresults = objUsersDao.getAwaitingRequests(userSessionBean.getId()+"",page_no);
				}else{
					String selectedCasts = request.getParameter("selected_casts");
					String selectedReligions = request.getParameter("selected_religions");
					String selectedEducations = request.getParameter("selected_educations");
					if(StringUtils.isNotBlank(selectedCasts) || StringUtils.isNotBlank(selectedReligions) || StringUtils.isNotBlank(selectedEducations)){
						results = objUsersDao.getProfilesFilteredByCast(selectedCasts,selectedReligions,selectedEducations,page_no);
					}else{
						results = objUsersDao.getSearchResults(searchCriteriaBean,page_no,"");
					}
				}
			}
				
			//int total_records = Integer.parseInt(((Map<String, String>)results.get(0)).get("total_records"));
			//request.setAttribute("total_records", total_records);
			//request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			int total_records = 0;
			if (results != null && results.size() > 0) {
				total_records = Integer.parseInt(((Map<String, String>)results.get(0)).get("total_records"));
				//get photos
				for(Map<String,String> profileObj:results){
					List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(Integer.parseInt(profileObj.get("id")));
					if(photosList!=null && photosList.size()>0){
						String imgStr = "";
						for(Map<String,Object> photo:photosList){
							if(StringUtils.isBlank(imgStr)){
								imgStr = (String)photo.get("image");
							}else
								imgStr += ","+photo.get("image");
						}
						profileObj.put("photosList", imgStr);
					}else{
						profileObj.put("photosList", "");
					}
					//get profile match score
					int match_score = this.getProfileMatchScore(userSessionBean, profileObj);
					profileObj.put("match_score", match_score+"");
				}
				jsonObj.put("results", results);
				
			} else {
				if (Objresults != null && Objresults.size() > 0) {
					String s =String.valueOf(((Map<String, Object>)Objresults.get(0)).get("total_records"));
					total_records = Integer.parseInt(s);
					//get photos
					for(Map<String,Object> reqObj:Objresults){
						List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((Integer)reqObj.get("id"));
						if(photosList!=null && photosList.size()>0){
							//objectMapper = new ObjectMapper();
							//sJson = objectMapper.writeValueAsString(photosList);
							reqObj.put("photosList", photosList);
							reqObj.put("photosListSize", photosList.size());
						}else{
							reqObj.put("photosList", "");
						}
						
						//get profile match score
						int match_score = this.getProfileMatchScore2(userSessionBean, reqObj);
						reqObj.put("match_score", match_score+"");
						
						if("inbox".equalsIgnoreCase(request_coming_from)){
							//add recent activity data
							Map<String,Object> recent_activity = objUsersDao.getRecentActivityOf(userSessionBean.getId()+"",(Integer)reqObj.get("id"),list_type);
							//System.out.println("GOT RECENT ACTIVITY...");
							if(recent_activity!=null){
								reqObj.put("recent_activity_map", recent_activity);
							}else{
								reqObj.put("recent_activity_map", "");
							}
						}
						
					}
					jsonObj.put("results", Objresults);
					
				} else {
					jsonObj.put("results", "");
				}
				
			}
			jsonObj.put("total_records", total_records);
			
		}catch(Exception e){
			logger.fatal("error in displayPage method");
			logger.error(e);
			e.printStackTrace();
		}
		return jsonObj.toString();
	}
   
   @RequestMapping(value = "/setAsProfilePicture")
	public @ResponseBody String setAsProfilePicture(@ModelAttribute("createProfile") UsersBean searchCriteriaBean,ModelMap model, HttpServletRequest request, HttpSession session)
														throws JsonGenerationException, JsonMappingException, IOException {
		JSONObject jsonObj = new JSONObject();
		try{
			String photoId = request.getParameter("photoId");
			
			UsersBean userSessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(userSessionBean == null){
				return "redirect:HomePage";
			}
			if(StringUtils.isNotBlank(photoId)){
				boolean success = objUsersDao.setAsProfilePicture(photoId,userSessionBean.getId());
				if(success){
					jsonObj.put("message", "success");
					String profileImage = objUsersDao.getProfilePicture(userSessionBean.getId());
					userSessionBean.setProfileImage(profileImage);
		    		session.setAttribute("cacheGuest",userSessionBean);
				}else{
					jsonObj.put("message", "Failed");
				}
			}
			
		}catch(Exception e){
			logger.fatal("error in displayPage method in EmployController class");
			logger.error(e);
			e.printStackTrace();
		}
		return jsonObj.toString();
	}
   
   /*@RequestMapping(value = "/receivedRequests")
	 public String receivedRequests(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  List<Map<String, String>> listOrderBeans = null;
	  UsersBean objUsersBean = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		List<CastBean> castList = null;
		  List<ReligionBean> religionList = null;
		  List<EducationBean> educationList = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			List<Map<String,Object>> reveivedRequests = objUsersDao.getReceivedInterestRequests(sessionBean.getId()+"",0);
			if(reveivedRequests!=null && reveivedRequests.size()>0){
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(reveivedRequests);
				request.setAttribute("reveivedRequests", sJson);
				total_records = (Long)reveivedRequests.get(0).get("total_records");
			}else{
				request.setAttribute("reveivedRequests", "''");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in receivedRequests method");
	  }
		return "receivedInterestRequests";
	 }*/
   
   @RequestMapping(value = "/profileViewedMembers")
	 public String profileViewedMembers(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  List<Map<String, String>> listOrderBeans = null;
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			List<Map<String,Object>> profileViewedMembers = objUsersDao.getProfileViewedMembers(sessionBean.getId()+"",0);
			if(profileViewedMembers!=null && profileViewedMembers.size()>0){
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(profileViewedMembers);
				request.setAttribute("profileViewedMembers", sJson);
				total_records = (Long)profileViewedMembers.get(0).get("total_records");
			}else{
				request.setAttribute("profileViewedMembers", "''");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in profileViewedMembers method");
	  }
		return "profileViewedMembers";
	 }
   
   @RequestMapping(value = "/acceptRequest")
	public  @ResponseBody String acceptRequest(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
	    JSONObject objJson =new JSONObject();
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			String requestId = request.getParameter("requestId");
			String accept_flag = request.getParameter("accept_flag");
			boolean forwarded = objUsersDao.acceptInterestRequests(requestId,accept_flag);
			if (forwarded) {
				objJson.put("message", "success");
				// update pending req count
				// update pending req count
				int pedingCount = objUsersDao.getPendingInterestsCount(sessionBean);
				sessionBean.setPendingRequestsCount(pedingCount+"");
				session.setAttribute("cacheGuest",sessionBean);
				objJson.put("req_count", pedingCount+"");
			} else {
				objJson.put("message", "failed");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in acceptRequest method  ");
			return objJson.put("message", "error").toString();
		}
		return objJson.toString();
	}
   @RequestMapping(value = "/acceptMessage")
	public  @ResponseBody String acceptMessage(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
	    JSONObject objJson =new JSONObject();
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			String requestId = request.getParameter("requestId");
			String accept_flag = request.getParameter("accept_flag");
			boolean forwarded = objUsersDao.acceptMessage(requestId,accept_flag);
			if (forwarded) {
				objJson.put("message", "success");
				// update pending req count
				int pedingCount = objUsersDao.getPendingInterestsCount(sessionBean);
				sessionBean.setPendingRequestsCount(pedingCount+"");
				session.setAttribute("cacheGuest",sessionBean);
			} else {
				objJson.put("message", "failed");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in acceptMessage method  ");
			return objJson.put("message", "error").toString();
		}
		return objJson.toString();
	}
   
   @RequestMapping(value = "/replyMessage")
	public  @ResponseBody String replyMessage(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
	    JSONObject objJson =new JSONObject();
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			String requestId = request.getParameter("requestId");
			String reply_content = request.getParameter("reply_content");
			boolean forwarded = objUsersDao.replyToMessage(requestId, reply_content);
			if (forwarded) {
				objJson.put("message", "success");
				// update pending req count
				/*int pending = Integer.parseInt(sessionBean.getPendingRequestsCount());
				sessionBean.setPendingRequestsCount(pending>0?(pending-1)+"":"0");
				session.setAttribute("cacheGuest",sessionBean);*/
			} else {
				objJson.put("message", "failed");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in replyMessage method  ");
			return objJson.put("message", "error").toString();
		}
		return objJson.toString();
	}
   
   @RequestMapping(value = "/acceptedRequests")
	 public String acceptedRequests(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  List<Map<String, String>> listOrderBeans = null;
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			if("1".equals(sessionBean.getStatus())){
				List<Map<String,Object>> acceptedRequests = objUsersDao.getacceptedRequests(sessionBean.getId()+"",0);
				if(acceptedRequests!=null && acceptedRequests.size()>0){
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(acceptedRequests);
					request.setAttribute("acceptedRequests", sJson);
					total_records = (Long)acceptedRequests.get(0).get("total_records");
				}else{
					request.setAttribute("acceptedRequests", "''");
				}
			}else{
				request.setAttribute("acceptedRequests", "''");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in acceptedRequests method");
	  }
		return "acceptedInterestRequests";
	 }
   
   /*@RequestMapping(value = "/rejectedByMeList")
	 public String rejectedByMeList(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  List<Map<String, String>> listOrderBeans = null;
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			if("1".equals(sessionBean.getStatus())){
				List<Map<String,Object>> acceptedRequests = objUsersDao.getRequestsRejectedByMe(sessionBean.getId()+"",0);
				if(acceptedRequests!=null && acceptedRequests.size()>0){
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(acceptedRequests);
					request.setAttribute("rejectedRequests", sJson);
					total_records = (Long)acceptedRequests.get(0).get("total_records");
				}else{
					request.setAttribute("rejectedRequests", "''");
				}
			}else{
				request.setAttribute("rejectedRequests", "''");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in acceptedRequests method");
	  }
		return "rejectedByMeList";
	 }*/
   
   @RequestMapping(value = "/sentRequests")
	 public String sentRequests(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			if("1".equals(sessionBean.getStatus())){
				List<Map<String,Object>> sentRequests = objUsersDao.getsentRequests(sessionBean.getId()+"",0);
				if(sentRequests!=null && sentRequests.size()>0){
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(sentRequests);
					request.setAttribute("sentRequests", sJson);
					total_records = (Long)sentRequests.get(0).get("total_records");
				}else{
					request.setAttribute("sentRequests", "''");
				}
			}else{
				request.setAttribute("sentRequests", "''");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in sentRequests method");
	  }
		return "sentInterestRequests";
	 }
   
   @RequestMapping(value = "/awaitingRequests")
	 public String awaitingRequests(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			if("1".equals(sessionBean.getStatus())){
				List<Map<String,Object>> sentRequests = objUsersDao.getAwaitingRequests(sessionBean.getId()+"",0);
				if(sentRequests!=null && sentRequests.size()>0){
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(sentRequests);
					request.setAttribute("awaitingRequests", sJson);
					total_records = (Long)sentRequests.get(0).get("total_records");
				}else{
					request.setAttribute("awaitingRequests", "''");
				}
			}else{
				request.setAttribute("awaitingRequests", "''");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in awaitingRequests method");
	  }
		return "awaitingInterestRequests";
	 }
   
   @RequestMapping(value = "/shortListedMe")
	 public String shortListedMe(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	   ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			String notification_id = request.getParameter("nid");
			if("1".equals(sessionBean.getStatus())){
				
				if(StringUtils.isNotBlank(notification_id)){
					//update notification status as read
					objUsersDao.updateNotificationStatus(notification_id);
				}
				List<Map<String,Object>> shortlistedMeList = objUsersDao.getShortlistedMeMembers(sessionBean.getId()+"",0);
				if(shortlistedMeList!=null && shortlistedMeList.size()>0){
					//get photos
					for(Map<String,Object> reqObj:shortlistedMeList){
						List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((Integer)reqObj.get("id"));
						if(photosList!=null && photosList.size()>0){
							//objectMapper = new ObjectMapper();
							//sJson = objectMapper.writeValueAsString(photosList);
							reqObj.put("photosList", photosList);
							reqObj.put("photosListSize", photosList.size());
						}else{
							reqObj.put("photosList", "");
						}
						
						
					}
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(shortlistedMeList);
					request.setAttribute("shortlistedList", sJson);
					total_records = (Long)shortlistedMeList.get(0).get("total_records");
				}else{
					request.setAttribute("shortlistedList", "''");
				}
			}else{
				request.setAttribute("shortlistedList", "''");
			}
			
			request.setAttribute("list_type", "shortListedMe");
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			if(StringUtils.isNotBlank(notification_id)){
				int notificationsCount = objUsersDao.getNotificationsCount(sessionBean);
				session.setAttribute("notificationsCount", notificationsCount);
				List<Map<String,Object>> notificationsList = objUsersDao.getNotifications(sessionBean,false);
				if(notificationsList!=null && notificationsList.size()>0){
					session.setAttribute("notificationsList", notificationsList);
				}else{
					session.setAttribute("notificationsList", "");
				}
			}
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in receivedRequests method");
	  }
		return "shortlistedList";
	 }
   
   @RequestMapping(value = "/shortListedByMe")
	 public String shortListedByMe(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	   ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			List<Map<String,Object>> shortlistedByMeList = objUsersDao.getShortlistedByMeMembers(sessionBean.getId()+"",0);
			if(shortlistedByMeList!=null && shortlistedByMeList.size()>0){
				//get photos
				for(Map<String,Object> reqObj:shortlistedByMeList){
					List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((Integer)reqObj.get("id"));
					if(photosList!=null && photosList.size()>0){
						//objectMapper = new ObjectMapper();
						//sJson = objectMapper.writeValueAsString(photosList);
						reqObj.put("photosList", photosList);
						reqObj.put("photosListSize", photosList.size());
					}else{
						reqObj.put("photosList", "");
					}
					
					
				}
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(shortlistedByMeList);
				request.setAttribute("shortlistedList", sJson);
				total_records = (Long)shortlistedByMeList.get(0).get("total_records");
			}else{
				request.setAttribute("shortlistedList", "''");
			}
			request.setAttribute("list_type", "shortListedByMe");
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in receivedRequests method");
	  }
		return "shortlistedList";
	 }
   
   /*@RequestMapping(value = "/interestRequestsPagination")
	public @ResponseBody String interestRequestsPagination(@ModelAttribute("createProfile") UsersBean searchCriteriaBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		List<Map<String, Object>> requestsList = null;
		JSONObject objJson =new JSONObject();
		int page_no = searchCriteriaBean.getPage_no();
		try {
			UsersBean userBean = (UsersBean)session.getAttribute("cacheUserBean");
			if(userBean == null){
				return "redirect:HomePage";
			}

			if(page_no != 0)
				page_no = page_no-1;
			int userId = userBean.getId();
			String request_type = request.getParameter("request_type");
			if(StringUtils.isNotBlank(request_type)){
				if(request_type.equalsIgnoreCase("sent")){
					requestsList = objUsersDao.getsentRequests(userId+"", page_no);
				}else if(request_type.equalsIgnoreCase("accepted")){
					requestsList = objUsersDao.getacceptedRequests(userId+"", page_no);
				}else if(request_type.equalsIgnoreCase("received")){
					requestsList = objUsersDao.getReceivedInterestRequests(userId+"", page_no);
				}
				
				int total_records = 0;
				
				if (requestsList != null && requestsList.size() > 0) {
					objJson.put("requestsList", requestsList);
					total_records = Integer.parseInt((String)requestsList.get(0).get("total_count"));
					// System.out.println(sJson);
				} else {
					objJson.put("requestsList", "");
				}
				objJson.put("total_records", total_records);
				objJson.put("page_size", MatrimonyConstants.PAGINATION_SIZE);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in interestRequestsPagination method  ");
			return null;
		}
		return objJson.toString();
	}*/
   
   @RequestMapping(value = "/newMatches")
	 public String getNewMatches(@ModelAttribute("createProfile") UsersBean searchCriteriaBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	   List<Map<String, String>> listOrderBeans = null;
	   ObjectMapper objectMapper = null;
		String sJson = null;
	   try{
		   UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
			if(userBean == null){
				return "redirect:HomePage";
			}

			String withPhoto = request.getParameter("withPhoto");
			String alreadyViewed = request.getParameter("alreadyViewed");
			String alreadyContacted = request.getParameter("alreadyContacted");
			listOrderBeans = objUsersDao.getSearchResults(searchCriteriaBean,0,"newmatches");
			int total_records = 0;//limit - viewed_count;
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				//get photos
				for(Map<String,String> profileObj:listOrderBeans){
					List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(Integer.parseInt(profileObj.get("id")));
					if(photosList!=null && photosList.size()>0){
						String imgStr = "";
						for(Map<String,Object> photo:photosList){
							if(StringUtils.isBlank(imgStr)){
								imgStr = (String)photo.get("image");
							}else
								imgStr += ","+photo.get("image");
						}
						profileObj.put("photosList", imgStr);
					}else{
						profileObj.put("photosList", "");
					}
					//get profile match score
					int match_score = this.getProfileMatchScore(userBean, profileObj);
					profileObj.put("match_score", match_score+"");
				}
				
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				total_records = Integer.parseInt(((Map<String, String>)listOrderBeans.get(0)).get("total_records"));
				request.setAttribute("total_records", total_records);
				Map<Integer, String> cityMap = new LinkedHashMap<Integer, String>();
				try {
					List<CityBean> cities = objCityDao.getAllCities();
					for (CityBean bean : cities) {
						cityMap.put(bean.getId(), bean.getName());
					}

				} catch (Exception e) {
					e.printStackTrace();
				} 
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(cityMap);
				request.setAttribute("all_cities", sJson);
			} else {
				request.setAttribute("allOrders1", "''");
				request.setAttribute("total_records", "0");
			}
	   } catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in interestRequestsPagination method  ");
			return null;
		}
	   
	  return "newMatches"; 
   
   }
   
   @RequestMapping(value = "/newMatchesAjaxAction")
	 public @ResponseBody String newMatchesAjaxAction(@ModelAttribute("createProfile") UsersBean searchCriteriaBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	   List<Map<String, String>> listOrderBeans = null;
	   JSONObject jsOnObj = new JSONObject();
	   try{
		   UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
			if(userBean == null){
				return "redirect:HomePage";
			}

			String withPhoto = request.getParameter("withPhoto");
			String alreadyViewed = request.getParameter("alreadyViewed");
			String alreadyContacted = request.getParameter("alreadyContacted");
			listOrderBeans = objUsersDao.getSearchResults(searchCriteriaBean,0,"newmatches",withPhoto,alreadyViewed,alreadyContacted,null);
			int total_records = 0;//limit - viewed_count;
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				//get photos
				for(Map<String,String> profileObj:listOrderBeans){
					List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(Integer.parseInt(profileObj.get("id")));
					if(photosList!=null && photosList.size()>0){
						String imgStr = "";
						for(Map<String,Object> photo:photosList){
							if(StringUtils.isBlank(imgStr)){
								imgStr = (String)photo.get("image");
							}else
								imgStr += ","+photo.get("image");
						}
						profileObj.put("photosList", imgStr);
					}else{
						profileObj.put("photosList", "");
					}
					
					
				}
				jsOnObj.put("new_matches", listOrderBeans);
				total_records = Integer.parseInt(((Map<String, String>)listOrderBeans.get(0)).get("total_records"));
				jsOnObj.put("total_records", total_records);
				//request.setAttribute("total_records", total_records);
			} else {
				/*request.setAttribute("allOrders1", "''");
				request.setAttribute("total_records", "0");*/
				jsOnObj.put("new_matches", "");
				jsOnObj.put("total_records", "0");
			}
	   } catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in newMatchesAction method  ");
			return null;
		}
	   
	  return jsOnObj.toString(); 
 
 }
   
   
   
   /*@RequestMapping(value = "/createOtp")
   public @ResponseBody String createOtp(
						   @RequestParam("mobileNo") String mobileNo,
						   HttpServletResponse response, HttpServletRequest request,
						   HttpSession objSession,
						   Model mod)
   {
	   System.out.println("mobileNo..."+mobileNo);
	   JSONObject objJson =new JSONObject();
	   String otp = genOtp();
	   //insert into table; userId
	   boolean success = objUsersDao.saveOtp(mobileNo,otp);
	   if(success){
		   objJson.put("message", "success") ;
		   objJson.put("otp", otp) ;
	   }else{
		   objJson.put("message", "failed") ; 
	   }
	   
	
	   
	   return otp;

   }*/

   

   @RequestMapping(value = "/checkOtp")
   public String   checkOtp(Model objeModel,
   HttpServletResponse response, HttpServletRequest request,
   HttpSession session,
   Model mod)
   {
	   try{
		   UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
		   UsersBean profile = (UsersBean)session.getAttribute("profileToBeCreated");
		   objeModel.addAttribute("partnerProfile", profile);
		   String mobileNum = profile.getMobile();
		   String otp1 = request.getParameter("otp1");
			   String otp = objUsersDao.getOtpOf(sessionBean.getId()+"",mobileNum)+"";
			   if(StringUtils.isNotBlank(otp1)  &&  otp.equals(otp1)){
				   objUsersDao.updateOtpStatus(mobileNum,otp);
				   
				   //return "redirect:saveUserProfile";
				   return "redirect:dashboard";
			   }else{
				   request.setAttribute("message", "mismatched");//"OTP mismatched.Please try again.");
				   return "otpPage";
			   }
	   
   		}catch (Exception e) {
		   e.printStackTrace();
		   System.out.println(e);
		   logger.error(e);
		   logger.fatal("error in sendOtp method");
		 }
	   return "otpPage";
   }
   
   
   @RequestMapping(value = "/sendOtp")
	 public String sendOtp(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
				UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
				if(sessionBean == null){
					return "redirect:HomePage";
				}
				UsersBean savedUserData = objUsersDao.getById(sessionBean.getId());
				String otpStatus = objUsersDao.getOtpStatus(savedUserData);
				  if(StringUtils.isNotBlank(otpStatus) && "1".equals(otpStatus)){
						
						return "redirect:dashboard";
				  }
				String mobileNum = savedUserData.getMobile();
				objeModel.addAttribute("createProfile", savedUserData);
				session.setAttribute("profileToBeCreated", savedUserData);
				//String mobileNum = objUserssBean.getMobile();
				
				String otp = objUsersDao.genOtp();
			   //insert into otp table
				request.setAttribute("mobileStr", mobileNum.substring(mobileNum.length()-3));	
			   boolean success = objUsersDao.saveOtp(sessionBean.getId()+"",mobileNum,otp);
			   if(success){
				   try{
					   String response = SendSMS.sendSMS("Thanks for registering with Aarna Matrimony. OTP for your registration is: "+otp, mobileNum);
					   
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
				   
				   return "otpPage";
				   /*objeModel.addAttribute("createProfile", objUserssBean);ff
				   return "redirect:saveUserProfile";*/
			   }else{
				   request.setAttribute("message", "failed");
				   return "otpPage";
			   }
			   
			
		} catch (Exception e) {
		   e.printStackTrace();
		   System.out.println(e);
		   logger.error(e);
		   logger.fatal("error in sendOtp method");
		 }
		return "redirect:HomePage";
	 }
   
   @RequestMapping(value = "/resendOtp")
	 public @ResponseBody String resendOtp(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	   JSONObject objJson = new JSONObject();
		try {
				UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
				if(sessionBean == null){
					return "redirect:HomePage";
				}
				UsersBean savedUserData = objUsersDao.getById(sessionBean.getId());
				String mobileNum = savedUserData.getMobile();
				objJson.put("mobileStr", mobileNum.substring(mobileNum.length()-3));
				
				/*************
				check OTP limit for the day
				
				*************/
			   int count = objUsersDao.getOTPCount(mobileNum);
			   if(count<MatrimonyConstants.OTP_LIMIT){
				   String otp = objUsersDao.getOtpOf(savedUserData.getId()+"",mobileNum);
					//String otp = objUsersDao.genOtp();
				   //insert into otp table
				   //boolean success = objUsersDao.saveOtp(sessionBean.getId()+"",mobileNum,otp);
				   if(StringUtils.isNotBlank(otp)){
					   try{
						   String response = SendSMS.sendSMS("OTP for your registration is: "+otp, mobileNum);
						   
						   if("OK".equalsIgnoreCase(response)){
							   objJson.put("message", "success");
							   boolean updated = objUsersDao.updateOtpCount(mobileNum, otp);
						   }else{
							   objJson.put("message", "failed");
						   }
						   //throw new Exception();
					   }catch(Exception e){
						   e.printStackTrace();
						   objJson.put("message", "failed");
					   }
					   
					   
				   }else{
					   objJson.put("message", "failed");
				   }
			   }else{
				   //request.setAttribute("msg", "OTP limit for the day has been exceeded. Please try again later.");
				   objJson.put("message","limit_exceeded");
			   }
			   
				
				
			   
			
		} catch (Exception e) {
		   e.printStackTrace();
		   objJson.put("message", "failed");
		 }
		return objJson.toString();
	 }
   
   @RequestMapping(value = "/deletePhoto")
	public @ResponseBody String deletePhoto(@ModelAttribute("createProfile") UsersBean searchCriteriaBean,
			ModelMap model, HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		JSONObject objJson = new JSONObject();
		try {
			UsersBean userBean = (UsersBean) session.getAttribute("cacheGuest");
			if (userBean == null) {
				return "redirect:HomePage";
			}
			String photoId = request.getParameter("photoId");
			if (StringUtils.isNotBlank(photoId)) {
				boolean success = objUsersDao.deletePhoto(photoId);
				if (success) {
					objJson.put("message", "success");
				} else {
					objJson.put("message", "failed");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in deletePhoto method");
			return "exception";
		}
		return objJson.toString();
	}
   
   @RequestMapping(value = "/getFilteredStates")
	public @ResponseBody String getFilteredStates(@ModelAttribute("createProfile") UsersBean userBean,ModelMap model, HttpServletRequest request, HttpSession session)
														throws JsonGenerationException, JsonMappingException, IOException {
		JSONObject jsonObj = new JSONObject();
		List<Map<String, Object>> results = null;
		try{
			UsersBean userSessionBean = (UsersBean)session.getAttribute("cacheUserBean");
			if(userSessionBean == null){
				userSessionBean = (UsersBean)session.getAttribute("cacheGuest");
				if(userSessionBean == null)
					return "redirect:HomePage";
			}
			//int countryId =  userBean.getId(); //request.getParameter("countryId");
			String country_ids = request.getParameter("country_ids");
			if(StringUtils.isNotBlank(country_ids)){
				results = stateDao.getFilteredStates(country_ids);
			}
			if (results != null && results.size() > 0) {
				jsonObj.put("states_list", results);
				
			} else {
				jsonObj.put("states_list", "");
			}
			
		}catch(Exception e){
			logger.fatal("error in getFilteredStates method");
			logger.error(e);
			e.printStackTrace();
		}
		return jsonObj.toString();
	}
   
   @RequestMapping(value = "/getFilteredCities")
	public @ResponseBody String getFilteredCities(@ModelAttribute("createProfile") UsersBean userBean,ModelMap model, HttpServletRequest request, HttpSession session)
														throws JsonGenerationException, JsonMappingException, IOException {
		JSONObject jsonObj = new JSONObject();
		List<Map<String, Object>> results = null;
		try{
			UsersBean userSessionBean = (UsersBean)session.getAttribute("cacheUserBean");
			if(userSessionBean == null){
				userSessionBean = (UsersBean)session.getAttribute("cacheGuest");
				if(userSessionBean == null)
					return "redirect:HomePage";
			}
			String state_ids = request.getParameter("state_ids");
			if(StringUtils.isNotBlank(state_ids)){
				results = objCityDao.getFilteredCities(state_ids);
			}
			if (results != null && results.size() > 0) {
				jsonObj.put("city_list", results);
				
			} else {
				jsonObj.put("city_list", "");
			}
			
		}catch(Exception e){
			logger.fatal("error in getFilteredCities method");
			logger.error(e);
			e.printStackTrace();
		}
		return jsonObj.toString();
	}
   
   @RequestMapping(value = "/premiumProfiles")
	public String premiumProfiles(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			int total_records = 0;//limit - viewed_count;
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean, "premium");
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				total_records = Integer.parseInt(((Map<String, String>)listOrderBeans.get(0)).get("total_records"));
				request.setAttribute("total_records", total_records);
			} else {
				request.setAttribute("allOrders1", "''");
				request.setAttribute("total_records", "0");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in premiumProfiles method");
			return "CreateProfile";
		}
		return "premiumProfiles";
	}
   
   @RequestMapping(value = "/pendingRequests")
	 public String pendingRequests(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			if("1".equals(sessionBean.getStatus())){
				List<Map<String,Object>> pendingRequests = objUsersDao.getPendingInterestRequests(sessionBean.getId()+"",0);
				if(pendingRequests!=null && pendingRequests.size()>0){
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(pendingRequests);
					request.setAttribute("pendingRequests", sJson);
					total_records = (Long)pendingRequests.get(0).get("total_records");
				}else{
					request.setAttribute("pendingRequests", "''");
				}
			}else{
				request.setAttribute("pendingRequests", "''");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in pendingRequests method");
	  }
		return "pendingRequests";
	 }
   
   @RequestMapping(value = "/mobileNumViewedByMeList")
	 public String mobileNumViewedByMeList(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			if("1".equals(sessionBean.getStatus())){

				List<Map<String,Object>> pendingRequests = objUsersDao.getMobileNumViewedByMeList(sessionBean.getId()+"",0);
				if(pendingRequests!=null && pendingRequests.size()>0){
					//get photos
					for(Map<String,Object> reqObj:pendingRequests){
						List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((Integer)reqObj.get("id"));
						if(photosList!=null && photosList.size()>0){
							//objectMapper = new ObjectMapper();
							//sJson = objectMapper.writeValueAsString(photosList);
							reqObj.put("photosList", photosList);
							reqObj.put("photosListSize", photosList.size());
						}else{
							reqObj.put("photosList", "");
						}
						
						
					}
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(pendingRequests);
					request.setAttribute("pendingRequests", sJson);
					total_records = (Long)pendingRequests.get(0).get("total_records");
				}else{
					request.setAttribute("pendingRequests", "''");
				}
			}else{
				request.setAttribute("pendingRequests", "''");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in pendingRequests method");
	  }
		return "mobileNumViewedByMeList";
	 }
   @RequestMapping(value = "/myProfileViewsList")
	 public String myProfileViewsList(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			String notification_id = request.getParameter("nid");
			if("1".equals(sessionBean.getStatus())){
				if(StringUtils.isNotBlank(notification_id)){
					//update notification status as read
					objUsersDao.updateNotificationStatus(notification_id);
				}
				

				List<Map<String,Object>> pendingRequests = objUsersDao.getProfileViewedMembers(sessionBean.getId()+"",0);
				if(pendingRequests!=null && pendingRequests.size()>0){
					//get photos
					for(Map<String,Object> reqObj:pendingRequests){
						List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((Integer)reqObj.get("id"));
						if(photosList!=null && photosList.size()>0){
							//objectMapper = new ObjectMapper();
							//sJson = objectMapper.writeValueAsString(photosList);
							reqObj.put("photosList", photosList);
							reqObj.put("photosListSize", photosList.size());
						}else{
							reqObj.put("photosList", "");
						}
						
						
					}
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(pendingRequests);
					request.setAttribute("pendingRequests", sJson);
					total_records = (Long)pendingRequests.get(0).get("total_records");
				}else{
					request.setAttribute("pendingRequests", "''");
				}
			}else{
				request.setAttribute("pendingRequests", "''");
			}
			
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			if(StringUtils.isNotBlank(notification_id)){
				int notificationsCount = objUsersDao.getNotificationsCount(sessionBean);
				session.setAttribute("notificationsCount", notificationsCount);
				List<Map<String,Object>> notificationsList = objUsersDao.getNotifications(sessionBean,false);
				if(notificationsList!=null && notificationsList.size()>0){
					session.setAttribute("notificationsList", notificationsList);
				}else{
					session.setAttribute("notificationsList", "");
				}
			}
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in pendingRequests method");
	  }
		return "myProfileViewsList";
	 }
   
   @RequestMapping(value = "/myMobileNoViewsList")
	 public String myMobileNoViewsList(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			String notification_id = request.getParameter("nid");
			if("1".equals(sessionBean.getStatus())){
				
				if(StringUtils.isNotBlank(notification_id)){
					//update notification status as read
					objUsersDao.updateNotificationStatus(notification_id);
				}
				List<Map<String,Object>> pendingRequests = objUsersDao.getMyMobileNoViewedByMembers(sessionBean.getId()+"",0);
				if(pendingRequests!=null && pendingRequests.size()>0){
					//get photos
					for(Map<String,Object> reqObj:pendingRequests){
						List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((Integer)reqObj.get("id"));
						if(photosList!=null && photosList.size()>0){
							//objectMapper = new ObjectMapper();
							//sJson = objectMapper.writeValueAsString(photosList);
							reqObj.put("photosList", photosList);
							reqObj.put("photosListSize", photosList.size());
						}else{
							reqObj.put("photosList", "");
						}
						
						
					}
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(pendingRequests);
					request.setAttribute("pendingRequests", sJson);
					total_records = (Long)pendingRequests.get(0).get("total_records");
				}else{
					request.setAttribute("pendingRequests", "''");
				}
			}else{
				request.setAttribute("pendingRequests", "''");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			if(StringUtils.isNotBlank(notification_id)){
				int notificationsCount = objUsersDao.getNotificationsCount(sessionBean);
				session.setAttribute("notificationsCount", notificationsCount);
				List<Map<String,Object>> notificationsList = objUsersDao.getNotifications(sessionBean,false);
				if(notificationsList!=null && notificationsList.size()>0){
					session.setAttribute("notificationsList", notificationsList);
				}else{
					session.setAttribute("notificationsList", "");
				}
			}
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in pendingRequests method");
	  }
		return "myMobileNoViewsList";
	 }
   
   @RequestMapping(value = "/yetToBeViewed")
	 public String yetToBeViewed(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			String withPhoto = request.getParameter("withPhoto");
			String alreadyContacted = request.getParameter("alreadyContacted");
			long total_records = 0;
			List<Map<String,Object>> pendingRequests = objUsersDao.getyetToBeViewedList(sessionBean.getId()+"",0,null,null,null);
			if(pendingRequests!=null && pendingRequests.size()>0){
				//get photos
				for(Map<String,Object> reqObj:pendingRequests){
					List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((Integer)reqObj.get("id"));
					if(photosList!=null && photosList.size()>0){
						//objectMapper = new ObjectMapper();
						//sJson = objectMapper.writeValueAsString(photosList);
						reqObj.put("photosList", photosList);
						reqObj.put("photosListSize", photosList.size());
					}else{
						reqObj.put("photosList", "");
					}
					
					
				}
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(pendingRequests);
				request.setAttribute("yetToBeViewedList", sJson);
				total_records = (Long)pendingRequests.get(0).get("total_records");
			}else{
				request.setAttribute("yetToBeViewedList", "''");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			Map<Integer, String> cityMap = new LinkedHashMap<Integer, String>();
			try {
				List<CityBean> cities = objCityDao.getAllCities();
				for (CityBean bean : cities) {
					cityMap.put(bean.getId(), bean.getName());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} 
			objectMapper = new ObjectMapper();
			sJson = objectMapper.writeValueAsString(cityMap);
			request.setAttribute("all_cities", sJson);
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in yetToBeViewed method");
	  }
		return "yetToBeViewedList";
	 }
   @RequestMapping(value = "/yetToBeViewedAjaxAction")
	 public @ResponseBody String yetToBeViewedAjaxAction(@ModelAttribute("createProfile") UsersBean searchCriteriaBean, Model objeModel, HttpServletRequest request, HttpSession session) {
		   List<Map<String, Object>> listOrderBeans = null;
		   JSONObject jsOnObj = new JSONObject();
		   try{
			   UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
				if(userBean == null){
					return "redirect:HomePage";
				}

				String withPhoto = request.getParameter("withPhoto");
				String alreadyContacted = request.getParameter("alreadyContacted");
				listOrderBeans = objUsersDao.getyetToBeViewedList(userBean.getId()+"",0,withPhoto,alreadyContacted,null);
				int total_records = 0;//limit - viewed_count;
				request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
				if (listOrderBeans != null && listOrderBeans.size() > 0) {
					//get photos
					for(Map<String,Object> profileObj:listOrderBeans){
						List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(Integer.parseInt(String.valueOf(profileObj.get("id"))));
						
						if(photosList!=null && photosList.size()>0){
							//objectMapper = new ObjectMapper();
							//sJson = objectMapper.writeValueAsString(photosList);
							profileObj.put("photosList", photosList);
							profileObj.put("photosListSize", photosList.size());
						}else{
							profileObj.put("photosList", "");
						}
						
					}
					jsOnObj.put("yetToBeViewedList", listOrderBeans);
					total_records = Integer.parseInt(String.valueOf(((Map<String, Object>)listOrderBeans.get(0)).get("total_records")));
					jsOnObj.put("total_records", total_records);
					//request.setAttribute("total_records", total_records);
				} else {
					/*request.setAttribute("allOrders1", "''");
					request.setAttribute("total_records", "0");*/
					jsOnObj.put("yetToBeViewedList", "");
					jsOnObj.put("total_records", "0");
				}
		   } catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in yetToBeViewedList method  ");
				return null;
			}
		   
		  return jsOnObj.toString(); 
	 
	 }

   @RequestMapping(value = "/viewedNotContacted")
	 public String viewedNotContacted(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			long total_records = 0;
			List<Map<String,Object>> pendingRequests = objUsersDao.getViewedNotContactedList(sessionBean.getId()+"",0,null,null);
			if(pendingRequests!=null && pendingRequests.size()>0){
				//get photos
				for(Map<String,Object> reqObj:pendingRequests){
					List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((Integer)reqObj.get("id"));
					if(photosList!=null && photosList.size()>0){
						//objectMapper = new ObjectMapper();
						//sJson = objectMapper.writeValueAsString(photosList);
						reqObj.put("photosList", photosList);
						reqObj.put("photosListSize", photosList.size());
					}else{
						reqObj.put("photosList", "");
					}
					
					
				}
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(pendingRequests);
				request.setAttribute("viewedNotContactedList", sJson);
				sessionBean.setViewedNotContactedCount(pendingRequests.size()+"");
				total_records = (Long)pendingRequests.get(0).get("total_records");
			}else{
				request.setAttribute("viewedNotContactedList", "''");
				sessionBean.setViewedNotContactedCount("0");
			}
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			
			Map<Integer, String> cityMap = new LinkedHashMap<Integer, String>();
			try {
				List<CityBean> cities = objCityDao.getAllCities();
				for (CityBean bean : cities) {
					cityMap.put(bean.getId(), bean.getName());
				}

			} catch (Exception e) {
				e.printStackTrace();
			} 
			objectMapper = new ObjectMapper();
			sJson = objectMapper.writeValueAsString(cityMap);
			request.setAttribute("all_cities", sJson);
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in yetToBeViewed method");
	  }
		return "viewedNotContactedList";
	 }
   @RequestMapping(value = "/viewedNotContactedAjaxAction")
	 public @ResponseBody String viewedNotContactedAjaxAction(@ModelAttribute("createProfile") UsersBean searchCriteriaBean, Model objeModel, HttpServletRequest request, HttpSession session) {
		   List<Map<String, Object>> listOrderBeans = null;
		   JSONObject jsOnObj = new JSONObject();
		   try{
			   UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
				if(userBean == null){
					return "redirect:HomePage";
				}

				String withPhoto = request.getParameter("withPhoto");
				
				listOrderBeans = objUsersDao.getViewedNotContactedList(userBean.getId()+"",0,withPhoto,null);
				int total_records = 0;//limit - viewed_count;
				request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
				if (listOrderBeans != null && listOrderBeans.size() > 0) {
					//get photos
					for(Map<String,Object> profileObj:listOrderBeans){
						List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(Integer.parseInt(String.valueOf(profileObj.get("id"))));
						
						if(photosList!=null && photosList.size()>0){
							//objectMapper = new ObjectMapper();
							//sJson = objectMapper.writeValueAsString(photosList);
							profileObj.put("photosList", photosList);
							profileObj.put("photosListSize", photosList.size());
						}else{
							profileObj.put("photosList", "");
						}
						
					}
					jsOnObj.put("viewedNotContactedList", listOrderBeans);
					total_records = Integer.parseInt(String.valueOf(((Map<String, Object>)listOrderBeans.get(0)).get("total_records")));
					jsOnObj.put("total_records", total_records);
					//request.setAttribute("total_records", total_records);
				} else {
					/*request.setAttribute("allOrders1", "''");
					request.setAttribute("total_records", "0");*/
					jsOnObj.put("viewedNotContactedList", "");
					jsOnObj.put("total_records", "0");
				}
		   } catch (Exception e) {
				e.printStackTrace();
				System.out.println(e);
				logger.error(e);
				logger.fatal("error in viewedNotContacted method  ");
				return null;
			}
		   
		  return jsOnObj.toString(); 
	 
	 }
   @RequestMapping(value = "/editProfile")
	public @ResponseBody String editProfile(@ModelAttribute("editProfileForm") UsersBean modifiedUserBean,ModelMap model, HttpServletRequest request, HttpSession session)
														throws JsonGenerationException, JsonMappingException, IOException {
		JSONObject jsonObj = new JSONObject();
		List<Map<String, Object>> results = null;
		try{
			UsersBean userSessionBean =  (UsersBean)session.getAttribute("cacheGuest");
				if(userSessionBean == null)
					return "redirect:HomePage";
			
			String dataToBeSaved = modifiedUserBean.getPageName();
			if(StringUtils.isNotBlank(dataToBeSaved)){
				UsersBean  newSessionBean = objUsersDao.loginChecking(userSessionBean.getId());
				Date dob1 = HRMSUtil.dateFormate(modifiedUserBean.getDob());
				if(dob1 !=null){
					modifiedUserBean.setDob1(dob1);
				}
				newSessionBean.setDob(modifiedUserBean.getDob());
				newSessionBean.setDob1(modifiedUserBean.getDob1());
				if("basic_details".equalsIgnoreCase(dataToBeSaved)){
					
					this.copyBasicDetails(modifiedUserBean, newSessionBean);
				}else if("religion_info".equalsIgnoreCase(dataToBeSaved)){
					this.copyReligionInfo(modifiedUserBean, newSessionBean);
				}else if("location".equalsIgnoreCase(dataToBeSaved)){
					this.copyLocation(modifiedUserBean, newSessionBean);
					// username is based on city code..so update username also
					objUsersDao.updateUserName(newSessionBean.getId(), newSessionBean.getCurrentCity());
				}else if("professional_info".equalsIgnoreCase(dataToBeSaved)){
					this.copyProfessionalInfo(modifiedUserBean, newSessionBean);
				}else if("family_details".equalsIgnoreCase(dataToBeSaved)){
					this.copyFamilyDetails(modifiedUserBean, newSessionBean);
				}else if("partner_basic".equalsIgnoreCase(dataToBeSaved)){
					this.copyPartnerBasicReligionPreferences(modifiedUserBean, newSessionBean);
				}else if("partner_professional".equalsIgnoreCase(dataToBeSaved)){
					this.copyPartnerProfessionalPreferences(modifiedUserBean, newSessionBean);
				}else if("partner_location".equalsIgnoreCase(dataToBeSaved)){
					this.copyPartnerLocationPreferences(modifiedUserBean, newSessionBean);
				}else if("about".equalsIgnoreCase(dataToBeSaved)){
					this.copyAboutMySelf(modifiedUserBean, newSessionBean);
				}
				try{
					if(dataToBeSaved.startsWith("partner_")){
						objUserrequirementDao.save(newSessionBean);
					}else{
						objUsersDao.save(newSessionBean);
					}
					
					jsonObj.put("message", "success");
					/*if("partner_basic".equalsIgnoreCase(dataToBeSaved)){
						// to display the updated values back in UI
						Map<String,Object> valuesMap = objUsersDao.getPartnerPreferencesValuesForUser(newSessionBean);
						jsonObj.put("partner_updated_values", valuesMap);
					}*/
				}catch(Exception exp){
					exp.printStackTrace();
					jsonObj.put("message", "failed");
				}
				
				if(userSessionBean.getRoleId() == 4){
					 session.setAttribute("allowed_profiles_limit", "0"); 
				 }else{
					 String allowed_profiles_limit = objUsersDao.getAllowedProfilesLimit(userSessionBean.getId());
					 session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
				 }
				/*UsersBean objUserrequirementBean =  new UsersBean();
				objUserrequirementBean.setUserId(userSessionBean.getId());
				objUserrequirementBean.setUserrequirementId(newSessionBean.getUserrequirementId());
				objUserrequirementDao.save(objUserrequirementBean);*/
				newSessionBean.setSentInterestCount(userSessionBean.getSentInterestCount());
				newSessionBean.setReceivedInterestCount(userSessionBean.getReceivedInterestCount());
				newSessionBean.setAcceptedInterestCount(userSessionBean.getAcceptedInterestCount());
				newSessionBean.setProfileViewedCount(userSessionBean.getProfileViewedCount());
				newSessionBean.setRejectedInterestCount(userSessionBean.getRejectedInterestCount());
				newSessionBean.setProfilesViewedByMeCount(userSessionBean.getProfilesViewedByMeCount());
				newSessionBean.setMobileNumViewedCount(userSessionBean.getMobileNumViewedCount());
				newSessionBean.setMobileNumViewedByMeCount(userSessionBean.getMobileNumViewedByMeCount());
				newSessionBean.setPendingRequestsCount(userSessionBean.getPendingRequestsCount());
				newSessionBean.setYetToBeViewedCount(userSessionBean.getYetToBeViewedCount());
				newSessionBean.setViewedNotContactedCount(userSessionBean.getViewedNotContactedCount());
				
				int filled_status = objUsersDao.getProfileFilledStatus(newSessionBean);
				 session.setAttribute("profile_filled_status", 45+filled_status);
				 session.setAttribute("cacheGuest",newSessionBean);//newSessionBean now holds the modified data also
			}
			
			
		}catch(Exception e){
			logger.fatal("error in editProfile method");
			logger.error(e);
			e.printStackTrace();
		}
		return jsonObj.toString();
	}
   
   @RequestMapping(value = "/sendMail")
	public  @ResponseBody String sendMail(ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		JSONObject objJson =new JSONObject();
		List<Map<String, String>> filteredProfiles = null;
		try {
			UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
			if(userBean == null){
				return "redirect:HomePage";
			}
			String profile_id = request.getParameter("profile_id");
			String mailContent = request.getParameter("mail_content");
			String new_mailContent = "";
			String default_text_option = request.getParameter("default_text_option");
			if(StringUtils.isNotBlank(profile_id)){
				UsersBean receipientUser = objUsersDao.loginChecking(Integer.parseInt(profile_id));
				receipientUser.setMail_content(mailContent);
				try{
					 // send personal message from user to user
					 if(StringUtils.isNotBlank(receipientUser.getEmail())){
						 String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
						 boolean saved = objUsersDao.saveEmailData(userBean, receipientUser,baseurl,"message_mail");
						 //String retVal = EmailUtil.sendInterestMail(userBean, receipientUser, request, objContext);
						 if(saved){
							 objJson.put("message", "success");
							 String excaped_text = receipientUser.getMail_content().replaceAll("\r\n", "##newline##");
							 excaped_text = excaped_text.replaceAll("\t", "##tabspace##");
							 objUsersDao.sendMailMessage(profile_id,excaped_text,default_text_option.equalsIgnoreCase("true")?"1":"0");
							 //session.setAttribute("default_text_option", default_text_option.equalsIgnoreCase("true")?"1":"0");
							 if(default_text_option.equalsIgnoreCase("true")){
								 session.setAttribute("mail_default_text", excaped_text);
								 session.setAttribute("default_text_option", "1");
								 objJson.put("mail_default_text", excaped_text);
								 objJson.put("default_text_option", "1");
							 }
							 // decrease the profile count
							 String allowed_profiles_limit = objUsersDao.getAllowedProfilesLimit(userBean.getId());
							 session.setAttribute("allowed_profiles_limit", allowed_profiles_limit);
						 }else{
							 objJson.put("message", "failed");
						 }
					 }
					 
				 }catch(Exception e){
					 objJson.put("message", "failed");
				 }
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in user's sendMail method  ");
		}
		return String.valueOf(objJson);
	}
   
   @RequestMapping(value = "/inboxAction")
	 public String inboxAction(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  ObjectMapper objectMapper = null;
		String sJson = null;
		List<Map<String,Object>> requests = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			String tab_type = request.getParameter("tab_type");
			String list_type = request.getParameter("list_type");
			long total_records = 0;
			String notification_id = request.getParameter("nid");
			if("1".equals(sessionBean.getStatus())){
				
				if(StringUtils.isNotBlank(notification_id)){
					//update notification status as read
					objUsersDao.updateNotificationStatus(notification_id);
					System.out.println("CALL FROM NOTIFICATION LINK....");
				}
				if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("sent_requests")){
					requests = objUsersDao.getsentRequests(sessionBean.getId()+"",0);
				}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("awaiting_requests")){
					requests = objUsersDao.getAwaitingRequests(sessionBean.getId()+"",0);
				}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("pending_requests")){
					requests = objUsersDao.getPendingInterestRequests(sessionBean.getId()+"",0);
					System.out.println("PENDING REQUESTS LIST:"+requests);
					int pedingCount = objUsersDao.getPendingInterestsCount(sessionBean);
					sessionBean.setPendingRequestsCount(pedingCount+"");
					System.out.println("UPDATED SESSION BEAN WITH COUNT");
					session.setAttribute("cacheGuest",sessionBean);
				}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("accepted_requests")){
					requests = objUsersDao.getacceptedRequests(sessionBean.getId()+"",0);
				}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("rejected_requests")){
					requests = objUsersDao.getRejectedRequests(sessionBean.getId()+"",0);
				}
				else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("filtered_requests")){
					requests = objUsersDao.getFilteredRequests(sessionBean.getId()+"",0);
				}
				if(requests!=null && requests.size()>0){
					//get photos
					for(Map<String,Object> reqObj:requests){
						List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((Integer)reqObj.get("id"));
						if(photosList!=null && photosList.size()>0){
							//objectMapper = new ObjectMapper();
							//sJson = objectMapper.writeValueAsString(photosList);
							reqObj.put("photosList", photosList);
							reqObj.put("photosListSize", photosList.size());
							
							
						}else{
							reqObj.put("photosList", "");
						}
						//add recent activity data
						Map<String,Object> recent_activity = objUsersDao.getRecentActivityOf(sessionBean.getId()+"",(Integer)reqObj.get("id"),list_type);
						//System.out.println("GOT RECENT ACTIVITY...");
						if(recent_activity!=null){
							reqObj.put("recent_activity_map", recent_activity);
						}else{
							reqObj.put("recent_activity_map", "");
						}
						
					}
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(requests);
					request.setAttribute("inbox_requests", sJson);
					total_records = (Long)requests.get(0).get("total_records");
					
				}else{
					request.setAttribute("inbox_requests", "''");
				}
			}else{
				request.setAttribute("inbox_requests", "''");
			}
			request.setAttribute("listType", list_type);
			request.setAttribute("tabType", tab_type);
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			request.setAttribute("total_records", total_records);
			if(StringUtils.isNotBlank(notification_id)){
				int notificationsCount = objUsersDao.getNotificationsCount(sessionBean);
				session.setAttribute("notificationsCount", notificationsCount);
				List<Map<String,Object>> notificationsList = objUsersDao.getNotifications(sessionBean,false);
				System.out.println("UPDATED NOTIFICATIONS LIST");
				if(notificationsList!=null && notificationsList.size()>0){
					session.setAttribute("notificationsList", notificationsList);
				}else{
					session.setAttribute("notificationsList", "");
				}
			}
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in inboxAction method");
	  }
		return "awaitingInterestRequests";
	 }
   
   @RequestMapping(value = "/inboxAjaxAction")
	 public  @ResponseBody String inboxAjaxAction(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	   	JSONObject jsOnObj = new JSONObject();
		List<Map<String,Object>> requests = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			String tab_type = request.getParameter("tab_type");
			String list_type = request.getParameter("list_type");
			long total_records = 0;
			if("1".equals(sessionBean.getStatus())){
				if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("sent_requests")){
					requests = objUsersDao.getsentRequests(sessionBean.getId()+"",0);
				}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("awaiting_requests")){
					requests = objUsersDao.getAwaitingRequests(sessionBean.getId()+"",0);
				}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("pending_requests")){
					String filter_requests = request.getParameter("filter_requests");
					requests = objUsersDao.getFilteredRequests(sessionBean.getId()+"",0);
					if(StringUtils.isNotBlank(filter_requests) && filter_requests.equalsIgnoreCase("true")){
						
						String read = request.getParameter("read");
						String un_read = request.getParameter("un_read");
						
						String all = request.getParameter("all");
						String interests = request.getParameter("interests");
						String messages = request.getParameter("messages");
						String mobile_no_viewed = request.getParameter("mobile_no_viewed");
						
						Map<String,String> readStatusMap = new HashMap<String,String>();
						readStatusMap.put("read", read);
						readStatusMap.put("un_read", un_read);
						
						Map<String,String> communicationTypeMap = new HashMap<String,String>();
						communicationTypeMap.put("all", all);
						communicationTypeMap.put("interests", interests);
						communicationTypeMap.put("messages", messages);
						communicationTypeMap.put("mobile_no_viewed", mobile_no_viewed);
						
						requests = objUsersDao.getPendingRequestsByFilterCriteria(sessionBean.getId()+"", readStatusMap, communicationTypeMap, 0);	
					}else{
						requests = objUsersDao.getPendingInterestRequests(sessionBean.getId()+"",0);
					}
					
				}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("accepted_requests")){
					
					String filter_requests = request.getParameter("filter_requests");
					if(StringUtils.isNotBlank(filter_requests) && filter_requests.equalsIgnoreCase("true")){
						
						String accepted_by_me = request.getParameter("by_me");
						String accepted_by_others = request.getParameter("by_others");
						
						String read = request.getParameter("read");
						String un_read = request.getParameter("un_read");
						
						String all = request.getParameter("all");
						String interests = request.getParameter("interests");
						String messages = request.getParameter("messages");
						String mobile_no_viewed = request.getParameter("mobile_no_viewed");
						
						Map<String,String> acceptedByMap = new HashMap<String,String>();
						acceptedByMap.put("accepted_by_me", accepted_by_me);
						acceptedByMap.put("accepted_by_others", accepted_by_others);
						
						Map<String,String> readStatusMap = new HashMap<String,String>();
						readStatusMap.put("read", read);
						readStatusMap.put("un_read", un_read);
						
						Map<String,String> communicationTypeMap = new HashMap<String,String>();
						communicationTypeMap.put("all", all);
						communicationTypeMap.put("interests", interests);
						communicationTypeMap.put("messages", messages);
						communicationTypeMap.put("mobile_no_viewed", mobile_no_viewed);
						
						requests = objUsersDao.getAcceptedRequestsByFilterCriteria(sessionBean.getId()+"", acceptedByMap, readStatusMap, communicationTypeMap, 0);	
					}else{
						requests = objUsersDao.getacceptedRequests(sessionBean.getId()+"",0);
					}
				}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("rejected_requests")){
					
					String filter_requests = request.getParameter("filter_requests");
					if(StringUtils.isNotBlank(filter_requests) && filter_requests.equalsIgnoreCase("true")){
						
						String rejected_by_me = request.getParameter("by_me");
						String rejected_by_others = request.getParameter("by_others");
						
						String read = request.getParameter("read");
						String un_read = request.getParameter("un_read");
						
						String all = request.getParameter("all");
						String interests = request.getParameter("interests");
						String messages = request.getParameter("messages");
						String mobile_no_viewed = request.getParameter("mobile_no_viewed");
						
						Map<String,String> rejectedByMap = new HashMap<String,String>();
						rejectedByMap.put("rejected_by_me", rejected_by_me);
						rejectedByMap.put("rejected_by_others", rejected_by_others);
						
						Map<String,String> readStatusMap = new HashMap<String,String>();
						readStatusMap.put("read", read);
						readStatusMap.put("un_read", un_read);
						
						Map<String,String> communicationTypeMap = new HashMap<String,String>();
						communicationTypeMap.put("all", all);
						communicationTypeMap.put("interests", interests);
						communicationTypeMap.put("messages", messages);
						communicationTypeMap.put("mobile_no_viewed", mobile_no_viewed);
						
						requests = objUsersDao.getRejectedRequestsByFilterCriteria(sessionBean.getId()+"", rejectedByMap, readStatusMap, communicationTypeMap, 0);	
					}else{
						requests = objUsersDao.getRejectedRequests(sessionBean.getId()+"",0);
					}
					
				}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("filtered_requests")){
					requests = objUsersDao.getFilteredRequests(sessionBean.getId()+"",0);
				}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("accepted_me_requests")){
					//requests = objUsersDao.getRequestsAcceptedMe(sessionBean.getId()+"",0);
				}else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("rejected_me_requests")){
					requests = objUsersDao.getRejectedRequests(sessionBean.getId()+"",0);
				}
				else if(StringUtils.isNotBlank(list_type) && list_type.equalsIgnoreCase("profile_views")){
					requests = objUsersDao.getProfileViewedMembers(sessionBean.getId()+"",0);
				}
				if(requests!=null && requests.size()>0){
					//get photos
					for(Map<String,Object> reqObj:requests){
						List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((Integer)reqObj.get("id"));
						if(photosList!=null && photosList.size()>0){
							//objectMapper = new ObjectMapper();
							//sJson = objectMapper.writeValueAsString(photosList);
							reqObj.put("photosList", photosList);
							reqObj.put("photosListSize", photosList.size());
						}else{
							reqObj.put("photosList", "");
						}
						reqObj.put("recent_activity_map", "");
						//add recent activity data
						Map<String,Object> recent_activity = objUsersDao.getRecentActivityOf(sessionBean.getId()+"",(Integer)reqObj.get("id"),list_type);
						reqObj.put("recent_activity_map", recent_activity);
						
					}
					jsOnObj.put("inbox_requests", requests);
					total_records = (Long)requests.get(0).get("total_records");
				}else{
					jsOnObj.put("inbox_requests", "");
				}
			}else{
				jsOnObj.put("inbox_requests", "");
			}
			jsOnObj.put("listType", list_type);
			jsOnObj.put("tabType", tab_type);
			jsOnObj.put("page_size", MatrimonyConstants.PAGINATION_SIZE);
			jsOnObj.put("total_records", total_records);
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in inboxAjaxAction method");
	   return jsOnObj.put("error", "error").toString();
	  }
		return jsOnObj.toString();
	 }
   

   
  
   
   @RequestMapping(value = "/settings")
	public String settings(@ModelAttribute("settingsForm") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {

		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			UsersBean currentUserBean = objUsersDao.getUser(sessionBean.getUsername());
			String currentPassword = currentUserBean.getPassword();
			
			request.setAttribute("oldPassword", currentPassword);
			
			///////
			List<Map<String,Object>> castes_list =  objCastDao.getCastesBasedOnReligion(sessionBean.getReligion());
			Map<Integer, String> castesMap = new LinkedHashMap<Integer, String>();
			for (Map<String,Object> caste : castes_list) {
				castesMap.put((Integer)caste.get("id"),(String)caste.get("name"));
			}
			request.setAttribute("castes_list", castesMap);
			/////
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			//logger.error(e);
			//logger.fatal("error in CreateProfile class createProfile method  ");
			return "redirect:HomePage.htm";
		}
		return "profileSettings";
	}
  
  @RequestMapping(value = "/changePasswordAction")
	public  @ResponseBody String changePasswordAction(@ModelAttribute("settingsForm") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
	   JSONObject jsOnObj = new JSONObject();
	   String emailStr = "",mobileStr=""; 
		try {
				UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
				if(sessionBean == null){
					return "redirect:HomePage";
				}
				String enteredCurrentPassword = request.getParameter("currentPassword");
				String newPassword = request.getParameter("newPassword1");
				String confirmedNewPassword = request.getParameter("newPassword2");
				UsersBean currentUserBean = objUsersDao.getUser(sessionBean.getUsername());
				String currentPassword = currentUserBean.getPassword();
				if(currentPassword.equals(enteredCurrentPassword)){
					currentUserBean.setPassword(newPassword);
					boolean success = objUsersDao.updatePassword(currentUserBean);
					if(success)
						jsOnObj.putOnce("message", "success");
					else
						jsOnObj.putOnce("message", "failed");
				}else{
					jsOnObj.putOnce("message", "currentpassword_notexist");
				}
				
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			//logger.error(e);
			//logger.fatal("error in CreateProfile class createProfile method  ");
			jsOnObj.putOnce("message", "failed");
		}
		return jsOnObj.toString();
	}
  @RequestMapping(value = "/changeEmailAction")
 	public  @ResponseBody String changeEmailAction(@RequestParam("email") String email, HttpServletRequest request, HttpSession session) {
 	   JSONObject jsOnObj = new JSONObject();
 	   
 		try {
 				UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
 				if(sessionBean == null){
 					return "redirect:HomePage";
 				}
 				System.out.println("Id:"+sessionBean.getId());
 					boolean success = objUsersDao.updateEmail(email,sessionBean.getId());
 			if(success) {
 				jsOnObj.put("message", "email updated successfully");
 			}else {
 				jsOnObj.put("message", "failed");
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 			System.out.println(e);
 			//logger.error(e);
 			//logger.fatal("error in CreateProfile class createProfile method  ");
 			jsOnObj.putOnce("message", "failed");
 		}
 		return jsOnObj.toString();
 	}
  @RequestMapping(value = "/profileSettingsAction")
	public  @ResponseBody String profileSettingsAction(@ModelAttribute("settingsForm") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
	   JSONObject jsOnObj = new JSONObject();
	    
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			//logger.error(e);
			//logger.fatal("error in CreateProfile class createProfile method  ");
			return "redirect:HomePage.htm";
		}
		return jsOnObj.toString();
	}
  @RequestMapping(value = "/membershipDetailsAction")
	public  @ResponseBody String membershipDetailsAction(@ModelAttribute("settingsForm") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
	   JSONObject jsOnObj = new JSONObject();
	    
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			Map<String,Object> membership_details = objUsersDao.getMembershipDetails(sessionBean);
			if(membership_details!=null){
				jsOnObj.put("message", "success");
				jsOnObj.put("membership_details", membership_details);
			}else{
				jsOnObj.put("message", "failed");
				jsOnObj.put("membership_details", "");
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
  
  @RequestMapping(value = "/deleteProfileAction")
	public  @ResponseBody String deleteProfileAction(@ModelAttribute("settingsForm") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
	   JSONObject jsOnObj = new JSONObject();
	    
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			objUsersBean.setStatus("2");
			objUsersBean.setId(sessionBean.getId());
			boolean updated = objUsersDao.updateStatus(objUsersBean);
			if(updated){
				jsOnObj.put("message", "success");
				
			}else{
				jsOnObj.put("message", "failed");
				
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
  @RequestMapping(value = "/updateProfileStatus")
	public  @ResponseBody String updateProfileStatus(@ModelAttribute("settingsForm") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
	   JSONObject jsOnObj = new JSONObject();
	    
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			String status = request.getParameter("status");
			objUsersBean.setStatus(status);
			objUsersBean.setId(sessionBean.getId());
			boolean updated = objUsersDao.updateStatus(objUsersBean);
			if(updated){
				jsOnObj.put("message", "success");
				
			}else{
				jsOnObj.put("message", "failed");
				
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
   
   private UsersBean copyAboutMySelf(UsersBean source,UsersBean target){
	   target.setAboutMyself(source.getAboutMyself());
	   
	   return target;
   }
   private UsersBean copyBasicDetails(UsersBean source,UsersBean target){
	   target.setCreateProfileFor(source.getCreateProfileFor());
	   target.setFirstName(source.getFirstName());
	   target.setLastName(source.getLastName());
	   target.setBodyType(source.getBodyType());
	   target.setComplexion(source.getComplexion());
	   target.setAge(source.getAge());
	   target.setHeight(source.getHeight());
	   target.setDisability(source.getDisability());
	   target.setWeight(source.getWeight());
	   target.setDiet(source.getDiet());
	   target.setMotherTongue(source.getMotherTongue());
	   target.setDrinking(source.getDrinking());
	   target.setSmoking(source.getSmoking());
	   target.setMaritalStatus(source.getMaritalStatus());
	   return target;
   }
   private UsersBean copyReligionInfo(UsersBean source,UsersBean target){
	   target.setReligion(source.getReligion());
	   target.setCaste(source.getCaste());
	   target.setGotram(source.getGotram());
	   target.setStar(source.getStar());
	   target.setDosam(source.getDosam());
	   
	   return target;
   }
   private UsersBean copyLocation(UsersBean source,UsersBean target){
	   target.setCurrentCountry(source.getCurrentCountry());
	   target.setCurrentCity(source.getCurrentCity());
	   target.setCurrentState(source.getCurrentState());
	   
	   return target;
   }
   private UsersBean copyProfessionalInfo(UsersBean source,UsersBean target){
	   target.setEducation(source.getEducation());
	   target.setWorkingWith(source.getWorkingWith());
	   target.setOccupation(source.getOccupation());
	   
	   return target;
   }
   private UsersBean copyFamilyDetails(UsersBean source,UsersBean target){
	   target.setFatherName(source.getFatherName());
	   target.setMotherName(source.getMotherName());
	   target.setfOccupation(source.getfOccupation());
	   target.setmOccupation(source.getmOccupation());
	   target.setNoOfBrothers(source.getNoOfBrothers());
	   target.setNoOfSisters(source.getNoOfSisters());
	   target.setNoOfBrothersMarried(source.getNoOfBrothersMarried());
	   target.setNoOfSistersMarried(source.getNoOfSistersMarried());
	   
	   return target;
   }
   private UsersBean copyPartnerBasicReligionPreferences(UsersBean source,UsersBean target){
	   target.setrAgeFrom(source.getrAgeFrom());
	   target.setrAgeTo(source.getrAgeTo());
	   target.setrHeight(source.getrHeight());
	   target.setrHeightTo(source.getrHeightTo());
	   target.setrMaritalStatus(source.getrMaritalStatus().equalsIgnoreCase("null")?null:source.getrMaritalStatus());
	   target.setrDiet(source.getrDiet().equalsIgnoreCase("null")?null:source.getrDiet());
	   target.setrReligion(source.getrReligion().equalsIgnoreCase("null")?null:source.getrReligion());
	   target.setrMotherTongue(source.getrMotherTongue().equalsIgnoreCase("null")?null:source.getrMotherTongue());
	   target.setrCaste(source.getrCaste().equalsIgnoreCase("null")?null:source.getrCaste());
	   
	   return target;
   }
   private UsersBean copyPartnerProfessionalPreferences(UsersBean source,UsersBean target){
	   target.setrEducation(source.getrEducation().equalsIgnoreCase("null")?null:source.getrEducation());
	   target.setrWorkingWith(source.getrWorkingWith().equalsIgnoreCase("null")?null:source.getrWorkingWith());
	   target.setrOccupation(source.getrOccupation().equalsIgnoreCase("null")?null:source.getrOccupation());
	   target.setrAnnualIncome(source.getrAnnualIncome().equalsIgnoreCase("null")?null:source.getrAnnualIncome());
	   
	   return target;
   }
   private UsersBean copyPartnerLocationPreferences(UsersBean source,UsersBean target){
	   target.setrCountry(source.getrCountry().equalsIgnoreCase("null")?null:source.getrCountry());
	   target.setrState(source.getrState().equalsIgnoreCase("null")?null:source.getrState());
	   target.setrCity(source.getrCity().equalsIgnoreCase("null")?null:source.getrCity());
	   //target.setrCity(source.getrCity());
	   
	   return target;
   }
   
   public String setInitialData(UsersBean objUserBean,HttpSession session,HttpServletRequest request){
		//update login time
		objUsersDao.updateLoginTime(objUserBean,"1");
		
			Map<String,Object> interestCounts = objUsersDao.getInterestCounts(objUserBean);
			/*long notificationsCount = (Long)interestCounts.get("receivedInterestCount")
									+ (Long)interestCounts.get("mobileNumViewedCount")
									+ (Long)interestCounts.get("profileViewedCount")
									+ (Long)interestCounts.get("shortListedCount");*/
			if(objUserBean.getStatus().equals("1")){
				int notificationsCount = objUsersDao.getNotificationsCount(objUserBean);
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
		
		if(objUserBean.getRoleId() ==1){
			session.setAttribute("cacheUserBean", objUserBean);
			session.setAttribute("rolId", objUserBean.getRoleId());
			session.setAttribute("userName", objUserBean.getUsername());
			return "redirect:admin/dashboard";
		}else if(objUserBean.getRoleId() == 4){
			
			String otpStatus = objUsersDao.getOtpStatus(objUserBean);
			
			objUserBean.setOtpStatus(otpStatus);
			session.setAttribute("allowed_profiles_limit", "0");
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
			String allowed_profiles_limit = objUsersDao.getAllowedProfilesLimit(objUserBean.getId());
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
	}
   @RequestMapping(value = "/verifyEmail")
	public @ResponseBody String verifyEmail( HttpSession session,HttpServletRequest request) {
	   boolean response;
	   JSONObject joJsonObject = new JSONObject();
		try{
			
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheGuest");
			if(objuserBean != null ){
				if(objuserBean.getEmailverify().equals("0")){
					 EmailUtil emailUtil = new EmailUtil();
					 // email to user email verification link
//						 response = emailUtil.emailVerify(objuserBean, objContext,request);
						 String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
						 response =objUsersDao.saveEmailData(null, objuserBean, baseurl, "emailVerify_mail");
						 joJsonObject.put("msg", response);
				}else{
					 joJsonObject.put("msg", "");
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in BodyTypeController class deleteBodyType method");
		}
		return String.valueOf(joJsonObject);
	}
   @RequestMapping(value = "/emailvarificationlink")
  	public  String emailvarificationlink( HttpSession session,HttpServletRequest request) {
  		try{
  			String email =request.getParameter("email");
  			String code = request.getParameter("code");
  			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheGuest");
  			boolean verify = false;
  			if(StringUtils.isNotBlank(email) && StringUtils.isNotBlank(code)){
  				UsersBean usersBean = objUsersDao.emailVerificationCheck(email, code);
  				if(usersBean != null){
  					if(usersBean.getEmailverify().equals("1")){
  						request.setAttribute("msg", "Already email is verified");
  					}else{
  						
  						verify = 	objUsersDao.updateEmailVerification(email);
  						if(verify){
  							request.setAttribute("msg", "Email verification is successfully completed ");
  						}
  					}
  				}else{
  					request.setAttribute("msg", "Data mismatch ");
  				}
  			}
  			
  		}catch(Exception e){
  			e.printStackTrace();
  			System.out.println(e);
  			logger.error(e);
  			logger.fatal("error in BodyTypeController class deleteBodyType method");
  		}
  		return "emailVerificationLink";
  	}
   
   @RequestMapping(value = "/allNotifications")
	 public String allNotifications(@ModelAttribute("notificationsForm") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	  List<Map<String, Object>> notifications = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			notifications = objUsersDao.getNotifications(sessionBean, true);
			if(notifications!=null && notifications.size()>0){
				request.setAttribute("notificationsList", notifications);
			}else{
				request.setAttribute("notificationsList", notifications);
			}
			int notificationsCount = objUsersDao.getNotificationsCount(sessionBean);
			session.setAttribute("notificationsCount", notificationsCount);
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in allNotifications method");
	  }
		return "allNotifications";
	 }
  
   @RequestMapping(value = "/allPreferredProfiles")
 public String PreferredProfiles( @ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel,HttpServletRequest request, HttpSession session){
	   List<Map<String, String>> listOrderBeans = null;
			ObjectMapper objectMapper = null;
			String sJson = null;
			try {
				int page_no = 0;
				/*String clicked_btn = request.getParameter("btn_id");
				if(StringUtils.isNotBlank(clicked_btn))
					page_no = (Integer.parseInt(clicked_btn))-1;*/
				listOrderBeans = objUsersDao.getProfilesFilteredByPreferences(page_no);
				int total_records = 0;//MatrimonyConstants.FREE_USER_PROFILES_LIMIT;
				request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
				if (listOrderBeans != null && listOrderBeans.size() > 0) {
					
					objectMapper = new ObjectMapper();
					sJson = objectMapper.writeValueAsString(listOrderBeans);
					request.setAttribute("allOrders1", sJson);
					total_records =listOrderBeans.size();
								
					request.setAttribute("total_records", total_records);
				} else {
					request.setAttribute("allOrders1", "''");
					request.setAttribute("total_records", "0");
				}
			}catch(Exception e){
				 e.printStackTrace();
				   System.out.println(e);
				   logger.error(e);
				   logger.fatal("error in HomePageController class familyDetails method");
				  }
			
	 return "allPreferredProfiles";
 }
   
   @RequestMapping(value = "/removeNotification")
	public @ResponseBody String removeNotification( HttpServletRequest request, HttpSession session,UsersBean objUsersBean) {
		 System.out.println("removeNotification page...");
		 List<Map<String, Object>> notifications = null;
		JSONObject jsonObj = new JSONObject();
		boolean delete = false;
		String idParam=request.getParameter("id");
		
		try {
				delete = objUsersDao.deleteNotification(Integer.parseInt(idParam));
				if (delete) {
					jsonObj.put("delete", "delete");
				} else {
					jsonObj.put("delete", "");
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

   @RequestMapping(value = "/removeALLNotification")
	public @ResponseBody String removeALLNotification( HttpServletRequest request, HttpSession session,UsersBean objUsersBean) {
		 System.out.println("removeALLNotification page...");
		 List<Map<String, Object>> notifications = null;
		JSONObject jsonObj = new JSONObject();
		boolean delete = false;
		
		try {
				delete = objUsersDao.deleteALLNotification();
				if (delete) {
					jsonObj.put("delete", "delete");
				} else {
					jsonObj.put("delete", "");
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


@RequestMapping(value = "/recentlyViewedProfiles")
public String recentlyViewedProfiles(@ModelAttribute("createProfile") UsersBean searchCriteriaBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	 List<Map<String, Object>> listOrderBeans = null;
	  ObjectMapper objectMapper = null;
		String sJson = null;
	  try{
		   UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
			if(userBean == null){
				return "redirect:HomePage";
			}

			String withPhoto = request.getParameter("withPhoto");
			String alreadyViewed = request.getParameter("alreadyViewed");
			String alreadyContacted = request.getParameter("alreadyContacted");
			listOrderBeans = objUsersDao.getRecentlyViewedProfiles(userBean);
			int total_records = 0;//limit - viewed_count;
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				//get photos
				for(Map<String,Object> profileObj:listOrderBeans){
					List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((int) profileObj.get("id"));
					if(photosList!=null && photosList.size()>0){
						String imgStr = "";
						for(Map<String,Object> photo:photosList){
							if(StringUtils.isBlank(imgStr)){
								imgStr = (String)photo.get("image");
							}else
								imgStr += ","+photo.get("image");
						}
						profileObj.put("photosList", imgStr);
					}else{
						profileObj.put("photosList", "");
					}
					
					
				}
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				total_records = listOrderBeans.size();
				request.setAttribute("total_records", total_records);
			} else {
				request.setAttribute("allOrders1", "''");
				request.setAttribute("total_records", "0");
			}
	  } catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in interestRequestsPagination method  ");
			return null;
		}
	  
	 return "recentlyViewedProfiles"; 

	}

@RequestMapping(value = "/help")
public String help(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
 
	try {
		UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
		if(sessionBean == null){
			return "redirect:HomePage";
		}
		request.setAttribute("allOrders1", "null");
		request.setAttribute("total_records", MatrimonyConstants.FREE_USER_PROFILES_LIMIT);
		request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);

		
	} catch (Exception e) {
  e.printStackTrace();
  System.out.println(e);
  logger.error(e);
  logger.fatal("error in recentlyViewedProfiles method");
 }
 return "help";
}

@RequestMapping(value = "/premiumMembers")
public String premiumMembers(@ModelAttribute("createProfile") UsersBean searchCriteriaBean, Model objeModel, HttpServletRequest request, HttpSession session) {
	List<Map<String, Object>>listOrderBeans = null;
  ObjectMapper objectMapper = null;
	String sJson = null;
  try{
	   UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
		if(userBean == null){
			return "redirect:HomePage";
		}

		String withPhoto = request.getParameter("withPhoto");
		String alreadyViewed = request.getParameter("alreadyViewed");
		String alreadyContacted = request.getParameter("alreadyContacted");
		listOrderBeans = objUsersDao.getPremiumMembers(userBean);
		int total_records = 0;//limit - viewed_count;
		request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
		
		if (listOrderBeans != null && listOrderBeans.size() > 0) {
			//get photos
			for(Map<String,Object> profileObj:listOrderBeans){
				List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos((int) profileObj.get("id"));
				if(photosList!=null && photosList.size()>0){
					String imgStr = "";
					for(Map<String,Object> photo:photosList){
						if(StringUtils.isBlank(imgStr)){
							imgStr = (String)photo.get("image");
						}else
							imgStr += ","+photo.get("image");
					}
					profileObj.put("photosList", imgStr);
				}else{
					profileObj.put("photosList", "");
				}
				
				
			}
			objectMapper = new ObjectMapper();
			sJson = objectMapper.writeValueAsString(listOrderBeans);
			request.setAttribute("allOrders1", sJson);
			total_records = listOrderBeans.size();
			request.setAttribute("total_records", total_records);
		} else {
			request.setAttribute("allOrders1", "''");
			request.setAttribute("total_records", "0");
		}
  } catch (Exception e) {
		e.printStackTrace();
		System.out.println(e);
		logger.error(e);
		logger.fatal("error in interestRequestsPagination method  ");
		return null;
	}
  
 return "premiumMembers"; 

}
	private int getMatchScoreOf(String r_vals,String u_val){
		if(StringUtils.isNotBlank(r_vals)){
			if(StringUtils.isNotBlank(u_val)){
				String[] strArr = r_vals.split(",");
				for(String rVal:strArr){
					if(u_val.equalsIgnoreCase(rVal)){
						return 7;
					}
				}
			}
			return 0;
		}else{
			return 7;
		}
	}
	private int getMatchScoreOf2(Object r_vals,String u_val){
		if(r_vals != null && StringUtils.isNotBlank((String)r_vals)){
			if(StringUtils.isNotBlank(u_val)){
				String[] strArr = ((String)r_vals).split(",");
				for(String rVal:strArr){
					if(u_val.equalsIgnoreCase(rVal)){
						return 7;
					}
				}
			}
			return 0;
		}else{
			return 7;
		}
	}
	private int getProfileMatchScore(UsersBean userBean, Map<String,String> profileObj){
		int match_score = 0;
		String r_age_from = profileObj.get("rAgeFrom");
		String r_age_to = profileObj.get("rAgeTo");
		if(StringUtils.isNotBlank(r_age_from) && StringUtils.isNotBlank(r_age_to)){
			int age_from = Integer.parseInt(r_age_from);
			int age_to = Integer.parseInt(r_age_to);
			int user_age = Integer.parseInt(userBean.getAge());
			if(age_from<=user_age && user_age<=age_to){
				match_score += 8;
			}
		}
		
		String r_height_from = profileObj.get("rHeight");
		String r_height_to = profileObj.get("rHeightTo");
		if(StringUtils.isNotBlank(r_height_from) && StringUtils.isNotBlank(r_height_to)){
			int height_from = Integer.parseInt(r_height_from);
			int height_to = Integer.parseInt(r_height_to);
			int user_height = Integer.parseInt(userBean.getHeight());
			if(height_from<=user_height && user_height<=height_to){
				match_score += 8;
			}
		}
		
		String r_val = profileObj.get("rMaritalStatus");
		String user_val = userBean.getMaritalStatus();
		int addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		
		r_val = profileObj.get("rCaste");
		user_val = userBean.getCaste();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rReligion");
		user_val = userBean.getReligion();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rMotherTongue");
		user_val = userBean.getMotherTongue();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rEducation");
		user_val = userBean.getEducation();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rWorkingWith");
		user_val = userBean.getWorkingWith();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rOccupation");
		user_val = userBean.getOccupation();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rAnnualIncome");
		user_val = userBean.getAnnualIncome();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rCity");
		user_val = userBean.getCurrentCity();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rCountry");
		user_val = userBean.getCurrentCountry();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rState");
		user_val = userBean.getCurrentState();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rCity");
		user_val = userBean.getCurrentCity();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rDiet");
		user_val = userBean.getDiet();
		addedScore = this.getMatchScoreOf(r_val, user_val);
		match_score += addedScore;
		
		return match_score;
	}
	private int getProfileMatchScore2(UsersBean userBean, Map<String,Object> profileObj){
		int match_score = 0;
		Object r_age_from = profileObj.get("rAgeFrom");
		Object r_age_to = profileObj.get("rAgeTo");
		if(r_age_from!=null && r_age_to!=null && StringUtils.isNotBlank((String)r_age_from) && StringUtils.isNotBlank((String)r_age_to)){
			int age_from = Integer.parseInt((String)r_age_from);
			int age_to = Integer.parseInt((String)r_age_to);
			int user_age = Integer.parseInt(userBean.getAge());
			if(age_from<=user_age && user_age<=age_to){
				match_score += 8;
			}
		}
		
		Object r_height_from = profileObj.get("rHeight");
		Object r_height_to = profileObj.get("rHeightTo");
		if(r_height_from!=null && r_height_to!=null && StringUtils.isNotBlank((String)r_height_from) && StringUtils.isNotBlank((String)r_height_to)){
			int height_from = Integer.parseInt((String)r_height_from);
			int height_to = Integer.parseInt((String)r_height_to);
			int user_height = Integer.parseInt(userBean.getHeight());
			if(height_from<=user_height && user_height<=height_to){
				match_score += 8;
			}
		}
		
		Object r_val = profileObj.get("rMaritalStatus");
		String user_val = userBean.getMaritalStatus();
		int addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		
		r_val = profileObj.get("rCaste");
		user_val = userBean.getCaste();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rReligion");
		user_val = userBean.getReligion();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rMotherTongue");
		user_val = userBean.getMotherTongue();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rEducation");
		user_val = userBean.getEducation();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rWorkingWith");
		user_val = userBean.getWorkingWith();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rOccupation");
		user_val = userBean.getOccupation();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rAnnualIncome");
		user_val = userBean.getAnnualIncome();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rCity");
		user_val = userBean.getCurrentCity();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rCountry");
		user_val = userBean.getCurrentCountry();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rState");
		user_val = userBean.getCurrentState();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rCity");
		user_val = userBean.getCurrentCity();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		r_val = profileObj.get("rDiet");
		user_val = userBean.getDiet();
		addedScore = this.getMatchScoreOf2(r_val, user_val);
		match_score += addedScore;
		
		return match_score;
	}
} 




