package com.hustar.value_coding_boot.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod;

import com.hustar.value_coding_boot.service.CourseService;
import com.hustar.value_coding_boot.vo.Course;
import com.hustar.value_coding_boot.vo.MemberVO;

@Controller 
public class HomeController { 

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private CourseService courseService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public String about(Model model, HttpSession session) throws Exception {
		
		MemberVO loginVO = (MemberVO)session.getAttribute("login");
		
		// 로그인 되어 있으면
		if(loginVO != null) {
			String noti_alert_id = loginVO.getMe_id();
			
			List<Course> course = courseService.getAllCourses(noti_alert_id);
			
			model.addAttribute("courses", course);		
		}
		
		return "/index"; 
	}
	
	@RequestMapping(value = "/course_delete", method = RequestMethod.GET)
	public String course_delete(int noti_id) throws Exception {
		logger.info("course_delete");
		
		courseService.deleteCourse(noti_id);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/course_delete_all", method = RequestMethod.GET)
	public String course_delete_all(HttpSession session) throws Exception {
		logger.info("course_delete_all");
		
		MemberVO loginVO = (MemberVO)session.getAttribute("login");
		
		courseService.deleteCourseAll(loginVO.getMe_id());
		
		return "redirect:/";
	}
}
