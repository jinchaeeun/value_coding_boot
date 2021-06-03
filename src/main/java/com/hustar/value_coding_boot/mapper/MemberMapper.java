package com.hustar.value_coding_boot.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hustar.value_coding_boot.dto.MemberDto;

@Mapper
public interface MemberMapper {

	MemberDto getMemberById(@Param("me_id") String me_id);

	void join(Map<String, Object> param);

}
