package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.UsersDao;

@Controller
@RequestMapping(value="/users")
public class ReferralController {
	private Logger logger = Logger.getLogger(ReferralController.class);
	
	@Autowired UsersDao objUsersDao;
	
	@RequestMapping("/referFriend")
	public @ResponseBody String referFriend(@ModelAttribute("userForm") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session){
		JSONObject josOnObj = new JSONObject(); 
		try{
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			String email_id =request.getParameter("receivers_email_id");
			UsersBean receiverBean = objUsersDao.getUserByEmailId(email_id);
			boolean success = objUsersDao.saveEmailData(sessionBean, receiverBean, "", "refer_friend");
			if(success){
				josOnObj.put("message", "success");
			}else{
				josOnObj.put("message", "failed");
			}
			
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in getConversations method");
	  }
		return josOnObj.toString();
	}
	
	

}
