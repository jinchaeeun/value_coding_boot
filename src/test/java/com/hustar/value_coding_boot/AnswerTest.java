package com.hustar.value_coding_boot;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hustar.value_coding_boot.service.AnswerService;
import com.hustar.value_coding_boot.vo.AnswerVO;

@SpringBootTest
class AnswerTest {
	
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
	private AnswerService service;
	
	/*
	 * @Test public void testOfSelectDetail() throws Exception { AnswerVO answerVO =
	 * service.read(1); try { //BoardVO board = service.read(1); String boardJson =
	 * new ObjectMapper().writeValueAsString(answerVO);
	 * 
	 * System.out.println("=========================");
	 * System.out.println(boardJson);
	 * System.out.println("=========================");
	 * 
	 * } catch (JsonProcessingException e) { e.printStackTrace(); } }
	 */
	@Test
	public void testOfSelectList() throws Exception {
		AnswerVO answerVO = new AnswerVO();
		answerVO.setPo_num(140);
		
		List<AnswerVO> answer = service.list(answerVO);
		try {
			String boardJson = new ObjectMapper().writeValueAsString(answer);

			System.out.println("=========================");
			System.out.println(boardJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testOfSelectListDetail() throws Exception {
		AnswerVO answerVO = new AnswerVO();
		answerVO.setPo_num(140);
		answerVO.setAns_num(7);
		
		AnswerVO answer = service.detail(answerVO);
		
		try {
			String boardJson = new ObjectMapper().writeValueAsString(answer);

			System.out.println("=========================");
			System.out.println(boardJson);
			System.out.println("=========================");

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testOfDelete() throws Exception {
		AnswerVO answerVO = new AnswerVO();
		answerVO.setPo_num(140);
		answerVO.setAns_num(6);
		
		service.delete(answerVO);
		
		try {
			testOfSelectList();

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testOfUpdate() throws Exception {
		AnswerVO answerVO = new AnswerVO();
		answerVO.setPo_num(140);
		answerVO.setAns_num(9);
		answerVO.setAns_contents("댓글 수정");
		
		service.update(answerVO);
		
		try {
			testOfSelectList();

		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	}
}
