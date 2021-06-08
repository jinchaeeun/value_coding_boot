package com.hustar.value_coding_boot.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hustar.value_coding_boot.dao.BoardDAO;
import com.hustar.value_coding_boot.vo.BoardVO;
import com.hustar.value_coding_boot.vo.Criteria;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}
	
	// 게시글 목록 조회
	@Override
	public List<BoardVO> list(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return dao.list(displayPost, postNum, searchType, keyword);
	}
	
	// 게시글 조회
	@Override
	public BoardVO read(int po_num) throws Exception {
		return dao.read(po_num);
	}
	
	// 게시글 수정
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		dao.updateBoard(boardVO);
	}
	
	// 게시글 삭제
	@Override
	public void deleteBoard(int po_num) throws Exception {
		dao.deleteBoard(po_num);
	}
	
	// 게시글 총 갯수
	@Override
	public int count(String searchType, String keyword) throws Exception {
		return dao.count(searchType, keyword);
	}
}
