package com.hustar.value_coding_boot.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hustar.value_coding_boot.mapper.MemberMapper;

@Service
public class MemberServiceImpl {
	@Autowired
	MemberMapper memberMapper;
	
	public void join(Map<String, Object> param) throws Exception {
		memberMapper.join(param);	
	}
	
	public int idCheck(String me_id) throws Exception {
		
		return memberMapper.idCheck(me_id);
	}

}
