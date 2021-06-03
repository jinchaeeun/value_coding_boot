package com.hustar.value_coding_boot.service;

import javax.inject.Inject;

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
	
}