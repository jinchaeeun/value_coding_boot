package com.hustar.value_coding_boot.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hustar.value_coding_boot.vo.Course;

@Repository
public class CourseDaoImpl implements CourseDao{
	
	@Inject
	private SqlSession sqlSession;


	@Override
	public List<Course> getAllCouses() throws Exception {		
		return sqlSession.selectList("mapper.massageMapper.list");
	}

	@Override
	public Course getCourceByCode(String courseCode) throws Exception {
		return sqlSession.selectOne("mapper.massageMapper.read", courseCode);
	}	
}
