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
		answerVO.setAns_po_num(Integer.parseInt(request.getParameter("po_num")));
		answerVO.setAns_writer(request.getParameter("ans_writer"));
		
		answerService.write(answerVO);
		
		// 방금 넣은 답변의 ans_num 조회
		int ans_num = answerService.getLastAnswer();
		
		// 부모 답글에 group_num 할당
		answerService.updateParent(ans_num);
		
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
		answerVO.setAns_po_num(Integer.parseInt(request.getParameter("po_num")));
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
		answerVO.setAns_po_num(po_num);
		
		AnswerVO parentVO = answerService.detail(answerVO);
		
		// 부모 댓글이면 자식댓글까지 다 삭제
		if(parentVO.getAns_depth() == 0) {
			answerService.deleteAll(answerVO);
		}
		else {  // 자식 댓글은 자식 하나만 삭제
			answerService.delete(answerVO);
		}
		
		boardService.updateAnsCnt(po_num);
		
		return "redirect:/board/notice_view?po_num=" + po_num;
	}
	
	// 대댓글 작성
	@RequestMapping("/answer/ans_write")
	public String answeransWrite(AnswerVO answerVO) throws Exception {
		logger.info("대댓글 작성");
		
		AnswerVO re_answerVO = new AnswerVO();
		
		// 그룹 내 순서 조회
		int group_order = answerService.selectMaxGroupOrder(answerVO.getAns_num());
		
		re_answerVO.setAns_group_num(answerVO.getAns_num());
		re_answerVO.setAns_contents(answerVO.getAns_contents());
		re_answerVO.setAns_po_num(answerVO.getAns_po_num());
		re_answerVO.setAns_depth(1);
		re_answerVO.setAns_group_order(group_order + 1);
		
		// 대댓글 입력
		answerService.childInsert(re_answerVO);
		boardService.updateAnsCnt(answerVO.getAns_po_num());
		
		return "redirect:/board/notice_view?po_num=" + answerVO.getAns_po_num();
	}
}
