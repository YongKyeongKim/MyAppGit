package com.kosmo.springapp.basic.exception;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

@Controller
public class ExceptionController {
	
	/*방법1]스프링 API 미 사용.try~catch절로 예외처리
	※단,파일 업로드시 용량초과는 경우, 
	@ModelAttribute(value="속성명") 어노테이션으로
		세션영역에 저장된 속성을 읽어올때 저장된 속성이 없는 경우,
	@RequestParam int years일때 문자열을 입력하는 경우등
	try~catch절로 처리가 안됨으로 반드시 어노테이션으로 처리
    */
	/*
	@RequestMapping("/Exception/Exception.do")
	public String exec(@RequestParam String years,Model model) {
		//int가 아닌 String으로 받으면 try~catch가능
		try {
			model.addAttribute("message", String.format("[당신의 10년후 나이는 %s살]",Integer.parseInt(years)+10));
		}
		catch(Exception e) {
			model.addAttribute("message","나이는 숫자만...");
		}
		//뷰정보 반환]
		return "exception13/Exception";
	}*/
	
	//방법2]@ExceptionHandler 사용-예외처리하려는 모든 컨트롤러마다 작성해야함 
	//@ExceptionHandler({ Exception1.class, Exception2.class,...}) 
	//@ExceptionHandler(NumberFormatException.class)
	
	@ExceptionHandler({Exception.class})
	public String error(Model model,Exception e) {
	    System.out.println("예외 클래스명:"+e.getClass().getName());
		if(e instanceof MethodArgumentTypeMismatchException)
			model.addAttribute("message","Please input Number for years");
		else if(e instanceof NullPointerException)
			model.addAttribute("message","널입니다...");
		//뷰정보 반환]
		return "exception13/Exception";
	}
	@RequestMapping("/Exception/Exception.do")
	public String exec(@RequestParam int years,Model model) {		
		//NullPointerException 발생 테스트용 코드
		String nullString=null;
		System.out.println(nullString.length());
		model.addAttribute("message", String.format("[당신의 10년후 나이는 %s살]",years+10));
		
		//뷰정보 반환]
		return "exception13/Exception";
	}
	
	//방법3]모든 컨트롤러에서 발생하는 예외를 처리(개발완료후)-위 error메소드 주석후 테스트
	//@ControllerAdvice 를 통해 모든 컨트롤러에서 발생하는 예외 처리 가능
	/*
	@RequestMapping("/Exception/Exception.do")
	public String exec(@RequestParam int years,Model model) {
		//NullPointerException 발생 테스트용 코드
		//String nullString=null;
		//System.out.println(nullString.length());
		model.addAttribute("message", String.format("[당신의 10년후 나이는 %s살]",years+10));
	    //뷰정보 반환]
		return "exception13/Exception";
	}*/
	
}
