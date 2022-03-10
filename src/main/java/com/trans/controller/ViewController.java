package com.trans.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

	@GetMapping("/view/**")
	public String goPage(HttpServletRequest reqest) {
		
		//model.addAttribute("viewName","member/member_join");
		//return reqest.getRequestURI();
		
		String url = reqest.getRequestURI();
		return url.substring(5);
		
	}
}
