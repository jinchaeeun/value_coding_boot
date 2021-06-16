package com.hustar.value_coding_boot.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.hustar.value_coding_boot.service.MemberService;
import com.hustar.value_coding_boot.vo.BoardVO;
import com.hustar.value_coding_boot.vo.CommentVO;
import com.hustar.value_coding_boot.vo.MemberVO;

@Controller 
@RequestMapping("/member/**")
public class MemberController { 
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	MemberService service;
	
	@Resource(name="jsonView")
	MappingJackson2JsonView jsonView;
	
	// 회원가입 get
	@RequestMapping(value = "/member/join")
	public String getJoin(HttpServletRequest request,
			Model model) throws Exception {	
		logger.info("get join");
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if(inputFlashMap != null) {
			model.addAttribute("msg", inputFlashMap.get("msg"));
			System.out.println("msg = " + inputFlashMap.get("msg"));
		}
		return "/member/join";
	}
	
	// 회원가입 post
	@RequestMapping(value = "/member/joinInsert")
	public String JoinInsert(
			@ModelAttribute("memberVO") MemberVO vo, 
			RedirectAttributes redirectAttributes) throws Exception {
		logger.info("post join");
		
//		데이터 출력 확인		
//		System.out.println("id = "+ vo.getMe_id());
//		System.out.println("NickName = "+ vo.getMe_nickName());
//		System.out.println("password = "+ vo.getMe_pass());
//		System.out.println("devLang = "+ vo.getMe_devLang());
		
		
		int cnt = service.checkId(vo);
		System.out.println("cnt = " + cnt);
		
		if(cnt>0) {
			redirectAttributes.addFlashAttribute("msg", "이미 가입된 아이디입니다.");
		}else {
			//패스워드 암호화
			String encpass = BCrypt.hashpw(vo.getMe_pass(), BCrypt.gensalt()); //(데이터를 가지고 와서, gensalt 암호화)
			vo.setMe_pass(encpass);											   //데이터베이스에 넣을 수 있게 암호화한 값 다시 전달
			//데이터 삽입
			service.join(vo);
			redirectAttributes.addFlashAttribute("msg", "회원가입 성공");
		}
		return "redirect:/member/join";
	}
	
	@RequestMapping("/member/login")
	public String login(HttpServletRequest request,
			Model model) throws Exception {
		Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
		if(inputFlashMap != null) {
			model.addAttribute("msg", inputFlashMap.get("msg"));
			System.out.println("msg = " + inputFlashMap.get("msg"));
		}
		return "/member/login";
	}
	
	@GetMapping("mypage") 
	public String member_mypage(HttpSession session, RedirectAttributes redirectAttributes) throws Exception { 
		
		// 로그인 필수
		MemberVO loginVO = (MemberVO) session.getAttribute("login");
		
		if(loginVO == null) {
			redirectAttributes.addFlashAttribute("msg","로그인이 필요합니다,");
			return "redirect:/member/login";
		}
	
		return "member/mypage"; 
	} 
	
	// 내가 작성한 질문
	@RequestMapping("/member/mypage_board") 
	public String mypage_board(HttpSession session, RedirectAttributes redirectAttributes, Model model) throws Exception{ 
		
		MemberVO loginVO = (MemberVO) session.getAttribute("login");
		
		// 로그인 필수
		if(loginVO == null) {
			redirectAttributes.addFlashAttribute("msg","로그인이 필요합니다,");
			return "redirect:/member/login";
		}
		
		// (loginVO) 받아서!! 세션 id!! 가져감!!
		List<BoardVO> boardVO = (List<BoardVO>)service.ViewMyPostMember(loginVO);
		model.addAttribute("boardVO",boardVO);
		
		/*
		CommentVO commentVO = (CommentVO)service.CountComment();
		model.addAttribute("commentVO", commentVO);
		*/
		
		return "member/mypage_board"; 
	}
	
	// 내가 작성한 답변
	@RequestMapping("/member/mypage_comment") 
	public String mypage_comment(HttpSession session, RedirectAttributes redirectAttributes, Model model) throws Exception{ 
		
		MemberVO loginVO = (MemberVO) session.getAttribute("login");
		
		// 로그인 필수
		if(loginVO == null) {
			redirectAttributes.addFlashAttribute("msg","로그인이 필요합니다,");
			return "redirect:/member/login";
		}
		
		
		// (loginVO) 받아서!! 세션 id!! 가져감!!
		List<CommentVO> commentVO = (List<CommentVO>)service.ViewMyCommentMember(loginVO);
		
		/*
		 // DB에서 데이터 가져오는지 체크
		for(int i=0;i<commentVO.size();i++) {
			System.out.println(commentVO.get(i).getCo_comments());
		}
		*/

		model.addAttribute("commentVO",commentVO);
		
		return "member/mypage_comment"; 
	}
	
	
	// 마이페이지 수정
	@RequestMapping(value = "/member/ModifyMypage")
	public String ModifyMypage(HttpServletRequest req, MemberVO memberVO, RedirectAttributes redirectAttributes) throws Exception {
		
		//비밀번호 암호화
		String encpass = BCrypt.hashpw(memberVO.getMe_pass(), BCrypt.gensalt()); 
		memberVO.setMe_pass(encpass);											
		
		//암호화된 비밀번호 수정
		service.ModifyMypage(memberVO);
		redirectAttributes.addFlashAttribute("msg", "회원정보 수정 성공!");
		
		// 회원정보 수정 후 자동 로그아웃
		RequestAttributes requestAttribute = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		requestAttribute.setAttribute("logout", null, RequestAttributes.SCOPE_SESSION);
		
		return "redirect:/member/login";
	}
	
	// 회원 탈퇴
	@RequestMapping(value= "/memberDeleteView", method = RequestMethod.GET)
	public String memberDeleteView(HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
		
		// 로그인 필수
		MemberVO loginVO = (MemberVO) session.getAttribute("login");
		
		
		
		if(loginVO == null) {
			redirectAttributes.addFlashAttribute("msg","로그인이 필요합니다,");
			return "redirect:/member/login";
		}
		
		
		return "member/delete";
	}
	
	// 회원 탈퇴 POST
	@RequestMapping(value= "/memberDelete", method = RequestMethod.POST)
	public String memberDelete(MemberVO memberVO, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
		
		
		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
				MemberVO member = (MemberVO) session.getAttribute("login");
				// 세션에 있는 비밀번호
				String sessionPass = member.getMe_pass();
				
				// MemberVO로 들어오는 비밀번호
				String VOPass = memberVO.getMe_pass();

				logger.info("sessionPass :  "  + sessionPass + "  encpass :  " + VOPass);
				
				if (BCrypt.checkpw(VOPass, sessionPass)) { 
					service.deleteMember(memberVO);
					session.invalidate();
					return "redirect:/";
				}
			
			redirectAttributes.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView";
	}
	
	//아이디 중복 체크
	@RequestMapping("/member/checkId.do")
	public ModelAndView checkId(ModelMap model, String me_id) throws Exception {
		MemberVO membervo = new MemberVO();
		membervo.setMe_id(me_id);
		
		int cnt = service.checkId(membervo);
		
		System.out.println("checkId");
		System.out.println("cnt => " + cnt);
		if(cnt>0) {
			model.addAttribute("duplicate", true);
		}else {
			model.addAttribute("duplicate", false);
		}
		
		return new ModelAndView(jsonView);
	}
	
	@RequestMapping("/member/actionLogin.do")
	public String actionLogin(
			@ModelAttribute("memberVO") MemberVO memberVO, 
			RedirectAttributes redirectAttributes) throws Exception{
		MemberVO loginVO = (MemberVO) service.selectMemberView(memberVO, null, null, "selectMemberView");
		
		if(loginVO != null) {
			if (BCrypt.checkpw(memberVO.getMe_pass(), loginVO.getMe_pass()) == true){
				//로그인세션
				HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
				request.getSession().setAttribute("login", loginVO);
				return "redirect:/";
			}else {
				// 비밀번호 불일치
				redirectAttributes.addFlashAttribute("msg", "비밀번호가 맞지 않습니다.");
			} 
		}else {
			// ID 존재하지 않음
			redirectAttributes.addFlashAttribute("msg", "존재하지않는 ID입니다.");
		} 
		
		return "redirect:/";
	}

	
	@RequestMapping("/member/actionLogout.do")
	public String actionLogout() throws Exception{
		RequestAttributes requestAttribute = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		requestAttribute.setAttribute("login", null, RequestAttributes.SCOPE_SESSION);
		
		return "redirect:/member/login";
	}
	
	//로그인 db 체크
	@RequestMapping("/member/actionLoginAsync.do")
	public ModelAndView actionLoginAsync(ModelMap model, HttpServletRequest req,
			HttpServletResponse res, String me_id, String me_pass) throws Exception {
		//System.out.println("Controller - actionLoginAsync");
		MemberVO memberVO = new MemberVO();
		memberVO.setMe_id(me_id);
		memberVO.setMe_pass(me_pass);
		
		MemberVO loginVO = (MemberVO) service.selectMemberView(memberVO, null, null, "selectMemberView");
		//System.out.println("actionLoginAsync => loginVO");
		
		if(loginVO != null) {
			if(BCrypt.checkpw(memberVO.getMe_pass(), loginVO.getMe_pass()) == true) {
				//비밀번호 값 확인
				HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
				request.getSession().setAttribute("login", loginVO);
				model.addAttribute("login", true);
			}else {
				//비밀번호 다름
				model.addAttribute("login", false);
			}
		}else {
			//loginVO에서 값을 가지고 오지 못함
			model.addAttribute("login", false);
		}
		return new ModelAndView(jsonView);
	}
	
}
