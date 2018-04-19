package com.aurospaces.neighbourhood.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.UsersDao;

@Controller
public class MoreConversationsController {
	private Logger logger = Logger.getLogger(MoreConversationsController.class);
	
	@Autowired UsersDao objUsersDao;
	
	@RequestMapping("/moreConversations")
	public String MoreConversationsShow(@ModelAttribute("notificationsForm") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session){
		List<Map<String, Object>> conversations = null;
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			String profile_id =request.getParameter("pid");
			conversations = objUsersDao.getConversationsList(sessionBean, profile_id);
			if(conversations!=null && conversations.size()>0){
				request.setAttribute("conversationsList", conversations);
			}else{
				request.setAttribute("conversationsList", "''");
			}
			UsersBean profileBean = objUsersDao.loginChecking(Integer.parseInt(profile_id));
			request.setAttribute("profileBean", profileBean);
			List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(Integer.parseInt(profile_id));
			request.setAttribute("fullProfilePhotosList", photosList);
			request.setAttribute("photosListSize", photosList.size());
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in getConversations method");
	  }
		return "moreConversation";
	}

}
