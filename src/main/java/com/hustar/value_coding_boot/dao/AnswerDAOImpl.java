package com.hustar.value_coding_boot.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hustar.value_coding_boot.vo.AnswerVO;

@Repository
public class AnswerDAOImpl implements AnswerDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	// 답글 작성
	@Override
	public void write(AnswerVO answerVO) throws Exception {
		sqlSession.insert("mapper.answerMapper.insert", answerVO);
	}
	
	// 답글 목록
	@Override
	public List<AnswerVO> list(AnswerVO answerVO) throws Exception {
		return sqlSession.selectList("mapper.answerMapper.selectAnswers", answerVO);
	}
	
	// 답글 수정
	@Override
	public void update(AnswerVO answerVO) throws Exception {
		sqlSession.update("mapper.answerMapper.updateAnswer", answerVO);
	}
	
	// 답글 삭제
	@Override
	public void delete(AnswerVO answerVO) throws Exception {
		sqlSession.update("mapper.answerMapper.deleteAnswer", answerVO);
	}
	
	// 답글 갯수
	@Override
	public int getCnt(AnswerVO answerVO) throws Exception {
		return sqlSession.selectOne("mapper.answerMapper.selectAnswersCnt", answerVO);
	}
	
	// 답글 한개 선택
	@Override
	public AnswerVO detail(AnswerVO answerVO) throws Exception {
		return sqlSession.selectOne("mapper.answerMapper.selectDetail", answerVO);
	}
	
	// 부모의 group_num 할당
	@Override
	public void updateParent(int ans_num) throws Exception {
		sqlSession.update("mapper.answerMapper.updateParent", ans_num);
	}

	// 그룹 내 순서 조회
	@Override
	public int selectMaxGroupOrder(int ans_num) throws Exception {
		return sqlSession.selectOne("mapper.answerMapper.selectMaxGroupOrder", ans_num);
	}

	// 대댓글 입력
	@Override
	public void childInsert(AnswerVO answerVO) throws Exception {
		sqlSession.insert("mapper.answerMapper.childInsert", answerVO);
	}
	
	// 최근 답글의 ans_num 조회
	@Override
	public int getLastAnswer() throws Exception {
		return sqlSession.selectOne("mapper.answerMapper.getLastAnswer");
	}
	
	// 답글 그룹 삭제
	@Override
	public void deleteAll(AnswerVO answerVO) throws Exception {
		sqlSession.update("mapper.answerMapper.deleteAll", answerVO);
	}

}
