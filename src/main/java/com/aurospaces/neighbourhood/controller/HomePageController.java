package com.aurospaces.neighbourhood.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.AutoCompleteBean;
import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.bean.CastBean;
import com.aurospaces.neighbourhood.bean.CityBean;
import com.aurospaces.neighbourhood.bean.ContriesBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.bean.MemberShipBean;
import com.aurospaces.neighbourhood.bean.Members;
import com.aurospaces.neighbourhood.bean.Paymenthistory;
import com.aurospaces.neighbourhood.bean.ReligionBean;
import com.aurospaces.neighbourhood.bean.UserImagesBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.CityDao;
import com.aurospaces.neighbourhood.db.dao.CountriesDao;
import com.aurospaces.neighbourhood.db.dao.PaymenthistoryDao;
import com.aurospaces.neighbourhood.db.dao.UserImageUploadDao;
import com.aurospaces.neighbourhood.db.dao.UserrequirementDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.filter.JavaIntegrationKit;
import com.aurospaces.neighbourhood.util.EmailUtil;
import com.aurospaces.neighbourhood.util.HRMSUtil;
import com.aurospaces.neighbourhood.util.MatrimonyConstants;
import com.aurospaces.neighbourhood.util.MiscUtils;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Controller
public class HomePageController {
	private Logger logger = Logger.getLogger(CreateProfileController.class);
	@Autowired
	CountriesDao objCountriesDao;
	 @Autowired BranchDao objBranchDao;
   @Autowired UsersDao objUsersDao;
   @Autowired UserrequirementDao objUserrequirementDao;
   @Autowired	ServletContext objContext;
   @Autowired CityDao objCityDao;
   @Autowired UserImageUploadDao objUserImageUploadDao;
   @Autowired PaymenthistoryDao paymenthistoryDao;
   
	@RequestMapping(value = "/HomePage")
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
			return "countriesHome";
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
		return "redirect:profile.htm?page=1";
	}
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
				 if(objUsersBean != null){
				 objeModel.addAttribute("createProfile", objUsersBean);
				 }
				 BeanUtils.copyProperties(objUsersBean1,objUsersBean,getNullPropertyNames(objUsersBean1));
				 objUsersDao.save(objUsersBean1);
				 if(StringUtils.isNotBlank(objUsersBean.getRedirectPage())){
					if("myProfile".equalsIgnoreCase(objUsersBean.getRedirectPage())){
						objUserrequirementBean.setUserId(sessionBean.getId());
						objUserrequirementBean.setUserrequirementId(objUsersBean1.getUserrequirementId());
						objUserrequirementDao.save(objUserrequirementBean);
					}
					redirectPage = objUsersBean.getRedirectPage();
				}
				 // now update the data in session
				 //objUsersBean1.setUsername(objUsersBean1.getEmail());
				 UsersBean newSessionBean = objUsersDao.loginChecking(objUsersBean1.getId());
				 session.setAttribute("cacheGuest",newSessionBean);
				 /////
				 Object filled_status = session.getAttribute("profile_filled_status");
				 int intValOfStatus = 0;
				 if(filled_status != null){
					 intValOfStatus = Integer.parseInt((String)filled_status);
				 }
				 if(StringUtils.isBlank(sessionBean.getAboutMyself()) && StringUtils.isBlank(sessionBean.getDisability())){
					 if(StringUtils.isNotBlank(objUsersBean1.getAboutMyself()) || StringUtils.isNotBlank(objUsersBean1.getDisability())){
						 session.setAttribute("profile_filled_status", (intValOfStatus+10)+"");
					 } 
				 }
				 
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
			 objUsersBean1.setNoOfSisters(objUsersBean.getNoOfSistersMarried());
			 objUsersDao.save(objUsersBean1);
			 String filled_status = (String)session.getAttribute("profile_filled_status");
			 int intValOfStatus = 0;
			 if(StringUtils.isNotBlank(filled_status)){
				 intValOfStatus = Integer.parseInt(filled_status);
			 }
			 if(StringUtils.isBlank(sessionBean.getFatherName()) && StringUtils.isBlank(sessionBean.getMotherName())){
				 if(StringUtils.isNotBlank(objUsersBean1.getFatherName()) || StringUtils.isNotBlank(objUsersBean1.getMotherName())){
					 session.setAttribute("profile_filled_status", (intValOfStatus+15)+"");
				 } 
			 }
			 
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
						    	Object filled_status = session.getAttribute("profile_filled_status");
						    	int intValOfStatus = 0;
						    	if(filled_status != null){
									 intValOfStatus = Integer.parseInt((String)filled_status);
								 }
						    	if(StringUtils.isBlank(sessionBean.getImage())){
						    		session.setAttribute("profile_filled_status", (intValOfStatus+15)+"");
						    	}
								
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
	  return "memberShipPage";
	  
	 }
	 
	 @RequestMapping(value = "/savePartnerProfile")
	 public String savePartnerProfile(@ModelAttribute("partnerProfile") UsersBean objUserrequirementBean, @RequestParam String[] rCountry, Model objeModel ,
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
			 if(rCountry != null)
			 {
				 String reqCountry = Arrays.toString(rCountry);
				 reqCountry = reqCountry.replace("[", "");
				 reqCountry = reqCountry.replace(", ", ",");
				 reqCountry = reqCountry.replace("]", "");
				 objUserrequirementBean.setrCountry(reqCountry);
			 }
//			 objUserrequirementBean.setrCountry(Arrays.toString(rCountry).replaceAll("/[", "").replaceAll("/]", ""));
			 objUserrequirementDao.save(objUserrequirementBean);
			 String filled_status = (String)session.getAttribute("profile_filled_status");
			 int intValOfStatus = 0;
			 if(StringUtils.isNotBlank(filled_status)){
				 intValOfStatus = Integer.parseInt(filled_status);
			 }
			 if(StringUtils.isBlank(objUserrequirementBean.getrAgeFrom()) && StringUtils.isBlank(objUserrequirementBean.getrAgeTo()) && StringUtils.isBlank(objUserrequirementBean.getrMaritalStatus())){
				 if(StringUtils.isNotBlank(objUserrequirementBean.getrAgeFrom()) || StringUtils.isNotBlank(objUserrequirementBean.getrAgeTo()) || StringUtils.isNotBlank(objUserrequirementBean.getrMaritalStatus())){
					 session.setAttribute("profile_filled_status", (intValOfStatus+15)+"");
				 } 
			 }
			 
			}else{
				return "redirect:HomePage";
			}
		  
	  } catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class partnerProfile method");
	  }
	  return "redirect:thankyou";
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
	 public String myProfile(@ModelAttribute("createProfile") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
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
			
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class familyDetails method");
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
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			int profile_id = objUserssBean.getId();
			UsersBean profileBean = objUsersDao.loginChecking(profile_id);
			request.setAttribute("profileBean", profileBean);
			List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(profile_id);
			request.setAttribute("photosList", photosList);
			
			
		} catch (Exception e) {
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
//	  System.out.println("dashboard Page");
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
			/*String clicked_btn = request.getParameter("btn_id");
			if(StringUtils.isNotBlank(clicked_btn))
				page_no = (Integer.parseInt(clicked_btn))-1;*/
			listOrderBeans = objUsersDao.getProfilesFilteredByPreferences(page_no);
			int total_records = MatrimonyConstants.FREE_USER_PROFILES_LIMIT;
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				int count = Integer.parseInt(((Map<String, String>)listOrderBeans.get(0)).get("total_records"));
				if(count<total_records){
					total_records = count;
				}
			
				request.setAttribute("total_records", total_records);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
				request.setAttribute("total_records", "0");
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
			
			listOrderBeans = objUsersDao.getSearchResults(searchCriteriaBean,page_no);
			int role_id = sessionBean.getRoleId();
			int limit = 0;
			limit = getLimitFor(role_id);
			/*if((role_id == MatrimonyConstants.FREE_USER_ROLE_ID) || (role_id==MatrimonyConstants.CLASSIC_USER_ROLE_ID))
				limit = MatrimonyConstants.FREE_USER_PROFILES_LIMIT;
			else if(role_id == MatrimonyConstants.CLASSIC_PLUS_USER_ROLE_ID)
				limit = MatrimonyConstants.CLASSIC_PLUS_USER_PROFILES_LIMIT;
			else if(role_id == MatrimonyConstants.PREMIUM_USER_ROLE_ID)
				limit = MatrimonyConstants.PREMIUM_USER_PROFILES_LIMIT;
			else if(role_id == MatrimonyConstants.PREMIUM_PLUS_USER_ROLE_ID)
				limit = MatrimonyConstants.PREMIUM_PLUS_USER_PROFILES_LIMIT;
			else if(role_id == MatrimonyConstants.AARNA_PREMIUM_USER_ROLE_ID)
				limit = MatrimonyConstants.AARNA_PREMIUM_USER_PROFILES_LIMIT;*/
			int viewed_count = objUsersDao.getMobileNumViewedCount(sessionBean.getId()+"");
			int total_records = limit - viewed_count;
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
					int count = Integer.parseInt(((Map<String, String>)listOrderBeans.get(0)).get("total_records"));
					if(count<total_records){
						total_records = count;
					}
				
					request.setAttribute("total_records", total_records);
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
			try {
				String id = null;
				id=request.getParameter("id");
				List<CityBean> ojCityBean = objCityDao.filterByState(id);
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
					int role_id = sessionBean.getRoleId();
					int limit = 0;
					limit = getLimitFor(role_id);
					int viewed_count = objUsersDao.getMobileNumViewedCount(sessionBean.getId()+"");
					int total_records = limit - viewed_count;
					if(filteredProfiles.size()>0){
						int count = Integer.parseInt(((Map<String, String>)filteredProfiles.get(0)).get("total_records"));
						if(count<total_records){
							total_records = count;
						}
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
				String profile_id = request.getParameter("profile_id");
				String list_type = request.getParameter("list_type");
				if(StringUtils.isNotBlank(profile_id)){
					boolean success = objUsersDao.viewMobileNumber(profile_id);
					if(success){
						objJson.put("message", "success");
					}else{
						objJson.put("message", "failed");
					}
				}
				if(StringUtils.isNotBlank(list_type)){
					if("preferences".equalsIgnoreCase(list_type)){
						//filteredProfiles = objUsersDao.getProfilesFilteredByPreferences();
					}else if("search".equalsIgnoreCase(list_type)){
						//filteredProfiles = objUsersDao.getProfilesFilteredByAge(ageFrom, ageTo, education, currentCity)
					}else if("categories".equalsIgnoreCase(list_type)){
						//filteredProfiles = objUsersDao.getProfilesFilteredByCast(castValues, religionValues, educationValues)
					}
				}
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
	 
	 
	 @RequestMapping(value = "/expressInterestTo")
		public  @ResponseBody String expressInterestTo(ModelMap model,
				HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
			JSONObject objJson =new JSONObject();
			//List<Map<String,String>> allProfiles = null;
			boolean success = false;
			int page_no = 0;
			try {
				String clicked_btn = request.getParameter("btn_id");
				if(StringUtils.isNotBlank(clicked_btn)){
					page_no = (Integer.parseInt(clicked_btn))-1;
				}
				String profileId = request.getParameter("profile_id");
				success = objUsersDao.expressInterestTo(profileId);
				if(success){
					objJson.put("message", "success");
					UsersBean userBean = (UsersBean)session.getAttribute("cacheGuest");
					userBean.setSentInterestCount((Integer.parseInt(userBean.getSentInterestCount())+1)+"");
					session.setAttribute("cacheGuest",userBean);
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
			}
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
	public Map<Integer, String> populateState() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "select id,name from state  where status='1' order by name asc";
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
			int price = objUsersDao.getPackagePriceById(Integer.parseInt(objUsersBean.getPackageId()));
			session.setAttribute("packageId", objUsersBean.getPackageId());
			JavaIntegrationKit integrationKit = new JavaIntegrationKit();
	        Map<String, String> values = integrationKit.hashCalMethod(request, response,price);
			
	        Paymenthistory objPaymenthistoryBean =new Paymenthistory();
	         objPaymenthistoryBean.setTxid(values.get("txnid").trim());
	         objPaymenthistoryBean.setMemberId(String.valueOf(userId));
	         objPaymenthistoryBean.setPaymentStatus("In Progress");
	         objPaymenthistoryBean.setPrice(price);
	         
	         paymenthistoryDao.save(objPaymenthistoryBean);
	         
	         PrintWriter writer = response.getWriter();
	         String htmlResponse = "<html> <body> \n"
	                 + "      \n"
	                 + "  \n"
	                 + "  <h1>PayUForm </h1>\n"
	                 + "  \n" + "<div>"
	                 + "        <form id=\"payuform\" action=\"" + values.get("action") + "\"  name=\"payuform\" method=POST >\n"
	                 + "      <input type=\"hidden\" name=\"key\" value='m7fkbzwB'>"
	                 + "      <input type=\"hidden\" name=\"hash\" value=" + values.get("hash").trim() + ">"
	                 + "      <input type=\"hidden\" name=\"txnid\" value=" + values.get("txnid").trim() + ">"
	                 + "      <table>\n"
	                 + "        <tr>\n"
	                 + "          <td><b>Mandatory Parameters</b></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "         <td>Amount: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"amount\" value=" + values.get("amount").trim() + " /></td>\n"
	                 + "          <td>First Name: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"firstname\" id=\"firstname\" value=" + values.get("firstname").trim() + " /></td>\n"
	                 + "        <tr>\n"
	                 + "          <td>Email: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"email\" id=\"email\" value=" + values.get("email").trim() + " /></td>\n"
	                 + "          <td>Phone: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"phone\" value=" + values.get("phone") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Product Info: </td>\n"
	                 + "<td><input type=\"hidden\" name=\"productinfo\" value=" + values.get("productinfo").trim() + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Success URI: </td>\n"
	                 + "          <td colspan=\"3\"><input type=\"hidden\" name=\"surl\"  size=\"64\" value=" + values.get("surl") + "></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Failure URI: </td>\n"
	                 + "          <td colspan=\"3\"><input type=\"hidden\" name=\"furl\" value=" + values.get("furl") + " size=\"64\" ></td>\n"
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
	                 + "          <td><input type=\"hidden\" name=\"lastname\" id=\"lastname\" value=" + values.get("lastname") + " ></td>\n"
	                 + "          <td>Cancel URI: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"curl\" value=" + values.get("curl") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Address1: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"address1\" value=" + values.get("address1") + " ></td>\n"
	                 + "          <td>Address2: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"address2\" value=" + values.get("address2") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>City: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"city\" value=" + values.get("city") + "></td>\n"
	                 + "          <td>State: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"state\" value=" + values.get("state") + "></td>\n"
	                 + "        </tr>\n"
	                 + "        <tr>\n"
	                 + "          <td>Country: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"country\" value=" + values.get("country") + " ></td>\n"
	                 + "          <td>Zipcode: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"zipcode\" value=" + values.get("zipcode") + " ></td>\n"
	                 + "        </tr>\n"
	                 + "          <td>UDF1: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"udf1\" value=" + values.get("udf1") + "></td>\n"
	                 + "          <td>UDF2: </td>\n"
	                 + "          <td><input  type=\"hidden\" name=\"udf2\" value=" + values.get("udf2") + "></td>\n"
	                 + " <td><input type=\"hidden\" name=\"hashString\" value=" + values.get("hashString") + "></td>\n"
	                 + "          <td>UDF3: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"udf3\" value=" + values.get("udf3") + " ></td>\n"
	                 + "          <td>UDF4: </td>\n"
	                 + "          <td><input type=\"hidden\" name=\"udf4\" value=" + values.get("udf4") + " ></td>\n"
	                 + "          <td>UDF5: </td>\n"
	                + "          <td><input type=\"hidden\" name=\"udf5\" value=" + values.get("udf5") + " ></td>\n"
	                  + "          <td>PG: </td>\n"
	                + "          <td><input type=\"hidden\" name=\"pg\" value=" + values.get("pg") + " ></td>\n"
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
	                 + "  </body>\n"
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
				}
					
				if(roleId!=0){
					boolean success = objUsersDao.upgradeUser(userId, roleId,packageId);
					if(success)
						;
				}
					
		}
				
			
	       
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in MembersController class AddMembers method  ");
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
   @RequestMapping(value="/emailProfilesList")
   public String sendProfilesListEmail(HttpSession session){
	   /*UsersBean userSessionBean = (UsersBean) session.getAttribute("cacheGuest");
	   if(userSessionBean==null)
		   return "redirect:HomePage";*/
	   List<Map<String,Object>> activeProfilesList = objUsersDao.getAllActiveUsers();
	   for(Map<String,Object> profile:activeProfilesList){
		   List<Map<String,String>> preferredProfiles = objUsersDao.getProfilesFilteredByPreferences(profile);
		   try{
			   EmailUtil.sendProfilesListEmail((String)profile.get("email"),preferredProfiles, objContext, "profiles_list_email");
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   
	   }
	   
	   return "";
   }
   
   @RequestMapping(value = "/displayPage")
	public @ResponseBody String displayPage(@ModelAttribute("createProfile") UsersBean searchCriteriaBean,ModelMap model, HttpServletRequest request, HttpSession session)
														throws JsonGenerationException, JsonMappingException, IOException {
		JSONObject jsonObj = new JSONObject();
		List<Map<String, String>> results = null;
		try{
			int page_no = searchCriteriaBean.getPage_no();
			String request_coming_from = request.getParameter("request_from");
			String ageFrom = request.getParameter("rAgeFrom");
			String page_num = request.getParameter("page_no");
			
			UsersBean userSessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(userSessionBean == null){
				return "redirect:HomePage";
			}
			if(page_no != 0)
				page_no = page_no-1;
			if(StringUtils.isNotBlank(request_coming_from) && "dashboard".equalsIgnoreCase(request_coming_from)){
				results = objUsersDao.getProfilesFilteredByPreferences(page_no);
			}else{
				String selectedCasts = request.getParameter("selected_casts");
				String selectedReligions = request.getParameter("selected_religions");
				String selectedEducations = request.getParameter("selected_educations");
				if(StringUtils.isNotBlank(selectedCasts) || StringUtils.isNotBlank(selectedReligions) || StringUtils.isNotBlank(selectedEducations)){
					results = objUsersDao.getProfilesFilteredByCast(selectedCasts,selectedReligions,selectedEducations,page_no);
				}else{
					results = objUsersDao.getSearchResults(searchCriteriaBean,page_no);
				}
			}
			int role_id = userSessionBean.getRoleId();
			int limit = 0;
			limit = getLimitFor(role_id);
			int viewed_count = objUsersDao.getMobileNumViewedCount(userSessionBean.getId()+"");
			int total_records = limit - viewed_count;
			request.setAttribute("total_records", total_records);
			request.setAttribute("page_size", MatrimonyConstants.PAGINATION_SIZE);
			if (results != null && results.size() > 0) {
				jsonObj.put("results", results);
				
			} else {
				jsonObj.put("results", "");
			}
			
		}catch(Exception e){
			logger.fatal("error in displayPage method in EmployController class");
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
   
   @RequestMapping(value = "/receivedRequests")
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
			} else {
				objJson.put("message", "failed");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error forwardInterestRequests method  ");
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
			List<Map<String,Object>> acceptedRequests = objUsersDao.getacceptedRequests(sessionBean.getId()+"",0);
			if(acceptedRequests!=null && acceptedRequests.size()>0){
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(acceptedRequests);
				request.setAttribute("acceptedRequests", sJson);
				total_records = (Long)acceptedRequests.get(0).get("total_records");
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
			List<Map<String,Object>> sentRequests = objUsersDao.getsentRequests(sessionBean.getId()+"",0);
			if(sentRequests!=null && sentRequests.size()>0){
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(sentRequests);
				request.setAttribute("sentRequests", sJson);
				total_records = (Long)sentRequests.get(0).get("total_records");
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
   
   @RequestMapping(value = "/interestRequestsPagination")
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
	}
   private int getLimitFor(int role_id){
	   int limit = 0;
	    if((role_id == MatrimonyConstants.FREE_USER_ROLE_ID) || (role_id==MatrimonyConstants.CLASSIC_USER_ROLE_ID))
			limit = MatrimonyConstants.FREE_USER_PROFILES_LIMIT;
		else if(role_id == MatrimonyConstants.CLASSIC_PLUS_USER_ROLE_ID)
			limit = MatrimonyConstants.CLASSIC_PLUS_USER_PROFILES_LIMIT;
		else if(role_id == MatrimonyConstants.PREMIUM_USER_ROLE_ID)
			limit = MatrimonyConstants.PREMIUM_USER_PROFILES_LIMIT;
		else if(role_id == MatrimonyConstants.PREMIUM_PLUS_USER_ROLE_ID)
			limit = MatrimonyConstants.PREMIUM_PLUS_USER_PROFILES_LIMIT;
		else if(role_id == MatrimonyConstants.AARNA_PREMIUM_USER_ROLE_ID)
			limit = MatrimonyConstants.AARNA_PREMIUM_USER_PROFILES_LIMIT;
	    return limit;
   }
}
