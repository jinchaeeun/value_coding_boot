package com.hustar.value_coding_boot.controller;

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
import com.hustar.value_coding_boot.vo.MemberVO;

import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller 
@RequestMapping("/member/**")
public class MemberController { 
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	MemberService service;
	
	@Resource(name="jsonView")
	MappingJackson2JsonView jsonView;
	
	// 회원가입 메시지
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
	
	//회원가입 멤버 등록
	@RequestMapping(value = "/member/joinInsert")
	public String JoinInsert(
			@ModelAttribute("memberVO") MemberVO vo, 
			RedirectAttributes redirectAttributes) throws Exception {
		logger.info("joinInsert");
		
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
	public String member_mypage() { 
		
		return "member/mypage"; 
	} 
	
	@GetMapping("mypage01") 
	public String member_mypage01() { 
		
		return "member/mypage01"; 
	}
	
	@GetMapping("mypage02") 
	public String member_mypage02() { 
		
		return "member/mypage02"; 
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
	
	//소셜 로그인 등록
	//ajax json 쓰려면 ModelAndView
	@RequestMapping(value = "/member/sosialJoinInsert.do")
	public ModelAndView sosialJoinInsert(ModelMap model,
			@ModelAttribute("memberVO") MemberVO vo, HttpServletRequest req,
			HttpServletResponse res, 
			RedirectAttributes redirectAttributes, String sns_id, String sns_nick, int sns_type) throws Exception {
		
		System.out.println("소셜 아이디: " + sns_id);
		
		vo.setMe_id(sns_id);
		vo.setMe_nickName(sns_nick);
		vo.setMe_singupcode(sns_type);
		
		int cnt = service.checkId(vo);
		System.out.println("cnt = " + cnt);
		
		//소셜 로그인 가입코드 (1: 일반, 2: 카카오, 3: 네이버, 4: 구글)
		String sosial ="";
		if(sns_type == 2) sosial ="kakao_"; 
		else if(sns_type == 3) sosial ="naver_";
		else if(sns_type == 4) sosial ="google_";
		
		String randomText="";
		for(int i=0; i<8; i++) {
			int rndVal = (int)(Math.random()*62);	//난수 생성
			if(rndVal < 10) {						//10보다 작은 경우
				randomText += rndVal;				//숫자 그대로 저장 (0~9)
			}else if(rndVal > 35) {					//소문자인 경우 (36~62)
				randomText += (char)(rndVal + 61);	//문자로 반환해 저장
			}else {									//그외 대문자 (10~35)
				randomText += (char)(rndVal + 55);	//문자로 반환해 저장
			}
		}
		System.out.println("랜덤값은 + " + randomText);
		String rnd_sns_nick = sosial + randomText + sns_nick;

		System.out.println("변경된 닉네임 값은 + " + rnd_sns_nick);
		
		//가입코드 같으면 진행, 아니면 else로 실패 출력

		if(cnt>0) {	//이미 가입한 아이디므로 바로 로그인
			//redirectAttributes.addFlashAttribute("msg", "소셜 로그인 성공");
			//이미 가입되어있을 때 가입코드 확인한다.
			int signUpCode = service.checkCode(vo);
			System.out.println("checkCode = " + signUpCode);
			if(sns_type==signUpCode) {
				//가입 성공
				model.addAttribute("login", true);
			}else {
				//가입 불가
				model.addAttribute("login", false);
			}
		}else {
			//데이터 삽입 후 로그인 처리됨
			vo.setMe_nickName(rnd_sns_nick);
			service.sosialJoin(vo);
			//redirectAttributes.addFlashAttribute("msg", "소셜 회원가입 성공");
			model.addAttribute("login", true);
		}
		/*
		else {
		 
			System.out.println("사용자가 이 타입으로 가입하지 않았음");
			//redirectAttributes.addFlashAttribute("msg", "해당 버튼으로 가입하지 않은 계정입니다. 다시 시도하여 주십시오.");	
		}
		*/
		
		//로그인 체크
		MemberVO loginVO = (MemberVO) service.selectMemberView(vo, null, null, "selectMemberView");
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().setAttribute("login", loginVO);
		System.out.println("login 세션 =>" +loginVO);
		
		return new ModelAndView(jsonView);
	}
	
	// -----------
	@RequestMapping(value = "/member/nCallback.do")
	public String nCallback() throws Exception {	
		return "/member/nCallback";
	}
}
