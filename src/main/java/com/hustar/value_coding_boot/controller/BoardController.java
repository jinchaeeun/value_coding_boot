package com.hustar.value_coding_boot.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.hustar.value_coding_boot.service.AnswerService;
import com.hustar.value_coding_boot.service.BoardService;
import com.hustar.value_coding_boot.vo.AnswerVO;
import com.hustar.value_coding_boot.vo.BoardFileVO;
import com.hustar.value_coding_boot.vo.BoardVO;
import com.hustar.value_coding_boot.vo.Paging;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@Inject
	private AnswerService answerService;
	
	@Inject
	private MappingJackson2JsonView jsonView;
	
	private static String boardName;
	
	// 글쓰기 화면
	@RequestMapping(value = "/board/notice_write", method = RequestMethod.GET)
	public String notice_write() throws Exception {
		logger.info("notice_write");
		
		return "/board/notice_write";
	}
	
	// 글 작성
	@RequestMapping(value = "/board/notice_write_dao", method = RequestMethod.POST)
	public String notice_write(BoardVO boardVO,
			MultipartHttpServletRequest multipartHttpServletRequest,
			Model model
			) throws Exception {
		logger.info("notice_write_dao");
		
		boardService.write(boardVO, multipartHttpServletRequest);
		
		String encode = URLEncoder.encode(boardName, "UTF-8");
		return "redirect:/board/notice_list?board=" + encode + "&num=1";
	}
	
	// 게시글 목록 화면 (게시물 목록 + 페이징 + 검색)
	@RequestMapping(value = "/board/notice_list", method = RequestMethod.GET)
	public String notice_list(HttpServletRequest request, 
			Model model,
			BoardVO boardVO,
			@RequestParam("num") int num, // 현재 선택한 페이지
			@RequestParam("board") String board, // 현재 선택한 게시판
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
			) throws Exception {
		logger.info("notice_list");
		
		// 게시판 이름 설정
		boardName = board;
		
		Paging page = new Paging();
		
		// 현재 페이지
		page.setNum(num);
		
		// 게시물의 전체 개수 구함
		page.setCount(boardService.count(searchType, keyword, board));
		
		// 검색 타입과 검색어
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		model.addAttribute("list", boardService.list(page.getDisplayPost(), page.getPostNum(), searchType, keyword, board));
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		// 게시판 이름 넘겨줌
		model.addAttribute("board", board);
		
		// 게시글이 등록되면서 메세지가 전달됨
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		
		// 전달된 메세지가 있으면 뿌려줌
		if(inputFlashMap != null) {
			model.addAttribute("msg", inputFlashMap.get("msg"));
		}
	
		return "/board/notice_list";
	}
	
	// 게시글 조회
	@RequestMapping(value = "/board/notice_view", method = RequestMethod.GET)
	public String notice_view(int po_num, Model model, AnswerVO answerVO) throws Exception {
		logger.info("notice_view");
		
		BoardVO boardVO = boardService.read(po_num);
		
		// 조회 수 증가
		boardService.updateViewCnt(po_num);
		
		// 답글 조회
		answerVO.setPo_num(po_num);
		List<AnswerVO> answerList =  answerService.list(answerVO);
		model.addAttribute("answerList", answerList);
		
		// 답글 수 조회
		int answerCnt = answerService.getCnt(answerVO);
		model.addAttribute("answerCnt", answerCnt);
		
		// 게시글 하나 조회해서 보여줌
		model.addAttribute("read", boardVO);
		
		// 게시글 파일 조회
		List<BoardFileVO> fileList =  boardService.selectFileList(po_num);
		
		model.addAttribute("fileList", fileList);
		
		// 게시판 이름 넘겨줌
		model.addAttribute("board", boardName);
		
		return "/board/notice_view";
	}
	
	// 게시글 삭제
	@RequestMapping(value = "/board/notice_delete", method = RequestMethod.GET)
	public String notice_delete(int po_num) throws Exception {
		logger.info("notice_delete");
		
		boardService.deleteBoard(po_num);
		
		String encode = URLEncoder.encode(boardName, "UTF-8");
		return "redirect:/board/notice_list?board=" + encode + "&num=1";
	}
	
	// 게시글 수정뷰
	@RequestMapping(value = "/board/notice_updateView", method = RequestMethod.GET)
	public String notice_updateView(BoardVO boardVO, Model model) throws Exception {
		logger.info("notice_updateView");
		
		model.addAttribute("update", boardService.read(boardVO.getPo_num()));
		
		// 파일 목록 추가
		List<BoardFileVO> list = boardService.selectFileList(boardVO.getPo_num());
		model.addAttribute("list", list);
		
		// 게시판 이름 넘겨줌
		model.addAttribute("board", boardName);
		
		return "/board/notice_updateView";
	}
	
	// 게시글 수정
	@RequestMapping(value = "/board/notice_update", method = RequestMethod.POST)
	public String notice_update(BoardVO boardVO, MultipartHttpServletRequest multipartHttpServletRequest, Model model) throws Exception {
		logger.info("notice_update");
		
		boardService.updateBoard(boardVO, multipartHttpServletRequest);
		
		// 게시판 이름 넘겨줌
		model.addAttribute("board", boardName);
		
		return "redirect:/board/notice_view?&po_num=" + boardVO.getPo_num();
	}
	
	// 게시글 파일 다운로드
	@RequestMapping("/board/downloadFile")
	public void downloadFile(int fi_num, int po_num, HttpServletResponse response) throws Exception {
		logger.info("downloadFile");
		
		BoardFileVO boardFile = boardService.selectFileInfo(fi_num, po_num);
		
		if(ObjectUtils.isEmpty(boardFile) == false) {
			String fileName = boardFile.getFi_ori_filename();
			
			// 실제 저장된 파일을 불러서 byte[] 형태로 저장
			byte[] files = FileUtils.readFileToByteArray(new File(boardFile.getFi_filepath()));
			
			// 파일 저장 정보 세팅 (UTF-8로 인코딩하여 저장)
			response.setContentType("application/octet-stream");
			response.setContentLength(files.length);
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileName, "UTF-8")+"\";");
			
			response.getOutputStream().write(files);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
	}
	
	// 게시글 파일 삭제
	@RequestMapping("/board/deleteFile")
	public ModelAndView deleteFile(int fi_num, int po_num, Model model) throws Exception {
		logger.info("deleteFile");
		
		if(fi_num != 0) {
			boardService.deleteFile(fi_num, po_num);
			
			model.addAttribute("success", "true");
		}
		else {
			model.addAttribute("duplitcate", "false");
		}
		
		return new ModelAndView(jsonView);
	}
}
