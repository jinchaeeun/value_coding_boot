package com.hustar.value_coding_boot.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hustar.value_coding_boot.vo.AnswerVO;
import com.hustar.value_coding_boot.vo.BoardVO;
import com.hustar.value_coding_boot.vo.MemberVO;

public interface MemberService {

	public void join(MemberVO vo) throws Exception;

	public int checkId(MemberVO membervo) throws Exception;

	public MemberVO selectMemberView(MemberVO memberVO, HttpServletRequest req, HttpServletResponse res, String sql_id) throws Exception;

	public void sosialJoin(MemberVO vo) throws Exception;

	public int checkCode(MemberVO vo) throws Exception;
	
	// 회원정보 수정
	public void ModifyMypage(MemberVO memberVO) throws Exception;

	// 회원 탈퇴
	public void deleteMember(MemberVO memberVO)throws Exception;
	
	// 내 작성글 조회 
	public List<BoardVO> ViewMyPostMember(MemberVO memberVO, int displayPost, int postNum) throws Exception;

	// 내 댓글 조회
	public List<AnswerVO> ViewMyCommentMember(MemberVO memberVO, int displayPost, int postNum) throws Exception;

	// 내 총 작성글 개수
	public int getMyPostCnt(MemberVO memberVO)throws Exception;
	
	// 내가 총 댓글 개수
	public int getMyCommentCnt(MemberVO memberVO)throws Exception;

	// 전체 글 삭제
	public void DeleteMyPost(MemberVO memberVO) throws Exception;

	// 전체 댓글 삭제
	public void DeleteMyComment(MemberVO memberVO) throws Exception;

}