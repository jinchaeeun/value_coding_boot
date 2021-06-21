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
	
	// 답글 그룹 삭제
	public void deleteAll(AnswerVO answerVO) throws Exception;
		
	// 답글 갯수
	public int getCnt(AnswerVO answerVO) throws Exception;
	
	// 부모의 group_num 할당
	public void updateParent(int ans_num) throws Exception;
	
	// 그룹 내 순서 조회
	public int selectMaxGroupOrder(int ans_num) throws Exception;
	
	// 대댓글 입력
	public void childInsert(AnswerVO answerVO) throws Exception;
	
	// 최근 답글의 ans_num 조회
	public int getLastAnswer() throws Exception;
}
