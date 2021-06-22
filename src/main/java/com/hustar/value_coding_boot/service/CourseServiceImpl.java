package com.hustar.value_coding_boot.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hustar.value_coding_boot.dao.CourseDao;
import com.hustar.value_coding_boot.vo.Course;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Inject
	private CourseDao courseDao;
	
	@Override
	public List<Course> getAllCouses() throws Exception {
		return courseDao.getAllCouses();
	}
}
