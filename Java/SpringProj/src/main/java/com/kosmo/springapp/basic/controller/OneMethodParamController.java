package com.kosmo.springapp.basic.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
//컨트롤러 클래스]
@Controller
public class OneMethodParamController {
	//컨트롤러 메소드]
	@RequestMapping({
		"/Controller/OneClassParam/List.do",
		"/Controller/OneClassParam/Edit.do",
		"/Controller/OneClassParam/Delete.do",
		"/Controller/OneClassParam/View.do"})
	public String noparam(@RequestParam String crud,Map map) {		
		//데이타 저장]
		switch(crud.toUpperCase()) {
			case "READ-LIST":map.put("message", "목록요청입니다");break;
			case "UPDATE":map.put("message", "수정요청입니다");break;
			case "DELETE":map.put("message", "삭제요청입니다");break;
			default:map.put("message", "상세보기 요청입니다");
		}
		//디스패처 서블릿에게 뷰정보 반환]
		return "controller02/Controller";
	}////////////////////
}
