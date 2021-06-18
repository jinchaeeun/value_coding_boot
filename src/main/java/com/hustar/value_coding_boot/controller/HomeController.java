package com.hustar.value_coding_boot.controller;

import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.hustar.value_coding_boot.vo.MemberVO; 

@Controller 
public class HomeController { 
	
	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public String home() throws Exception  { 
		System.out.println("home controller start"); 
		RequestAttributes requestAttribute = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        
        MemberVO vo = (MemberVO) requestAttribute.getAttribute("login", RequestAttributes.SCOPE_SESSION);
		System.out.println(vo);
		
		return "index"; 
	} 
	
	@RequestMapping(value = "/about", method = RequestMethod.GET) 
	public String about() throws Exception { 
		System.out.println("home controller start"); 
		return "about/about"; 
	}
}
