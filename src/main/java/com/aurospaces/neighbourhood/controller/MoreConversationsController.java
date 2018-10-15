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
			String tab_type =request.getParameter("tab_type");
			String list_type =request.getParameter("list_type");
			conversations = objUsersDao.getConversationsList(sessionBean, profile_id);
			if(conversations!=null && conversations.size()>0){
				for(Map<String,Object> conv:conversations){
					if(((String)conv.get("activity_type")).equalsIgnoreCase("message")){
						String temp = ((String)conv.get("activity_content")).replaceAll("##newline##", "\r\n");
						temp = temp.replaceAll("##tabspace##", "\t");
						conv.remove("activity_content");
						conv.put("activity_content", temp);
					}
				}
				request.setAttribute("conversationsList", conversations);
				request.setAttribute("back_link_val", "inboxAction?tab_type="+tab_type+"&list_type="+list_type+"");
			}else{
				request.setAttribute("conversationsList", "''");
			}
			UsersBean profileBean = objUsersDao.loginChecking(Integer.parseInt(profile_id));
			request.setAttribute("profileBean", profileBean);
			List<Map<String,Object>> photosList = objUsersDao.getApprovedUserPhotos(Integer.parseInt(profile_id));
			request.setAttribute("fullProfilePhotosList", photosList);
		} catch (Exception e) {
	   e.printStackTrace();
	   System.out.println(e);
	   logger.error(e);
	   logger.fatal("error in getConversations method");
	  }
		return "moreConversation";
	}
	
	@RequestMapping("/deleteConversation")
	public  @ResponseBody String deleteConversation(@ModelAttribute("notificationsForm") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session){
		List<Map<String, Object>> conversations = null;
		JSONObject jsonObj = new JSONObject();
		try {
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			if(sessionBean == null){
				return "redirect:HomePage";
			}
			String conversation_id =request.getParameter("cid");
			boolean success = objUsersDao.deleteConversation(conversation_id);
			if(success){
				jsonObj.put("message", "success");
			}else{
				jsonObj.put("message", "failed");
			}
		} catch (Exception e) {
			   e.printStackTrace();
			   System.out.println(e);
			   logger.error(e);
			   logger.fatal("error in deleteConversation method");
			   jsonObj.put("msg", "failed");
	   }
		return jsonObj.toString();
	}

}
