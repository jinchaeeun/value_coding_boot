package com.hustar.value_coding_boot.service;

import java.util.List;

import com.hustar.value_coding_boot.vo.Course;

public interface CourseService {
	
	// 알림 목록 조회
	List<Course> getAllCouses() throws Exception;
}
