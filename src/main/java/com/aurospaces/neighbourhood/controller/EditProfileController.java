package com.aurospaces.neighbourhood.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.HeightBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.UsersDao;

@Controller
public class EditProfileController {
	private Logger logger = Logger.getLogger(EditProfileController.class);
	@Autowired
	UsersDao objUsersDao;

	@RequestMapping(value = "/EditUserProfile")
	public String editUserProfile(UsersBean objUsersBean, ModelMap model, Model objeModel, HttpServletRequest request, HttpSession session) 
	{
		System.out.println("EditUserProfile Page");
		List<UsersBean> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		UsersBean userBean = null;
		try
		{
			userBean= (UsersBean)session.getAttribute("cacheGuest");
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			else
			{
				objUsersBean =objUsersDao.getById(sessionBean.getId());
				objeModel.addAttribute("createProfile", objUsersBean);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in EditUserProfileController class EditUserProfile method  ");
		}
		return "editProfile";
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
	@ModelAttribute("states")
	public Map<Integer, String> populateState(HttpSession session) {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			UsersBean userSessionBean = (UsersBean) session.getAttribute("cacheGuest");
			if(userSessionBean!=null)
			{
				String countryId = userSessionBean.getCurrentCountry();
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
}

