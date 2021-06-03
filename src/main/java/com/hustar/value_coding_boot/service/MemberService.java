package com.hustar.value_coding_boot.service;

import java.util.Map;

public interface MemberService {
	
	public void join(Map<String, Object> param); 
	
	public boolean isJoinAvailableId(String me_id);

}
