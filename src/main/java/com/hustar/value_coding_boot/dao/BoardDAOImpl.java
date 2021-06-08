package com.hustar.value_coding_boot.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.print.attribute.HashAttributeSet;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hustar.value_coding_boot.vo.BoardVO;
import com.hustar.value_coding_boot.vo.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("mapper.boardMapper.insert", boardVO);
	}

	// 게시글 목록 조회
	@Override
	public List<BoardVO> list(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);  // 출력할 게시물
		data.put("postNum", postNum);  // 한 페이지에 출력할 게시물 개수
		data.put("searchType", searchType);  // 검색 타입
		data.put("keyword", keyword);  // 검색어
		
		return sqlSession.selectList("mapper.boardMapper.list", data);
	}
	
	// 게시글 조회
	@Override
	public BoardVO read(int po_num) throws Exception {
		return sqlSession.selectOne("mapper.boardMapper.read", po_num);
	}
	
	// 게시글 수정
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		sqlSession.update("mapper.boardMapper.updateBoard", boardVO);
	}
	
	// 게시글 삭제
	@Override
	public void deleteBoard(int po_num) throws Exception {
		sqlSession.update("mapper.boardMapper.deleteBoard", po_num);
	}
	
	// 게시글 총 갯수
	@Override
	public int count(String searchType, String keyword) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchType", searchType);  // 검색 타입
		data.put("keyword", keyword);  // 검색어
		return sqlSession.selectOne("mapper.boardMapper.selectBoardTotalCount", data);
	}
}
