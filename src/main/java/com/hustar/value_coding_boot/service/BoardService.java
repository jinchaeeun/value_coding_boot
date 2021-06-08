package com.hustar.value_coding_boot.service;

import java.util.List;

import com.hustar.value_coding_boot.vo.BoardVO;
import com.hustar.value_coding_boot.vo.Criteria;

public interface BoardService {
//	public boolean registerBoard(BoardDTO params);
//	public BoardDTO getBoardDetail(int po_num);
//	public boolean deleteBoard(int po_num);
//	public List<Map<String, Object>> getBoardList();
	
	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	// 게시글 목록 조회
	public List<BoardVO> list(int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 게시글 조회
	public BoardVO read(int po_num) throws Exception;
	
	// 게시글 수정
	public void updateBoard(BoardVO boardVO) throws Exception;
	
	// 게시글 삭제
	public void deleteBoard(int po_num) throws Exception;
	
	// 게시글 총 갯수
	public int count(String searchType, String keyword) throws Exception;
}
