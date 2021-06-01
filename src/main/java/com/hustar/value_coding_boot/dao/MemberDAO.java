package com.hustar.value_coding_boot.dao;

import com.hustar.value_coding_boot.vo.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;
}