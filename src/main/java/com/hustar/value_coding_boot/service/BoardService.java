package com.hustar.value_coding_boot.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.value_coding_boot.vo.BoardFileVO;
import com.hustar.value_coding_boot.vo.BoardVO;

public interface BoardService {
	// 게시글 작성
	public void write(BoardVO boardVO, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;
	
	// 게시글 목록 조회
	public List<BoardVO> list(int displayPost, int postNum, String searchType, String keyword, String board) throws Exception;
	
	// 게시글 조회
	public BoardVO read(int po_num) throws Exception;
	
	// 게시글 수정
	public void updateBoard(BoardVO boardVO, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception;
	
	// 게시글 삭제
	public void deleteBoard(int po_num) throws Exception;
	
	// 게시글 총 갯수
	public int count(String searchType, String keyword) throws Exception;
	
	// 게시글 조회수 증가
	public int updateViewCnt(int po_num) throws Exception;
	
	// 게시글 답변 수 증가
	public int updateAnsCnt(int po_num) throws Exception;
	
	// 게시글 파일 목록
	public List<BoardFileVO> selectFileList(int po_num) throws Exception;
	
	// 게시글 파일 정보
	public BoardFileVO selectFileInfo(int fi_num, int po_num) throws Exception;
	
	// 게시글 파일 삭제
	public void deleteFile(int fi_num, int po_num) throws Exception;
}
