package com.hustar.value_coding_boot.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod;

import com.hustar.value_coding_boot.service.CourseService;
import com.hustar.value_coding_boot.vo.Course;

@Controller 
public class HomeController { 
	
	@Inject
	CourseService courseService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public String about(Model model) throws Exception { 
		System.out.println("home controller start"); 
		List<Course> course = courseService.getAllCouses();
		
		model.addAttribute("courses", course);		
		
		return "/index"; 
	}
}
