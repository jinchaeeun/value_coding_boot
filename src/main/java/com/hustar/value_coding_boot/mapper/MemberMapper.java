package com.hustar.value_coding_boot.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {
	
	void join(Map<String, Object> param);
	
	// 아이디 중복 검사
	public int idCheck(@Param("me_id") String me_id);
	
}
