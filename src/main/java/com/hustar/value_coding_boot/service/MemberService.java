package com.hustar.value_coding_boot.service;

import java.util.Map;

public interface MemberService {
	public void join(Map<String, Object> param) throws Exception;
	
	// 아이디 중복 검사
	public int idCheck(String me_id) throws Exception;
}
