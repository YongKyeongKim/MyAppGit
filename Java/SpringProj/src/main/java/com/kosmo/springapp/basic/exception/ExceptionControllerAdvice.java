package com.kosmo.springapp.basic.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/*
 * @ControllerAdvice 를 통해 모든 컨트롤러에서 발생하는 예외 처리
 * @ExceptionHandler 를 통해 발생하는 예외 종류에 따른 메소드 정의
 */
//개발시는 아래 주석처리
//@ControllerAdvice
public class ExceptionControllerAdvice {
	
	@ExceptionHandler(NumberFormatException.class)
	public String numberFormat(Model model,Exception e) {
		model.addAttribute("errors","숫자만 입력..."+e.getMessage());
		//뷰정보 반환]
		return "exception13/Error";
	}
	@ExceptionHandler(NullPointerException.class)
	public String nullPointer(Model model,Exception e) {
		model.addAttribute("errors","널입니다..."+e.getMessage());
		//뷰정보 반환]
		return "exception13/Error";
	}
	
}
