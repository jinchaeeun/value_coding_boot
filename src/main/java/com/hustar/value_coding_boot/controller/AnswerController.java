package com.hustar.value_coding_boot.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hustar.value_coding_boot.service.AnswerService;
import com.hustar.value_coding_boot.service.BoardService;
import com.hustar.value_coding_boot.vo.AnswerVO;

@Controller
public class AnswerController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private AnswerService answerService;

	@Inject
	private BoardService boardService;
	
	// 답글 작성
	@RequestMapping("/answer/write")
	public String answerWrite(HttpServletRequest request) throws Exception {
		logger.info("답글 작성");
		
		AnswerVO answerVO = new AnswerVO();
		
		// request로 값을 받아와서 answerVO에 저장
		answerVO.setAns_contents(request.getParameter("ans_contents"));
		answerVO.setPo_num(Integer.parseInt(request.getParameter("po_num")));
		answerVO.setAns_writer(request.getParameter("ans_writer"));
		
		answerService.write(answerVO);
		boardService.updateAnsCnt(Integer.parseInt(request.getParameter("po_num")));
		
		return "redirect:/board/notice_view?po_num=" + request.getParameter("po_num");
	}
	
	// 답글 수정
	@RequestMapping("/answer/update")
	public String answerUpdate(HttpServletRequest request, int ans_num, int po_num) throws Exception {
		logger.info("답글 수정");
		
		AnswerVO answerVO = new AnswerVO();
		
		// request로 값을 받아와서 answerVO에 저장
		answerVO.setAns_contents(request.getParameter("update-answer-contents"));
		answerVO.setPo_num(Integer.parseInt(request.getParameter("po_num")));
		answerVO.setAns_num(Integer.parseInt(request.getParameter("ans_num")));
		
		answerService.update(answerVO);
		boardService.updateAnsCnt(Integer.parseInt(request.getParameter("po_num")));
		
		return "redirect:/board/notice_view?po_num=" + po_num;
	}
	
	// 답글 삭제
	@RequestMapping("/answer/delete")
	public String answerDelete(int ans_num, int po_num) throws Exception {
		logger.info("답글 삭제");
		
		AnswerVO answerVO = new AnswerVO();
		
		answerVO.setAns_num(ans_num);
		answerVO.setPo_num(po_num);
		
		answerService.delete(answerVO);
		boardService.updateAnsCnt(po_num);
		
		return "redirect:/board/notice_view?po_num=" + po_num;
	}
	
}
