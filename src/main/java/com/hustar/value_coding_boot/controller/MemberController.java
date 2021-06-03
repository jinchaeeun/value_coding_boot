package com.hustar.value_coding_boot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hustar.value_coding_boot.service.MemberServiceImpl;

import com.hustar.value_coding_boot.util.Util;

@Controller 
public class MemberController { 
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
	@RequestMapping("member/login") 
	public String member_login() { 
		
		return "member/login"; 
		} 
	
	@RequestMapping("member/join")
	String showjoin() {
		return "member/join";
	}
	
	@RequestMapping("member/dojoin")
	@ResponseBody
	public String dojoin(@RequestParam Map<String, Object> param) {
		String me_id = Util.getAsStr(param.get("me_id"),"");
		// js 상 써줘도 controller에 무조건 써줘야함 (파라미터, js 무력화 등 방지)
		if ( me_id.length() == 0 ) {
			return String.format("<script> alert('로그인 아이디를 입력해주세요.'); histroy.back(); </script>");
		}
		
		// id 중복체크 
		boolean isJoinAvailableId = memberServiceImpl.isJoinAvailableId(me_id);
		
		if (isJoinAvailableId == false ) {
			return String.format("<script> alert('%s(은)는 이미 사용 중인 아이디입니다.'); location.replace('/member/join') </script>", me_id);
		}
		

		//회원 생성될 때 회원번호 생성
		memberServiceImpl.join(param);
		
		return String.format("<script> alert('회원 환영!'); location.replace('/') </script>");
		//{me_nickname=닉네임 적은거, me_id=, me_password=, userPass2=} 이런 식으로 확인 가능
		//return Param.toString();
	}
	
	@GetMapping("member/mypage") 
	public String member_mypage(Model model, String me_id) throws Exception { 
	
		return "member/mypage"; 
		} 
}
