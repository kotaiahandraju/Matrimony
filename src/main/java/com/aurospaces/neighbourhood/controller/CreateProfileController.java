package com.aurospaces.neighbourhood.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.BranchBean;
import com.aurospaces.neighbourhood.bean.ContriesBean;
import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.BranchDao;
import com.aurospaces.neighbourhood.db.dao.CountriesDao;
import com.aurospaces.neighbourhood.db.dao.UserDetailsDao;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.EmailUtil;
import com.aurospaces.neighbourhood.util.MiscUtils;

@Controller
@RequestMapping(value="/admin")
public class CreateProfileController {
	private Logger logger = Logger.getLogger(CreateProfileController.class);
	@Autowired
	CountriesDao objCountriesDao;
	 @Autowired BranchDao objBranchDao;
   @Autowired UsersDao objUsersDao;
   @Autowired UserDetailsDao objUserDetailsDao;
   @Autowired
	ServletContext objContext;
	@RequestMapping(value = "/CreateProfile")
	public String CreateProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session) {
		System.out.println("CreateProfile Page");
		List<ContriesBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		String ipAddress = null;
		
		try {
//			objUsersBean =objUsersDao.getById(2756);
			objeModel.addAttribute("createProfile", objUsersBean);
			 ipAddress =MiscUtils.getClientIpAddress(request);
		
			/*listOrderBeans = objCountriesDao.getAllCountries();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}*/
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
			return "countriesHome";
		}
		return "createProfile";
	}
	@RequestMapping(value = "/CreateProfile/{id}/{page}")
	public String CreateProfile1(@ModelAttribute("createProfile") UsersBean objUsersBean, Model objeModel ,
			HttpServletRequest request, HttpSession session, @PathVariable("id") int id,@PathVariable("page") String pageName) {
		System.out.println("CreateProfile Page");
		List<ContriesBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		String ipAddress = null;
		
		try {
			objUsersBean =objUsersDao.getById(id);
			objUsersBean.setPageName(pageName);
//			objUsersBean = objUserDetailsDao.getById(id);
			objeModel.addAttribute("createProfile", objUsersBean);
			 ipAddress =MiscUtils.getClientIpAddress(request);
		
			/*listOrderBeans = objCountriesDao.getAllCountries();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}*/
			 request.setAttribute("pageName", pageName);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class createProfile method  ");
			return "countriesHome";
		}
		return "createProfile";
	}
	@RequestMapping(value = "/addProfile")
	public String addProfile(@ModelAttribute("createProfile") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		System.out.println("addProfile Page");
		List<ContriesBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		BranchBean objBranch = null;
		String ipAddress = null;
		String msg= null;
		
		try {
			ipAddress =MiscUtils.getClientIpAddress(request);
			
			
			
			if(StringUtils.isNotBlank(ipAddress)){
			objUsersBean.setLast_ip(ipAddress);
			}
			objUsersBean.setPassword(MiscUtils.generateRandomString(6));
			
			objUsersBean.setRole_id(4);
			if(objUsersBean.getId() ==0){
				int userId = objUsersDao.getNewUserId();
				if(StringUtils.isNotBlank(objUsersBean.getBranch())){
				int branchid = Integer.parseInt(objUsersBean.getBranch());
				objBranch = objBranchDao.getById(branchid);
				String prefix = objBranch.getPrefix();
				prefix = prefix.concat(objBranch.getFree());
				String ss=	StringUtils.leftPad(String.valueOf(userId), 6, "0");
				prefix = prefix.concat(ss);
				objUsersBean.setUsername(prefix);
				}
				objUsersBean.setStatus("0");
				EmailUtil emailUtil = new EmailUtil();
				if(StringUtils.isNotBlank(objUsersBean.getEmail())){
					emailUtil.sendEmail(objUsersBean, objContext, "admin_send_password");
				}
				msg = "inserted";
			}else{
				msg = "updated";
			}
			objUsersDao.save(objUsersBean);
			objUserDetailsDao.save(objUsersBean);
			
			/*listOrderBeans = objCountriesDao.getAllCountries();
			if (listOrderBeans != null && listOrderBeans.size() > 0) {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", sJson);
				// System.out.println(sJson);
			} else {
				objectMapper = new ObjectMapper();
				sJson = objectMapper.writeValueAsString(listOrderBeans);
				request.setAttribute("allOrders1", "''");
			}*/
			redir.addFlashAttribute("msg", msg);
			if(StringUtils.isNotBlank(objUsersBean.getPageName())){
				return "redirect:"+objUsersBean.getPageName();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CreateProfile class addProfile method  ");
			return "CreateProfile";
		}
		return "redirect:CreateProfile";
	}
	
	
	@RequestMapping(value = "/updateStatus")
	public @ResponseBody String updateStatus( UsersBean objUsersBean,ModelMap model,HttpServletRequest request,HttpSession session,BindingResult objBindingResult) {
		System.out.println(" create Profile updateStatus page...");
		List<Map<String, String>> listOrderBeans = null;
		JSONObject jsonObj = new JSONObject();
		ObjectMapper objectMapper = null;
		String sJson=null;
		boolean delete = false;
		try{
			if(objUsersBean.getStatus() != "0"){
				delete=	objUsersDao.updateStatus(objUsersBean);
 				if(delete){
 					jsonObj.put("message", "Delete Profile");
 				}else{
 					jsonObj.put("message", "Delete Profile Faile");
 				}
 			}
 				
			listOrderBeans = objUsersDao.getAllProfiles1(objUsersBean,"all");
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
}
