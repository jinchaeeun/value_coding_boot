package com.hustar.value_coding_boot.dao;

import com.hustar.value_coding_boot.vo.BoardVO;

public interface BoardDAO {
	
	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
}
