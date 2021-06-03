package com.hustar.value_coding_boot.service;

import java.util.Map;

import com.hustar.value_coding_boot.dto.MemberDto;

public interface MemberService {
	
	public boolean isJoinAvailableId(String me_id);

	public MemberDto getMemberById(String me_id);
	
	public void join(Map<String, Object> param); 
}
