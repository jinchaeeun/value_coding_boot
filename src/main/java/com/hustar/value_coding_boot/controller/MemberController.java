package com.hustar.value_coding_boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 

@Controller 
@RequestMapping("/member/**")
public class MemberController { 

	@GetMapping("login") 
	public String member_login() { 
		
		return "member/login"; 
		} 
	
	@GetMapping("join") 
	public String member_join() { 
		
		return "member/join"; 
		} 
	
	@GetMapping("mypage") 
	public String member_mypage() { 
		
		return "member/mypage"; 
		} 
	
	
	
}
