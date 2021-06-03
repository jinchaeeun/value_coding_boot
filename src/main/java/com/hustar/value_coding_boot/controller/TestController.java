package com.hustar.value_coding_boot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hustar.value_coding_boot.dto.TestDto;
import com.hustar.value_coding_boot.service.TestServiceImpl;


//클라리언트가 GET방식의 /test/mybatis 주소로 요청하면 Controller 통해 Service가 호출, 서비스는 쿼리와 연결된 Mapper 호출. 쿼리 실행결과는 DTO에 담겨서 변환되며, JSON형태로 사용자에게 전달.
@RequestMapping(path = "/board")
@Controller
public class TestController {
	@Autowired
	private TestServiceImpl testServiceImpl;
	
	@GetMapping("/list")
	public String selectTest(Model model) throws Exception {
		List<TestDto> test = testServiceImpl.selectTest();
		
		model.addAttribute("test", test);
		model.addAttribute("name", "김나");
		
		return "test/mybatis";
	}
	
	@GetMapping("/detail")
	String ShowDetail(Model model, int id) throws Exception {	
		TestDto testDetail = testServiceImpl.getTestDetailById(id);
		model.addAttribute("testDetail", testDetail);
		
		System.out.println("testDetail" + testDetail);

		return "test/detail";
	}
	
	@GetMapping("/doDelete")
	@ResponseBody
	String doDelete(int id) throws Exception {
		testServiceImpl.deleteTest(id);
		
		//location.href로 이동하면 user가 backspace로 뒤로가기 가능함(주의)
		return String.format("<script> alert('%d번 글을 삭제하였습니다.'); location.replace('/board/list') </script>", id);
	}

	
}
