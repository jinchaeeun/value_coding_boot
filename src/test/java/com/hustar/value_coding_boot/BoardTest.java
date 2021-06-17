package com.hustar.value_coding_boot;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hustar.value_coding_boot.service.BoardService;
import com.hustar.value_coding_boot.vo.BoardVO;

@SpringBootTest
class BoardTest {
	
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	@Test
	void contextLoads() {
		
	}
	
	@Test
	public void testByApplicationContext() {
		try {
			System.out.println("===============");
			System.out.println(context.getBean("sqlSessionFactory"));
			System.out.println("===============");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testBySqlSessionFactory() {
		try {
			System.out.println("=========================");
			System.out.println(sessionFactory.toString());
			System.out.println("=========================");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Autowired
	private BoardService service;
	
	@Test
	public void testOfSelectDetail() throws Exception {
		BoardVO boardVO = service.read(1);
		try {
			//BoardVO board = service.read(1);
			String boardJson = new ObjectMapper().writeValueAsString(boardVO);

			System.out.println("=========================");
			System.out.println(boardJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testOfSelectList() throws Exception {
		List<BoardVO> board = service.list(0, 10, "title", "");
		try {
			String boardJson = new ObjectMapper().writeValueAsString(board);

			System.out.println("=========================");
			System.out.println(boardJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
}
