package com.hustar.value_coding_boot.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
		// TODO Auto-generated method stub
		return sql.selectOne("memberMapper.checkId", membervo);
	}

	@Override
	public MemberVO selectMemberView(MemberVO memberVO, String sql_id) throws Exception {
		// TODO Auto-generated method stub
		return (MemberVO) sql.selectOne(sql_id, memberVO);
	}

	@Override
	public void sosialJoin(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert("memberMapper.sosialJoin", vo);
	}
}