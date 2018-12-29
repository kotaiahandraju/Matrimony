package com.aurospaces.neighbourhood.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.EducationBean;
import com.aurospaces.neighbourhood.bean.ReportsBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.EmailUtil;
import com.aurospaces.neighbourhood.util.HRMSUtil;
import com.aurospaces.neighbourhood.util.SendSMS;

@Controller
@RequestMapping(value="/admin")
public class BulkSmsMailController {
	@Autowired UsersDao objUsersDao;
	@Autowired ServletContext objContext;
	@RequestMapping(value = "/bulksmsmail")
	public String bulksmsmail(@ModelAttribute("usersForm") ReportsBean objReportsBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		// System.out.println("updatedProfiles Page");
		List<Map<String, Object>> profilesList = null;
		ObjectMapper objectMapper = null;
		String sJson = null;
		try {

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "bulksmsmail";
	}
	@RequestMapping(value = "/submitbulkmessage")
	public String submitbulkmessage(@ModelAttribute("usersForm") ReportsBean objReportsBean, ModelMap model,
			HttpServletRequest request, HttpSession session, RedirectAttributes redir) {
		String messageType  =null;
		String message  =null;
		EmailUtil emailutill =new EmailUtil();
		try {
			 messageType = objReportsBean.getMessageType();
			 message = objReportsBean.getMessage();
			 if(StringUtils.isNotBlank(objReportsBean.getFromdate())){
				 objReportsBean.setFromdate1( HRMSUtil.dateFormate(objReportsBean.getFromdate()));
			 }
			 if(StringUtils.isNotBlank(objReportsBean.getTodate())){
				 objReportsBean.setTodate1( HRMSUtil.dateFormate(objReportsBean.getTodate()));
			 }
			List<UsersBean> objUserBean = objUsersDao.bulksmsmail(objReportsBean);
			if(objUserBean != null){
				for(UsersBean userbean : objUserBean ){
					if(messageType.equals("1")){
						if(StringUtils.isNotBlank(userbean.getMobile())){
							SendSMS.sendSMS(message, userbean.getMobile());
							redir.addFlashAttribute("msg", "Message Sent Successfully");
							redir.addFlashAttribute("cssMsg", "success");
						}
					}
					if(messageType.equals("2")){
						if(StringUtils.isNotBlank(userbean.getEmail())){
							emailutill.bulkmail(userbean, objContext, request, objReportsBean);
							redir.addFlashAttribute("msg", "Message Sent Successfully");
							redir.addFlashAttribute("cssMsg", "success");
						}
					}
					if(messageType.equals("3")){
						if(StringUtils.isNotBlank(userbean.getMobile())){
							SendSMS.sendSMS(message, userbean.getMobile());
							
						}
						if(StringUtils.isNotBlank(userbean.getEmail())){
						emailutill.bulkmail(userbean, objContext, request, objReportsBean);
						}
						redir.addFlashAttribute("msg", "Message Sent Successfully");
						redir.addFlashAttribute("cssMsg", "success");
					}
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);

		}
		return "redirect:bulksmsmail";
	}
	
	@ModelAttribute("packages")
	public Map<Integer, String> populatePackages() {
		Map<Integer, String> statesMap = new LinkedHashMap<Integer, String>();
		try {
			String sSql = "SELECT id,`name` FROM  `package`  where status='1' order by name asc";
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
