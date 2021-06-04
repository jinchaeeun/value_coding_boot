package com.hustar.value_coding_boot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hustar.value_coding_boot.service.MemberServiceImpl;

@Controller
public class MemberController  {
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	@RequestMapping("member/join")
	String showjoin() throws Exception {
		return "member/join";
	}
	
	@RequestMapping("member/doJoin")
	@ResponseBody
	String dojoin(@RequestParam Map<String, Object> param) throws Exception {
		
		memberServiceImpl.join(param);
		
		return String.format("<script> alert('환영!'); location.replace('/') </script>");
		
		
		//return param.toString();
	}
	
	// 아이디 중복 검사
	@RequestMapping("/member/memberIdChk")
	public String memberIdChkPOST(String me_id) throws Exception{
		
		//System.out.println("memberIdChk() 진입"); 
		int result = memberServiceImpl.idCheck(me_id);
		
		System.out.println("결과값 = " + result);
		
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재	
		} else {
			return "success";	// 중복 아이디 x
			
		} 
	} // memberIdChkPOST() 종료	
	
}
