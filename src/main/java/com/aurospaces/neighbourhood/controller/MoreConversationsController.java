package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoreConversationsController {
	
	
	
	@RequestMapping("/moreConversations")
	public String MoreConversationsShow(){
		
		return "moreConversation";
	}

}
