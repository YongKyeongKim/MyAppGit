package com.kosmo.springapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
[일반 자바클래스 형태 즉 POJO(Plain Old Java Object)]

컴파일러에게 "아래 클래스는 사용자 요청을 처리하는 클래스야" 라고 알려주는 역할]
*/
//컨트롤러 클래스

@Controller
public class IndexController {
	
	//컨트롤러 메소드]
	@RequestMapping("/handlerMapping.do")
	public String handlerMapping() {
		//뷰정보 반환]
		return "handlermapping01/HandlerMapping";
	}///////////handlerMapping
	
	@RequestMapping("/controller.do")
	public String controller() {
		//뷰정보 반환]
		return "controller02/Controller";
	}///////////handlerMapping
	
	@RequestMapping("/viewResolver.do")
	public String viewResolver() {
		//뷰정보 반환]
		return "viewresolver03/ViewResolver";
	}///////////handlerMapping
	
	@RequestMapping("/returntype.do")
	public String returnType() {
		//뷰정보 반환]
		return "returntype04/ReturnType";
	}///////////handlerMapping
	
	@RequestMapping("/injection.do")
	public String injection() {
		//뷰정보 반환]
		return "injection05/Injection";
	}///////////handlerMapping
	
	@RequestMapping("/annotation.do")
	public String annotation() {
		//뷰정보 반환]
		return "annotation06/Annotation";
	}///////////handlerMapping
	
	@RequestMapping("/database.do")
	public String database() {
		//뷰정보 반환]
		return "database07/Database";
	}///////////handlerMapping
	
	@RequestMapping("/resource.do")
	public String resource() {
		//뷰정보 반환]
		return "resource08/Resource";
	}///////////handlerMapping
	
	@RequestMapping("/validation.do")
	public String validation() {
		//뷰정보 반환]
		return "validation09/Validation";
	}///////////handlerMapping
	
	@RequestMapping("/dynamicsql.do")
	public String dynamicSql() {
		//뷰정보 반환]
		return "dynamicsql11/DynamicSql";
	}///////////handlerMapping
	
	@RequestMapping("/ajax.do")
	public String ajax() {
		//뷰정보 반환]
		return "ajax12/Ajax";
	}///////////handlerMapping
	
	@RequestMapping("/exception.do")
	public String exception() {
		//뷰정보 반환]
		return "exception13/Exception";
	}///////////handlerMapping
	@RequestMapping("/fileupdown.do")
	public String fileupdown() {
		//뷰정보 반환]
		return "fileupdown14/FileUpDown";
	}///////////handlerMapping
	
	@RequestMapping("/aop.do")
	public String aop() {
		//뷰정보 반환]
		return "aop15/Aop";
	}///////////handlerMapping
	
	@RequestMapping("/websocket.do")
	public String websocket() {
		//뷰정보 반환]
		return "websocket16/Websocket";
	}///////////handlerMapping
	/*
	[스프링 타일즈 적용시]- 컨트롤러 메소드에서 문자열로 리턴시
	.do로 포워딩 혹은 리다이렉트 : 앞에 "forward:" 혹은  "redirect:"를 붙인다
	.jsp(UI가 필요한 jsp)로 포워딩 : .kosmo를 붙인다
	.jsp(UI가 필요없는 jsp)로 포워딩: "forward:" 혹은  "redirect:"를 붙일때
	                           /WEB-INF/~로시작하는 전체 경로 그리고 .jsp를 붙인다 
	 
	 */
	@RequestMapping("/tiles.do")
	public String tiles() {
		//뷰정보 반환]
		return "tiles17/Tiles.kosmo";
	}///////////handlerMapping
	
}
