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
public class AdminController {
	private Logger logger = Logger.getLogger(FilterController.class);
	
   @Autowired UsersDao objUsersDao;
//   @Autowired UserDetailsDao objUserDetailsDao;
   @Autowired
	ServletContext objContext;
   @RequestMapping(value = "/changePassword")
	public String changePassword(@ModelAttribute("changePaddword") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		System.out.println("changePassword Page");
		List<Map<String, String>> listOrderBeans = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		UsersBean objUserBean = null;
		try {
			UsersBean sessionBean = (UsersBean) session.getAttribute("cacheUserBean");
			if(sessionBean == null){
				return "redirect:LoginHome";
			}
			request.setAttribute("first_name", sessionBean.getFirstName());
			request.setAttribute("last_name", sessionBean.getLastName());
			//objUsersBean.setFirstName(sessionBean.getFirstName());
			//objUsersBean.setLastName(sessionBean.getLastName());
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			//logger.fatal("error in CountriesController class CountriesHome method  ");
			return "redirect:LoginHome";
		}
		return "changePasswordPage";
	}
   
   @RequestMapping(value = "/changePasswordAction")
	public String changePasswordAction(@ModelAttribute("changePaddword") UsersBean objUsersBean, ModelMap model,
			HttpServletRequest request, HttpSession session,RedirectAttributes redir) {
		System.out.println("changePasswordAction Page");
		JSONObject jsonObj = new JSONObject();
		boolean updated = false;
		try {
			//objUsersBean.setPassword(MiscUtils.generateRandomString(6));
			UsersBean userSessionBean = (UsersBean) session.getAttribute("cacheUserBean");
			
			if(userSessionBean != null){
				userSessionBean.setPassword(objUsersBean.getPassword());
				updated=	objUsersDao.updatePassword(userSessionBean);
				try{
					EmailUtil emailUtil = new EmailUtil();
					emailUtil.sendResetPasswordEmail(userSessionBean, objContext, "change_password");
				}catch(Exception e) {
					e.printStackTrace();
				}
				if(updated){
					jsonObj.put("message", "success");
				}else{
					jsonObj.put("message", "failed");
				}
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
			logger.error(e);
			logger.fatal("error in CountriesController class CountriesHome method  ");
			return "CreateProfile";
		}
		return "redirect:LoginHome";
	}

   
}
