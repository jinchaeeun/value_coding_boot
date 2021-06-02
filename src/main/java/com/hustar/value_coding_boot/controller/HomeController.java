package com.hustar.value_coding_boot.controller;

import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 

@Controller 
public class HomeController { 
	
	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public String home() throws Exception  { 
		System.out.println("home controller start"); 
		return "index"; 
	} 
	
	@RequestMapping(value = "/about", method = RequestMethod.GET) 
	public String about() throws Exception { 
		System.out.println("home controller start"); 
		return "about/about"; 
	}
}
