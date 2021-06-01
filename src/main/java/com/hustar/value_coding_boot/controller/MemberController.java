package com.hustar.value_coding_boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod;

import com.hustar.value_coding_boot.service.MemberService;
import com.hustar.value_coding_boot.vo.MemberVO;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller 
@RequestMapping("/member/**")
public class MemberController { 
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	MemberService service;
	
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
		logger.info("post register");
		
		service.register(vo);
		
		return null;
	}
	
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
	
	@GetMapping("mypage01") 
	public String member_mypage01() { 
		
		return "member/mypage01"; 
	}
	
	@GetMapping("mypage02") 
	public String member_mypage02() { 
		
		return "member/mypage02"; 
	}
	
	
	
}
