package com.hustar.value_coding_boot.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.hustar.value_coding_boot.service.BoardService;
import com.hustar.value_coding_boot.vo.BoardVO;
import com.hustar.value_coding_boot.vo.Paging;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	
	// 글쓰기 화면
	@RequestMapping(value = "/board/notice_write", method = RequestMethod.GET)
	public String notice_write() throws Exception {
		logger.info("notice_write");
		
		return "/board/notice_write";
	}
	
	// 글 작성
	@RequestMapping(value = "/board/notice_write_dao", method = RequestMethod.POST)
	public String notice_write(BoardVO boardVO, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("notice_write_dao");
		
		boardService.write(boardVO);
		
		redirectAttributes.addFlashAttribute("msg", "게시글을 작성했습니다.");
		
		return "redirect:/board/notice_list?num=1";
	}
	
	// 게시글 목록 화면 (게시물 목록 + 페이징 + 검색)
	@RequestMapping(value = "/board/notice_list", method = RequestMethod.GET)
	public String notice_list(HttpServletRequest request, 
			Model model,
			BoardVO boardVO,
			@RequestParam("num") int num, // 현재 선택한 페이지
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
			) throws Exception {
		logger.info("notice_list");
		
		Paging page = new Paging();
		
		// 현재 페이지
		page.setNum(num);
		
		// 게시물의 전체 개수 구함
		page.setCount(boardService.count(searchType, keyword));
		
		// 검색 타입과 검색어
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		model.addAttribute("list", boardService.list(page.getDisplayPost(), page.getPostNum(), searchType, keyword));
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		// 게시글이 등록되면서 메세지가 전달됨
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		
		// 전달된 메세지가 있으면 뿌려줌
		if(inputFlashMap != null) {
			model.addAttribute("msg", inputFlashMap.get("msg"));
			System.out.println("msg = " + inputFlashMap.get("msg"));
		}
	
		return "/board/notice_list";
	}
	
	// 게시글 조회
	@RequestMapping(value = "/board/notice_view", method = RequestMethod.GET)
	public String notice_view(int po_num, Model model) throws Exception {
		logger.info("notice_view");
		
		BoardVO boardVO = boardService.read(po_num);
		
		// 게시글 하나 조회해서 보여줌
		model.addAttribute("read", boardVO);
		
		return "/board/notice_view";
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/board/notice_delete", method = RequestMethod.GET)
	public String notice_delete(int po_num) throws Exception {
		logger.info("notice_delete");
		
		System.out.println(po_num);
		
		boardService.deleteBoard(po_num);
		
		return "redirect:/board/notice_list?num=1";
	}
	
	// 게시글 수정뷰
	@RequestMapping(value = "/board/notice_updateView", method = RequestMethod.GET)
	public String notice_updateView(BoardVO boardVO, Model model) throws Exception {
		logger.info("notice_updateView");
		
		model.addAttribute("update", boardService.read(boardVO.getPo_num()));
		
		return "/board/notice_updateView";
	}
	
	// 게시글 수정
	@RequestMapping(value = "/board/notice_update", method = RequestMethod.POST)
	public String notice_update(BoardVO boardVO) throws Exception {
		logger.info("notice_update");
		
		boardService.updateBoard(boardVO);
		
		return "redirect:/board/notice_view?po_num=" + boardVO.getPo_num();
	}
}
