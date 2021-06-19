package com.hustar.value_coding_boot.dao;

import java.util.List;

import com.hustar.value_coding_boot.vo.BoardVO;
import com.hustar.value_coding_boot.vo.CommentVO;
import com.hustar.value_coding_boot.vo.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void join(MemberVO vo) throws Exception;

	public int checkId(MemberVO membervo) throws Exception;

	public MemberVO selectMemberView(MemberVO memberVO, String sql_id) throws Exception;
	
	//소셜 가입코드
	public int checkCode(MemberVO vo) throws Exception;
	
	//소셜 로그인(가입)
	public void sosialJoin(MemberVO vo) throws Exception;
	
	// 회원정보 수정
	public void ModifyMypage(MemberVO memberVO)throws Exception;
	
	// 회원 탈퇴
	public void deleteMember(MemberVO memberVO)throws Exception;
	
	// 내가 쓴 글 조회
	public List<BoardVO> ViewMyPostMember(MemberVO memberVO) throws Exception;

	// 내가 쓴 댓글 조회
	public List<CommentVO> ViewMyCommentMember(MemberVO memberVO) throws Exception;
	
	// 내가 쓴 글 개수
	public int getMyPostCnt(MemberVO memberVO) throws Exception;
		
	// 내가 총 댓글 개수
	public int getMyCommentCnt(MemberVO memberVO)throws Exception;

	// 전체 글 삭제
	public void DeleteMyPost(MemberVO memberVO)throws Exception;
}
