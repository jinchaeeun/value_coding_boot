package com.hustar.value_coding_boot.service;

import com.hustar.value_coding_boot.vo.BoardVO;

public interface BoardService {
//	public boolean registerBoard(BoardDTO params);
//	public BoardDTO getBoardDetail(int po_num);
//	public boolean deleteBoard(int po_num);
//	public List<Map<String, Object>> getBoardList();
	
	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
}
