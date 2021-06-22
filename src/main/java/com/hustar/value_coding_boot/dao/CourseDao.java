package com.hustar.value_coding_boot.dao;

import java.util.List;

import com.hustar.value_coding_boot.vo.Course;

public interface CourseDao {
	
	// 알림 목록 조회
	List<Course> getAllCourses() throws Exception;
	
	// 알림 조회
	Course getCourceByCode(String couresCode) throws Exception;

	// 알림 작성
	public void writeCourse(Course cource) throws Exception;
	
	// 알림 삭제
	public void deleteCourse(int noti_id) throws Exception;
	
	// 알림 전체 삭제
	public void deleteCourseAll() throws Exception;
}
