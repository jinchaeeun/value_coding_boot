package com.hustar.value_coding_boot.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.value_coding_boot.common.FileUtils;
import com.hustar.value_coding_boot.dao.BoardDAO;
import com.hustar.value_coding_boot.vo.BoardFileVO;
import com.hustar.value_coding_boot.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;

	@Autowired
	private FileUtils fileUtils;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		dao.write(boardVO);
		
		// 파일 업로드 
		List<BoardFileVO> list = fileUtils.parseFileInfo(boardVO, multipartHttpServletRequest);
		
		if(CollectionUtils.isEmpty(list) == false) {
		  dao.writeFile(list); 
		}
	}
	
	// 게시글 목록 조회
	@Override
	public List<BoardVO> list(int displayPost, int postNum, String searchType, String keyword, String board) throws Exception {
		return dao.list(displayPost, postNum, searchType, keyword, board);
	}
	
	// 게시글 조회
	@Override
	public BoardVO read(int po_num) throws Exception {
		return dao.read(po_num);
	}
	
	// 게시글 수정
	@Override
	public void updateBoard(BoardVO boardVO, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		dao.updateBoard(boardVO);
		
		// 파일 업로드 
		List<BoardFileVO> list = fileUtils.parseFileInfo(boardVO, multipartHttpServletRequest);
		
		if(CollectionUtils.isEmpty(list) == false) {
		  dao.writeFile(list); 
		}
	}
	
	// 게시글 삭제
	@Override
	public void deleteBoard(int po_num) throws Exception {
		dao.deleteBoard(po_num);
	}
	
	// 게시글 총 갯수
	@Override
	public int count(String searchType, String keyword, String board) throws Exception {
		return dao.count(searchType, keyword, board);
	}
	
	// 게시글 조회 수 증가
	@Override
	public int updateViewCnt(int po_num) throws Exception {
		return dao.updateViewCnt(po_num);
	}

	// 게시글 답변 수
	@Override
	public int updateAnsCnt(int po_num) throws Exception {
		return dao.updateAnsCnt(po_num);
	}
	
	// 게시글 파일 목록
	@Override
	public List<BoardFileVO> selectFileList(int po_num) throws Exception {
		return dao.selectFileList(po_num);
	}

	// 게시글 파일 정보
	@Override
	public BoardFileVO selectFileInfo(int fi_num, int po_num) throws Exception {
		return dao.selectFileInfo(fi_num, po_num);
	}
	
	// 게시글 파일 삭제
	@Override
	public void deleteFile(int fi_num, int po_num) throws Exception {
		dao.deleteFile(fi_num, po_num);
	}
}
