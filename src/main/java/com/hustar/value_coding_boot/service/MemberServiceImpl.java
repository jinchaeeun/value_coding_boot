package com.hustar.value_coding_boot.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hustar.value_coding_boot.dto.MemberDto;
import com.hustar.value_coding_boot.mapper.MemberMapper;

@Service
public class MemberServiceImpl {
	@Autowired
	public MemberMapper memberMapper;
	
	public boolean isJoinAvailableId(String me_id) {
		// me_id를 mapper에게 주고 회원 가져와서 id 존재 여부 확인
				MemberDto memberDto = memberMapper.getMemberById(me_id);
				
				// me_id가 없으면 아이디 사용 가능하므로 true 반환
				if (memberDto == null ) {
					return true;
				}
				return false;
	}

	public void join(Map<String, Object> param) {
		memberMapper.join(param);	
	}

}
