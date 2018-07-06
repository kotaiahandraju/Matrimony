package com.aurospaces.neighbourhood.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aurospaces.neighbourhood.bean.UsersBean;

@Controller
@RequestMapping(value="/admin")
public class AllNotificationsInAdminController {
	 @RequestMapping(value = "/allNotificationsInAdmin", method = RequestMethod.POST)
	 public String allNotifications(@ModelAttribute("allNotificationsInAdmin") UsersBean objUserssBean, Model objeModel, HttpServletRequest request, HttpSession session) {
		return "allNotificationsInAdmin";
	 }
}
