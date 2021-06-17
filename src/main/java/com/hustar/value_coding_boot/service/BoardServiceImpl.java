package com.hustar.value_coding_boot.service;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.value_coding_boot.dao.BoardDAO;
import com.hustar.value_coding_boot.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO dao;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		//dao.write(boardVO);
		if(ObjectUtils.isEmpty(multipartHttpServletRequest) == false) {
			Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
			String name;
			
			while(iterator.hasNext()) {
				name = iterator.next();
				System.out.println("file tag name : " + name);
				List<MultipartFile> list = multipartHttpServletRequest.getFiles(name);
				
				for(MultipartFile multipartFile : list) {
					System.out.println("start file information");
					System.out.println("file name : " + multipartFile.getOriginalFilename());
					System.out.println("file size : " + multipartFile.getSize());
					System.out.println("file content type : " + multipartFile.getContentType());
					System.out.println("end file information");
				}
			}
		}
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
}
