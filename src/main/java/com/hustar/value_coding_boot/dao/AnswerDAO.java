package com.hustar.value_coding_boot.dao;

import java.util.List;

import com.hustar.value_coding_boot.vo.AnswerVO;

public interface AnswerDAO {
	
	// 답글 작성
	public void write(AnswerVO answerVO) throws Exception;
	
	// 답글 목록
	public List<AnswerVO> list(AnswerVO answerVO) throws Exception;
	
	// 답글 한개 선택
	public AnswerVO detail(AnswerVO answerVO) throws Exception;
	
	// 답글 수정
	public void update(AnswerVO answerVO) throws Exception;
	
	// 답글 삭제
	public void delete(AnswerVO answerVO) throws Exception;
	
	// 답글 갯수
	public int getCnt(AnswerVO answerVO) throws Exception;
}
