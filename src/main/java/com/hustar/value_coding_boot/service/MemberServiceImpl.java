package com.hustar.value_coding_boot.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.hustar.value_coding_boot.dao.MemberDAO;
import com.hustar.value_coding_boot.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject MemberDAO dao;
	
	@Override
	public void join(MemberVO vo) throws Exception {
		
		dao.join(vo);
		
	}

	@Override
	public int checkId(MemberVO membervo) throws Exception {
		return dao.checkId(membervo);
		
	}

	@Override
	public MemberVO selectMemberView(MemberVO memberVO, HttpServletRequest req, HttpServletResponse res, String sql_id) throws Exception{
		// TODO Auto-generated method stub
		System.out.println(sql_id);
		return dao.selectMemberView(memberVO, sql_id);
	}

	@Override
	public void sosialJoin(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.sosialJoin(vo);
	}

	@Override
	public int checkCode(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkCode(vo);
	}
	
}