package com.hustar.value_coding_boot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hustar.value_coding_boot.dto.TestDto;

@Mapper
public interface TestMapper {
	//조회
	public List<TestDto> selectTest() throws Exception;
}
