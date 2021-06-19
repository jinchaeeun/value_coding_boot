package com.hustar.value_coding_boot.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hustar.value_coding_boot.vo.BoardVO;
import com.hustar.value_coding_boot.vo.CommentVO;
import com.hustar.value_coding_boot.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Inject SqlSession sql;
	// 회원가입

	@Override
	public void join(MemberVO vo) throws Exception {
		sql.insert("memberMapper.join", vo);
	}

	@Override
	public int checkId(MemberVO membervo) throws Exception {
		return sql.selectOne("memberMapper.checkId", membervo);
	}

	@Override
	public MemberVO selectMemberView(MemberVO memberVO, String sql_id) throws Exception {
		return (MemberVO) sql.selectOne(sql_id, memberVO);
	}
	
	//소셜 로그인(가입)
	@Override
	public void sosialJoin(MemberVO vo) throws Exception {
		sql.insert("memberMapper.sosialJoin", vo);
	}

	@Override
	public int checkCode(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.checkCode", vo);
	}
	
	// 회원정보 수정
	@Override
	public void ModifyMypage(MemberVO memberVO)throws Exception{
		sql.update("ModifyMypage", memberVO);
	}
	
	// 회원 탈퇴
	@Override
	public void deleteMember(MemberVO memberVO)throws Exception {
		sql.delete("deleteMember", memberVO);
	}
	
	// 회원 나의 게시물
	@Override
	public List<BoardVO> ViewMyPostMember(MemberVO memberVO)throws Exception{
		return sql.selectList("ViewMyPostMember", memberVO);
	}
		
	// 나의 답변
	@Override
	public List<CommentVO> ViewMyCommentMember(MemberVO memberVO) throws Exception{
		return sql.selectList("ViewMyCommentMember", memberVO);
	}

	// 내가 쓴 글 개수
	@Override
	public int getMyPostCnt(MemberVO memberVO) throws Exception{
		return sql.selectOne("memberMapper.getMyPostCnt", memberVO);
	}
	
	// 내가 총 댓글 개수
	@Override
	public int getMyCommentCnt(MemberVO memberVO)throws Exception{
		return sql.selectOne("getMyCommentCnt", memberVO);
	}
	
	// 전체 글 삭제
	@Override
	public void DeleteMyPost(MemberVO memberVO)throws Exception{
		sql.delete("DeleteMyPost",memberVO);
	}

	// 전체 댓글 삭제
	@Override
	public void DeleteMyComment(MemberVO memberVO)throws Exception{
		sql.delete("DeleteMyComment",memberVO);
	}
}