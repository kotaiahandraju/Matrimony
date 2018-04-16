package com.aurospaces.neighbourhood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PrivacyAndPolicyController {
	
	
	@RequestMapping(value="/privacyAndPolicy")
	public String privacyAndPolicyShow() {
		
		return "privacyAndPolicy";
	}

}
