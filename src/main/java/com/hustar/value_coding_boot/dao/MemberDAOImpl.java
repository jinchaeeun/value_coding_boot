package com.hustar.value_coding_boot.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hustar.value_coding_boot.vo.BoardVO;
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
}