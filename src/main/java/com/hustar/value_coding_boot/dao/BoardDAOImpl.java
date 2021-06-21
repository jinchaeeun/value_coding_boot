package com.hustar.value_coding_boot.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hustar.value_coding_boot.vo.BoardFileVO;
import com.hustar.value_coding_boot.vo.BoardVO;

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
	public List<BoardVO> list(int displayPost, int postNum, String searchType, String keyword, String board) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("displayPost", displayPost);  // 출력할 게시물
		data.put("postNum", postNum);  // 한 페이지에 출력할 게시물 개수
		data.put("searchType", searchType);  // 검색 타입
		data.put("keyword", keyword);  // 검색어
		data.put("po_boardname", board);  // 게시판
		
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
	public int count(String searchType, String keyword, String board) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("searchType", searchType);  // 검색 타입
		data.put("keyword", keyword);  // 검색어
		data.put("po_boardname", board);  // 게시판 이름
		return sqlSession.selectOne("mapper.boardMapper.selectBoardTotalCount", data);
	}
	
	// 게시글 조회수
	@Override
	public int updateViewCnt(int po_num) throws Exception {
		return sqlSession.update("mapper.boardMapper.updateViewCnt", po_num);
	}
	
	// 게시글 답변수
	@Override
	public int updateAnsCnt(int po_num) throws Exception {
		return sqlSession.update("mapper.boardMapper.updateAnsCnt", po_num);
	}
	
	// 게시글 파일 업로드
	@Override
	public void writeFile(List<BoardFileVO> list) throws Exception {
		sqlSession.insert("mapper.boardMapper.insertFileList", list);
	}
	
	// 게시글 파일 목록
	public List<BoardFileVO> selectFileList(int po_num) throws Exception {
		return sqlSession.selectList("mapper.boardMapper.selectFileList", po_num);
	}
	
	// 게시글 파일 정보
	@Override
	public BoardFileVO selectFileInfo(int fi_num, int po_num) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("fi_num", fi_num);
		data.put("po_num", po_num);
		return sqlSession.selectOne("mapper.boardMapper.selectFileInfo", data);
	}

	@Override
	public void deleteFile(int fi_num, int po_num) throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("fi_num", fi_num);
		data.put("po_num", po_num);
		sqlSession.update("mapper.boardMapper.deleteFile", data);
	}
}
