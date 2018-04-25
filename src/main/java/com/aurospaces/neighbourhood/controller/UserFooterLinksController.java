package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserFooterLinksController {
	
	
	@RequestMapping(value="/privacyAndPolicy")
	public String privacyAndPolicyData() {
		
		return "privacyAndPolicy";
	}

	@RequestMapping(value="/termsConditions")
	public String termsConditionsData() {
		
		return "termsConditions";
	}
	
	@RequestMapping(value="/aboutUs")
	public String aboutUsData() {
		
		return "aboutUs";
	}
	
	
	
	
}
