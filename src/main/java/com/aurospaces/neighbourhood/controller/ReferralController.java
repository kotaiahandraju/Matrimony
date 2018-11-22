package com.aurospaces.neighbourhood.controller;

import java.util.HashMap;
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

import com.aurospaces.neighbourhood.bean.MemberShipBean;
import com.aurospaces.neighbourhood.bean.UsersBean;
import com.aurospaces.neighbourhood.db.dao.UsersDao;
import com.aurospaces.neighbourhood.util.MatrimonyConstants;

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
	
	@RequestMapping(value = "/refer")
	public String referPage() {
		return "refer";
	}
	
	@RequestMapping(value = "/concessionPage")
	public String concessionPage(@ModelAttribute("payment") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session){
		try{
			UsersBean sessionBean = (UsersBean)session.getAttribute("cacheGuest");
			String packId = request.getParameter("package_id"); 
			request.setAttribute("selected_package_id", packId);
			int price = objUsersDao.getPackagePriceById(Integer.parseInt(packId));
			price = objUsersDao.getPriceAfterConcession(packId,price,sessionBean.getId()+"");
			HashMap<String,String> discount_details = new HashMap<String,String>();
			List<MemberShipBean> packagesList = (List<MemberShipBean>)session.getAttribute("packagesList");
			for(MemberShipBean pack:packagesList){
				if((pack.getId()+"").equals(packId)){
					discount_details.put("package_name", pack.getName());
					request.setAttribute("package_name", pack.getName());
				}
			}
			request.setAttribute("discount", MatrimonyConstants.CONCESSION_PRECENTAGE+"");
			request.setAttribute("net_amount", price+"");
			
		} catch (Exception e) {
			   e.printStackTrace();
			   System.out.println(e);
			   logger.error(e);
			   logger.fatal("error in concessionPage method");
			  }
		return "referOffer";
	}
}
