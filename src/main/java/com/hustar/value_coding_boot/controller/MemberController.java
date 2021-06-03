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
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void getJoin() throws Exception {
		logger.info("get join");
	}
	
	// 회원가입 post
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postJoin(MemberVO vo) throws Exception {
		logger.info("post join");
		
		service.join(vo);
		
		return null;
	}
	
	@GetMapping("login") 
	public String member_login() { 
		
		return "member/login"; 
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
