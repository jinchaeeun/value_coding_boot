package com.hustar.value_coding_boot.dao;

import com.hustar.value_coding_boot.vo.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void join(MemberVO vo) throws Exception;

	public int checkId(MemberVO membervo) throws Exception;

	public MemberVO selectMemberView(MemberVO memberVO, String sql_id) throws Exception;
	
	// 회원정보 수정
	public void ModifyMypage(MemberVO memberVO)throws Exception;
}
