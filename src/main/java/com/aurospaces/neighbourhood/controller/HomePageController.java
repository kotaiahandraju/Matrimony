package com.aurospaces.neighbourhood.controller;

import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashMap;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.AutoCompleteBean;
import com.aurospaces.neighbourhood.bean.CityBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.CityDao;
import com.aurospaces.neighbourhood.db.dao.CountriesDao;
import com.aurospaces.neighbourhood.db.dao.UserrequirementDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.HRMSUtil;
import com.aurospaces.neighbourhood.util.MiscUtils;

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
	@RequestMapping(value = "/HomePage")
	public String CreateProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
		System.out.println("Home Page");
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
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
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
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		System.out.println("userRegistration Page");
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
			UsersBean userbean = objUsersDao.emailExistOrNot(objUsersBean);
			if(userbean != null){	
				request.setAttribute("msg", "Email Already Exist ");
				return "homepage";
			}
			if(StringUtils.isNotBlank(objUsersBean.getEmail())){
			objUsersDao.save(objUsersBean);
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
		System.out.println("userRegistration Page");
		String pageName =  null;
		
		try {
			 //session checking
			if(session.getAttribute("cacheGuest") != null){
				UsersBean sessionBean =(UsersBean)session.getAttribute("cacheGuest");
			//get session bean values 
			 objUsersBean = objUsersDao.getById1(sessionBean.getId());
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
		System.out.println("saveUserProfile Page");
		
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
				UsersBean sessionBean =(UsersBean)session.getAttribute("cacheGuest");
			//get session bean values 
			UsersBean  objUsersBean1 = objUsersDao.getById1(sessionBean.getId());
			 if(objUsersBean != null){
			 objeModel.addAttribute("createProfile", objUsersBean);
			 }
			 BeanUtils.copyProperties(objUsersBean1,objUsersBean,getNullPropertyNames(objUsersBean1));
			 objUsersDao.save(objUsersBean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
		}
		return "redirect:family-details";
	}
	
	 @RequestMapping(value = "/family-details")
	 public String familyDetails(@ModelAttribute("familyDetails") UsersBean objUsersBean, Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
	  System.out.println("familyDetails Page");
	  try {
		  if(session.getAttribute("cacheGuest") != null){
			  UsersBean sessionBean =(UsersBean)session.getAttribute("cacheGuest");
			  UsersBean UserrequirementBean=  objUsersDao.getById1(sessionBean.getId());
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
	  System.out.println("saveImproveFamilyDetails..... Page");
	  try {
		  UsersBean sessionBean =  null;
		  UsersBean objUsersBean1 =new UsersBean();
		  if(session.getAttribute("cacheGuest") != null){
				 sessionBean =(UsersBean)session.getAttribute("cacheGuest");
			//get session bean values 
			 objUsersBean1 = objUsersDao.getById1(sessionBean.getId());
			 objUsersBean1.setFatherName(objUsersBean.getFatherName());
			 objUsersBean1.setMotherName(objUsersBean.getMotherName());
			 objUsersBean1.setfOccupation(objUsersBean.getfOccupation());
			 objUsersBean1.setmOccupation(objUsersBean.getmOccupation());
			 objUsersBean1.setNoOfBrothers(objUsersBean.getNoOfBrothers());
			 objUsersBean1.setNoOfSisters(objUsersBean.getNoOfSisters());
			 objUsersBean1.setNoOfBrothersMarried(objUsersBean.getNoOfBrothersMarried());
			 objUsersBean1.setNoOfSisters(objUsersBean.getNoOfSistersMarried());
			 objUsersDao.save(objUsersBean1);
			}else{
				return "redirect:HomePage";
			}	   
	  } catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class familyDetails method");
	  }
	  return "redirect:partner-profile";
	 }
	 @RequestMapping(value = "/partner-profile")
	 public String partnerProfile(@ModelAttribute("partnerProfile") UsersBean objUsersBean, Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
	  System.out.println("Partner Profile Page");
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
	 
	 @RequestMapping(value = "/savePartnerProfile")
	 public String savePartnerProfile(@ModelAttribute("partnerProfile") UsersBean objUserrequirementBean, @RequestParam String[] rCountry, Model objeModel ,
	   HttpServletRequest request, HttpSession session) {
	  System.out.println("Partner Profile save Page");
	  try {
		  UsersBean sessionBean =  null;
		  UsersBean objUsersBean1 =new UsersBean();
		  if(session.getAttribute("cacheGuest") != null){
				 sessionBean =(UsersBean)session.getAttribute("cacheGuest");
			//get session bean values 
			 objUsersBean1 = objUsersDao.getById1(sessionBean.getId());
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
//			 BeanUtils.copyProperties(objUsersBean1,objUsersBean,getNullPropertyNames(objUsersBean1));
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
	  System.out.println("thankYou Page");
	  try {
	//   
	   
	  } catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in HomePageController class thankYou method");
	   return "thankYou";
	  }
	  return "thankYou";
	 }
	 @RequestMapping(value = "/membershipPlans")
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
	 }
	 @RequestMapping(value = "/profileView")
	 public String profileView( Model objeModel, HttpServletRequest request, HttpSession session) {
	  System.out.println("profileView Page");
	  List<Map<String, String>> listOrderBeans = null;
	  UsersBean objUsersBean = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		
		try {
			UsersBean sessionBean =  null;
			  UsersBean objUsersBean1 =new UsersBean();
			  if(session.getAttribute("cacheGuest") != null){
					 sessionBean =(UsersBean)session.getAttribute("cacheGuest");
//				 objUsersBean1 = objUsersDao.getById1(sessionBean.getId());
				}else{
					return "redirect:HomePage";
				}
			
			
			
			objUsersBean = new UsersBean();
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
	   logger.fatal("error in HomePageController class familyDetails method");
	  }
	  return "profile_page";
	 }
	 @RequestMapping(value = "/searchProfile")
	 public String searchProfile( Model objeModel, HttpServletRequest request, HttpSession session) {
	  System.out.println("profileView Page");
	  List<Map<String, String>> listOrderBeans = null;
	  UsersBean objUsersBean = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {
			objUsersBean = new UsersBean();
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
	   logger.fatal("error in HomePageController class familyDetails method");
	  }
	  return "search_profile";
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
	@RequestMapping(value = "/autoCompleteSave")
	public @ResponseBody String autoCompleteSave(AutoCompleteBean objAutoCompleteBean, Model objeModel ,
			HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		System.out.println("autoCompleteSave Page");
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
}
