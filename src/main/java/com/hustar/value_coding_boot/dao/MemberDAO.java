package com.hustar.value_coding_boot.dao;

import java.util.List;

import com.hustar.value_coding_boot.vo.BoardVO;
import com.hustar.value_coding_boot.vo.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void join(MemberVO vo) throws Exception;

	public int checkId(MemberVO membervo) throws Exception;

	public MemberVO selectMemberView(MemberVO memberVO, String sql_id) throws Exception;
	
	// 회원정보 수정
	public void ModifyMypage(MemberVO memberVO)throws Exception;
	
	// 회원 탈퇴
	public void deleteMember(MemberVO memberVO)throws Exception;
	
	public List<BoardVO> ViewMyPostMember(MemberVO memberVO)throws Exception;
}
