package com.hustar.value_coding_boot.controller;

import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 

@Controller 
public class HomeController { 
	
	@RequestMapping(value = "/index", method = RequestMethod.GET) 
	public String home() { 
		System.out.println("home controller start"); 
		return "index"; 
		} 
	
	@RequestMapping("member/login") 
	public String member_login() { 
		
		return "member/login"; 
		} 
	
	@RequestMapping("member/join") 
	public String member_join() { 
		
		return "member/join"; 
		} 
	
	@RequestMapping("member/mypage") 
	public String member_mypage() { 
		
		return "member/mypage"; 
		} 
	
	
	
}
