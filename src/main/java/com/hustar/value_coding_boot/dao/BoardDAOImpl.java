package com.hustar.value_coding_boot.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hustar.value_coding_boot.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("mapper.boardMapper.insert", boardVO);
	}

}
