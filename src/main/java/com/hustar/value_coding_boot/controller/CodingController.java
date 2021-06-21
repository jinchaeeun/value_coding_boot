package com.hustar.value_coding_boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller 
public class CodingController {
	@RequestMapping(value = "/coding/codingTest", method = RequestMethod.GET) 
	public String coding() throws Exception  { 
		System.out.println("coding controller start"); 
		return "coding/codingTest"; 
	} 
}
