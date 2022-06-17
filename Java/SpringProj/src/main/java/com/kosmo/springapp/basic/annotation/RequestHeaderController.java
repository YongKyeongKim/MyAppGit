package com.kosmo.springapp.basic.annotation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RequestHeaderController {
	
	@RequestMapping("/Annotation/RequestHeader.do")
	public String exec(Model model,@RequestHeader(defaultValue = "요청 헤더명이 존재하지 않아요",required=false,value="user-agent") String userAgent) {
		//데이타 저장]
		model.addAttribute("referer", userAgent);
		//뷰정보 반환]
		return "annotation06/Annotation";
	}
}
