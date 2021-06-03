package com.hustar.value_coding_boot.service;

import java.util.List;

import com.hustar.value_coding_boot.dto.TestDto;

public interface TestService {

	// 디비 조회
	List<TestDto> selectTest() throws Exception;
	
	TestDto getTestDetailById(int id) throws Exception;

	public void deleteArticleById(int id) throws Exception;
}
