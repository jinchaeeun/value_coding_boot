package com.hustar.value_coding_boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hustar.value_coding_boot.dto.TestDto;
import com.hustar.value_coding_boot.mapper.TestMapper;

@Service
public class TestServiceImpl {
	@Autowired
	public TestMapper testMapper;
	

	public List<TestDto> selectTest() throws Exception {
		return testMapper.selectTest();
	}
}
