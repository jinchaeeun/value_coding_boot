package com.hustar.value_coding_boot.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hustar.value_coding_boot.vo.MemberVO;

public interface MemberService {

	public void join(MemberVO vo) throws Exception;

	public int checkId(MemberVO membervo) throws Exception;

	public MemberVO selectMemberView(MemberVO memberVO, HttpServletRequest req, HttpServletResponse res, String sql_id) throws Exception;
	
	// 회원정보 수정
	public void ModifyMypage(MemberVO memberVO) throws Exception;

}