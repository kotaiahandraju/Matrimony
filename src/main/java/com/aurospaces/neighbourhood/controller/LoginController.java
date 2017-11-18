package com.aurospaces.neighbourhood.controller;

import java.io.IOException;
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
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;

@Controller
public class LoginController {
	@Autowired
	UsersDao objUsersDao;

	@RequestMapping(value = "/LoginHome")
	public String LoginHome(Map<String, Object> model1, ModelMap model, HttpServletRequest request,
			HttpSession session) throws JsonGenerationException, JsonMappingException, IOException {
		System.out.println("LoginHome page...");
		LoginBean loginBean = new LoginBean();
		model.put("loginForm", loginBean);
		try {
			UsersBean objuserBean = (UsersBean) session.getAttribute("cacheUserBean");
			if (objuserBean != null) {
				int rolId =objuserBean.getRoleId();
				if(rolId == 1 || rolId == 2 || rolId == 3 ){
					return "redirect:admin//BodyTypeHome";
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
		System.out.println("loginAction page...");
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
				if(objUserBean.getRoleId() ==1){
					session.setAttribute("cacheUserBean", objUserBean);
					session.setAttribute("rolId", objUserBean.getRoleId());
					session.setAttribute("userName", objUserBean.getUsername());
					return "redirect:admin//BodyTypeHome";
				}else if(objUserBean.getRoleId() == 4){
					session.setAttribute("cacheGuest", objUserBean);
					session.setAttribute("rolId", objUserBean.getRoleId());
					session.setAttribute("userName", objUserBean.getUsername());
					if(StringUtils.isBlank(objUserBean.getMaritalStatus())){
						return "redirect:profile.htm?page=1";
					}else if(StringUtils.isBlank(objUserBean.getEducation())){
						return "redirect:profile.htm?page=2";
					}else if(StringUtils.isBlank(objUserBean.getHeight())){
						return "redirect:profile.htm?page=3";
					}else if(StringUtils.isBlank(objUserBean.getAboutMyself()) && StringUtils.isBlank(objUserBean.getDisability())){
						return "redirect:profile.htm?page=4";
					}else if(StringUtils.isBlank(objUserBean.getFatherName())){
						return "redirect:family-details";
					}else{
						return "redirect:profileView";
					}
					
				}else if(objUserBean.getRoleId() == 6){
					session.setAttribute("cacheGuest", objUserBean);
					session.setAttribute("rolId", objUserBean.getRoleId());
					session.setAttribute("userName", objUserBean.getUsername());
					return "redirect:profileView";
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
		System.out.println("logout page...");
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
