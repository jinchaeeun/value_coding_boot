package com.hustar.value_coding_boot.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hustar.value_coding_boot.dao.AnswerDAO;
import com.hustar.value_coding_boot.vo.AnswerVO;

@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Inject
	private AnswerDAO dao;
	
	// 답글 작성
	@Override
	public void write(AnswerVO answerVO) throws Exception {
		dao.write(answerVO);
	}
	
	// 답글 목록
	@Override
	public List<AnswerVO> list(AnswerVO answerVO) throws Exception {
		return dao.list(answerVO);
	}
	
	// 답글 수정
	@Override
	public void update(AnswerVO answerVO) throws Exception {
		dao.update(answerVO);
	}
	
	// 답글 삭제
	@Override
	public void delete(AnswerVO answerVO) throws Exception {
		dao.delete(answerVO);
	}
	
	// 답글 갯수
	@Override
	public int getCnt(AnswerVO answerVO) throws Exception {
		return dao.getCnt(answerVO);
	}
	
	// 답글 한개 선택
	@Override
	public AnswerVO detail(AnswerVO answerVO) throws Exception {
		return dao.detail(answerVO);
	}

}
