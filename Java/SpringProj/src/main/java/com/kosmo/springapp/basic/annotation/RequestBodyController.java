package com.kosmo.springapp.basic.annotation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/*
@RestController :주로 데이타만 보낼때.@Controller + @ResponseBody와 같다
@Controller : 주로 페이지를 보낼때

@RequestBody : JSON형식 데이타 받을 때 사용 .스프링 부트는 내장되어 있다(Jackson라이브러리)
			   스프링 메이븐(레거시)는 내장되어 있지 않다
Jackson라이브러리 : 자바 객체(DTO계열)를 JSON형식(자스 객체)으로
                  JSON형식(자스 객체)을 자바객체로 변환시켜주는 라이브러리
*/
@Controller
public class RequestBodyController {
	 /*
	  ※Form데이타를 받을때는 @RequestParam 혹은 커맨드 객체
	    Form데이타를 받을때  @RequestBody 커맨드객체 을 사용시는 415에러:Content type 'application/x-www-form-urlencoded;charset=UTF-8' not supported)
	    JSON데이타를 받을때는 무조건 @RequestBody 사용.
	 */
	//[JACKSON 미 설치시]
	//폼 데이타 받을때
	
	/*
	@RequestMapping("/Annotation/RequestBody.do")
	@ResponseBody //페이지 전송이 아닌 데이타 전송
	public String exec(LoginCommand cmd) {		
		System.out.println(String.format("{\"id\":\"%s\",\"pwd\":\"%s\"}",cmd.getId(),cmd.getPwd()));
		return String.format("{\"id\":\"%s\",\"pwd\":\"%s\"}",cmd.getId(),cmd.getPwd());				
	}
	@RequestMapping("/Annotation/RequestBody.do")
	@ResponseBody //페이지 전송이 아닌 데이타 전송
	public String exec(@RequestParam String id,@RequestParam String pwd) {		
		System.out.println(String.format("{\"id\":\"%s\",\"pwd\":\"%s\"}",id,pwd));
		return String.format("{\"id\":\"%s\",\"pwd\":\"%s\"}",id,pwd);				
	}*/
	/*
	@RequestMapping("/Annotation/RequestBody.do")
	@ResponseBody
	public String exec(@RequestBody String json) {//JSON데이타나 폼데이타 받을때
		//{"id":"kosmo","pwd":"123456789"}는 문자열. 여기서 id값을 추출하려면 문자열 파싱
		System.out.println(json);
		return json;
	}
	//커맨드 객체 나 맵으로 받으면 데이타 추출이 쉽다
	public String exec(@RequestBody LoginCommand cmd) {	//JSON데이타나 폼데이타  모두 415		
		return "";
	}*/
	//[JACKSON 설치시]
	@RequestMapping("/Annotation/RequestBody.do")
	@ResponseBody
	public LoginCommand exec(@RequestBody LoginCommand cmd) {//Jackson:JSON->자바타입(LoginCommand)
		System.out.println("아이디:"+cmd.getId());
		System.out.println("비번:"+cmd.getPwd());
		
		return cmd;//Jackson:자바타입(LoginCommand)->JSON으로 변환
	}
	
}
