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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.hustar.value_coding_boot.service.BoardService;
import com.hustar.value_coding_boot.vo.BoardVO;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService boardService;
	
	// 글쓰기 화면
	@RequestMapping(value = "/board/notice_write", method = RequestMethod.GET)
	public void notice_write() throws Exception {
		logger.info("notice_write");
		
		//return "/board/notice_write";
	}
	
	// 글 작성
	@RequestMapping(value = "/board/notice_write_dao", method = RequestMethod.POST)
	public String notice_write(BoardVO boardVO, RedirectAttributes redirectAttributes) throws Exception {
		logger.info("notice_write_dao");
		
		System.out.println("notice_write_dao");
		
		boardService.write(boardVO);
		
		redirectAttributes.addFlashAttribute("msg", "회원가입에 성공하였습니다.");
		
		return "redirect:/board/notice_list";
	}
	
	// 게시글 목록 화면
	@RequestMapping(value = "/board/notice_list", method = RequestMethod.GET)
	public String notice_list(HttpServletRequest request, 
			Model model) throws Exception {
		logger.info("notice_list");

		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		
		if(inputFlashMap != null) {
			model.addAttribute("msg", inputFlashMap.get("msg"));
			System.out.println("msg = " + inputFlashMap.get("msg"));
		}
		return "/board/notice_list";
	}
	
	/*
	 * @Autowired private BoardService boardService;
	 * 
	 * BoardDTO boardDTO;
	 * 
	 * // 게시판 목록 가져오기
	 * 
	 * @RequestMapping(value = "/board_list", method = RequestMethod.GET) public
	 * String board(Model model) throws Exception { model.addAttribute("list",
	 * boardService.getBoardList());
	 * 
	 * //List<Map<String, Object>> list = boardService.getBoardList();
	 * 
	 * System.out.println("board controller start"); return "board/notice_list"; }
	 * 
	 * @RequestMapping(value = "/board_view", method = RequestMethod.GET) public
	 * String board_view() throws Exception {
	 * System.out.println("board controller start"); return "board/notice_view"; }
	 * 
	 * // 글쓰기 화면에 나타난 정보들을 저장
	 * 
	 * @RequestMapping(value = "/board_write") public String board_write( BoardDTO
	 * boardDTO, RedirectAttributes redirectAttributes) throws Exception {
	 * logger.info("board_write");
	 * 
	 * try { boolean isRegistered = boardService.registerBoard(boardDTO);
	 * 
	 * System.out.println("board controller start");
	 * System.out.println(boardDTO.getPo_boardname());
	 * System.out.println(boardDTO.getPo_contents());
	 * System.out.println(boardDTO.getPo_title());
	 * System.out.println(boardDTO.getPo_file_path());
	 * System.out.println(boardDTO.getPo_noticeYn());
	 * 
	 * if(isRegistered == false) { logger.info("게시글 저장 실패"); } } catch
	 * (DataAccessException e) { logger.info("데이터베이스 처리 과정에 문제가 발생\n" + e); } catch
	 * (Exception e) { logger.info("시스템에 문제 발생\n" + e); }
	 * 
	 * return "redirect:/notice_list"; }
	 * 
	 * // 글쓰기 화면으로 이동 // 게시글 번호가 없으면 새로운 글쓰기 화면으로 이동 // 게시글 번호가 있으면서 내용이 있으면 해당내용을
	 * 글쓰기 화면으로 전달
	 * 
	 * @RequestMapping(value = "/board_write_view", method = RequestMethod.GET)
	 * public String board_write_view(
	 * 
	 * @RequestParam(value = "po_num", required = false) int po_num, Model model)
	 * throws Exception {
	 * 
	 * if((Integer)po_num == null) { model.addAttribute("board", boardDTO); } else {
	 * boardDTO = boardService.getBoardDetail(po_num); if(boardDTO == null) { return
	 * "redirect:/board_list"; } model.addAttribute("board", boardDTO); }
	 * logger.info("board_write_view");
	 * 
	 * System.out.println("board controller start"); return "board/notice_write"; }
	 */
}
