package com.hustar.value_coding_boot.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.value_coding_boot.dao.CourseDao;
import com.hustar.value_coding_boot.vo.BoardFileVO;
import com.hustar.value_coding_boot.vo.BoardVO;
import com.hustar.value_coding_boot.vo.Course;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Inject
	private CourseDao courseDao;
	
	@Override
	public List<Course> getAllCourses(String noti_alert_id) throws Exception {
		return courseDao.getAllCourses(noti_alert_id);
	}	
	
	@Override
	public void writeCourse(Course course) throws Exception {
		courseDao.writeCourse(course);
	}
	
	@Override
	public void deleteCourse(int noti_id) throws Exception {
		courseDao.deleteCourse(noti_id);
	}
	
	@Override
	public void deleteCourseAll(String noti_alert_id) throws Exception {
		courseDao.deleteCourseAll(noti_alert_id);
	}
	
}
