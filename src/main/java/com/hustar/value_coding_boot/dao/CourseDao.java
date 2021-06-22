package com.hustar.value_coding_boot.dao;

import java.util.List;

import com.hustar.value_coding_boot.vo.Course;

public interface CourseDao {
	
	// 알림 목록 조회
	List<Course> getAllCouses() throws Exception;
	
	// 알림 조회
	Course getCourceByCode(String couresCode) throws Exception;
}
