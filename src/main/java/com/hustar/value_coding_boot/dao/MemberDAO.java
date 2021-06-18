package com.hustar.value_coding_boot.dao;

import java.util.List;

import com.hustar.value_coding_boot.vo.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void join(MemberVO vo) throws Exception;

	public int checkId(MemberVO membervo) throws Exception;

	public MemberVO selectMemberView(MemberVO memberVO, String sql_id) throws Exception;

	public void sosialJoin(MemberVO vo) throws Exception;

	public int checkCode(MemberVO vo) throws Exception;
}
