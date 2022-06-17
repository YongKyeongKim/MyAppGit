package com.kosmo.springapp.basic.injection;

import java.lang.annotation.Annotation;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
//import org.springframework.web.servlet.mvc.Controller;

//[빈 설정을 통한 주입]
//1. @Controller/@RequestMapping어노테이션 제거
//2. Controller 계열 인터페이스나 클래스 상속(import org.springframework.web.servlet.mvc.Controller;)
//3. 빈 설정파일에 BeanNameUrlHandelerMapping으로 요청을 매핑
//   <beans:bean name="/Injection/Constructor.do" class="com.kosmo.springapp.basic.injection.ConstructorController">
/*
public class ConstructorController implements Controller {	
	
	private Person personType,personIndex;	
	
	public ConstructorController(Person personType, Person personIndex) {
		this.personType = personType;
		this.personIndex = personIndex;
	}
	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return new ModelAndView("injection05/Injection","personInfo",personType+"<hr/>"+personIndex);
	}	
}/////////////
*/

//[@Autowired어노테이션으로 통한 주입]
//1.빈 설정파일에 빈 등록을 통한 생성자 인잭션 불필요.즉 아래 설정이 필요 없다
//<beans:bean name="/Injection/Constructor.do" class="com.kosmo.springapp.basic.injection.ConstructorController">
//<beans:constructor-arg index="0" ref="personType"/>
//<beans:constructor-arg index="1" ref="personIndex"/>
//</beans:bean>
//2.단,주입받을 빈 id속성과 대상클래스(ConstructorController)의 변수(생성자의 인자)명이 일치해야한다
//3.id속성으로도 구분이 안되면 Qualifier로 구분해서 주입 받는다
@Controller
public class ConstructorController {	
	
	private Person personType,personIndex;
	
	//생성자 인잭션-@Autowired 생략가능
	@Autowired
	public ConstructorController(@Qualifier("person1") Person personType,@Qualifier("person2") Person personIndex) {
		this.personType = personType;
		this.personIndex = personIndex;
	}
	
	
	@RequestMapping("/Injection/Constructor.do")
	public String execute(Map map) {
		//데이타 저장]
		map.put("personInfo", personType+"<hr/>"+personIndex);
		//뷰정보 반환
		return "injection05/Injection";
	}
	
}

