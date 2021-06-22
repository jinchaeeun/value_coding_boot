package com.hustar.value_coding_boot.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.value_coding_boot.vo.Course;

public interface CourseService {
	
	// 알림 목록 조회
	List<Course> getAllCourses() throws Exception;
	public void writeCourse(Course course) throws Exception;	
	public void deleteCourse(int noti_id) throws Exception;
	public void deleteCourseAll() throws Exception;
}
