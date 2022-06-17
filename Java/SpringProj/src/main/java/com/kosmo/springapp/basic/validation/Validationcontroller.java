package com.kosmo.springapp.basic.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

//1.ValidationConfig클래스 생성후 또는 빈 설정파일에 FormValidator빈을 스프링 컨테이너에 등록
//2.Validationcontroller에서 FormValidator를 주입 받는다
//여기까지하면 결과페이지로 이동은 안하다.단 에러메시지가 없다
//에러메시를 출력하려면 다음 단계를 해야한다
//3.ResourceBundleMessageSource를 빈으로 등록
//  id값은 내부적으로 프레임워크가 messageSource으로 사용함으로 반드시 messageSource로 설정해야한다
//4.JSP페이지에서 taglib 등록
//5.에러 메시지 표시하기 위해서 <접두어:errors path="커멘드객체명.속성명"/>단,커맨드 객체명은 소문자로 시작
// 예]<form:errors path="formCommand.name"/> 

@Controller
public class Validationcontroller {
	
	//방법1]스프링 API사용하지 않고 유효성 검증하기
	/*
	@RequestMapping("/Validation/Validation.do")
	public String exec(FormCommand cmd,Model model) {		
		//※${param.inter}로 출력시 선택한 처음것만 출력됨으로
		model.addAttribute("inter",cmd.getInter());
		if(!validate(cmd,model)){
			//뷰정보 반환]
			return "validation09/Validation";
		}
		//뷰정보 반환]
		return "validation09/ValidationResult";
	}////////////////

	private boolean validate(FormCommand cmd, Model model) {
		if(cmd.getName().trim().length()==0) {
			model.addAttribute("nameError","이름을 입력하세요");
			return false;
		}
		if(cmd.getYears().trim().equals("")) {
			model.addAttribute("yearsError","나이를 입력하세요");
			return false;
		}
		else {
			try {
				Integer.parseInt(cmd.getYears().trim());
			}
			catch(Exception e) {
				model.addAttribute("yearsError","나이는 숫자만...");
				return false;
			}
		}
		if(cmd.getGender()==null) {
			model.addAttribute("genderError","성별을 선택하세요");
			return false;
		}
		if(cmd.getInter()==null) {
			model.addAttribute("interError","관심사항을 선택하세요");
			return false;
		}
		else {
			if(cmd.getInter().length < 2) {
				model.addAttribute("interError","관심사항은 2개 이상을 선택하세요");
				return false;
			}			
		}
		if(cmd.getGrade().length()==0) {
			model.addAttribute("gradeError","학력을 선택하세요");
			return false;
		}		
		return true;
	}///////////////////////
	*/
	//방법2]스프링 API사용
	@Autowired
	private FormValidator validator;
	
	@RequestMapping("/Validation/Validation.do")
	//매개변수 순서 : ※FormCommand다음에 BindingResult순으로
	public String exec(FormCommand cmd,BindingResult errors, Model model) {	
		
		model.addAttribute("inter",cmd.getInter());		
		System.out.println("validator:"+validator);
		//validate()메소드 첫번째 매개변수에 유효성 검증 해달라고 커맨드 객체 넣어주고 
		//두번째 매개변수에는 에러정보를 담아 달라고 Errors타입 전달
		validator.validate(cmd, errors);
		/*
		  FormValidator에서 한번이라도  rejectValue()를 한다면
		  BindingResult타입의 hasErrors()메소드는 true반환
		  */
		
		if(errors.hasErrors()) {
			//뷰정보 반환]
			return "validation09/Validation";
		}
		//뷰정보 반환]
		return "validation09/ValidationResult";
	}//////////////
}
