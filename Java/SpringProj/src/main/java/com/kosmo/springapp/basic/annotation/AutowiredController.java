package com.kosmo.springapp.basic.annotation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AutowiredController {

	/*
	 * 테스트 시나리오
	 * 1. Type기반
	 * 	1-1.빈 설정파일에 Command객체 하나 등록(id속성/qualifier태그 생략)
	 * 		@Autowired
			private Command fCommand;
			@Autowired
			private Command sCommand;
			
			fCommand와 sCommand는 같은 객체가 주입된다
	    1-2.빈 설정파일에서 Command객체 등록한 태그 주석처리
			500에러
	    1-3.@Autowired(required = false) 
	       주입이 필수가 아니기때문에 객체가 없으면 주입이 안됨으로 
	       fCommand와 sCommand는 null
	       
	    1-4.먼저 required = false지운후
	       빈 설정파일에 Command객체 2개 등록(id속성/qualifier태그 생략)
	       500에러(객체가 2개 생성됨으로 타입이 같아서)
	       
	 2. id 기반
	    빈 설정파일에서 id속성은 주입대상 클래스의 멤버필드명(변수명)과 일치시켜라 
	 3. Qualifier기반
	    3-1. 빈 설정파일에서 id속성 제거
	    3-2. qualifier태그 추가 <beans:qualifier value="식별자1"/>
	    3-3. 필드에 @Qualifier("식별자1")
	 * 
	 * ※ 타입-> id->Qualifier
	 */
	//[필드에 부착]
	/*
	@Autowired
	@Qualifier("fCommand")
	private Command fCommand; 
	@Autowired
	@Qualifier("sCommand")
	private Command sCommand; */
	
	//[세터에 부착] -추가적인 로직이 필요할때
	//※이때는 빈 설정파일의 id속성값이 세터의 매개변수명과 일치시켜야 한다	
	private Command fCommand; 
	private Command sCommand;
	/*
	@Autowired
	public void setfCommand(Command fCommand) {
		this.fCommand = fCommand;
	}
	@Autowired
	public void setsCommand(Command sCommand) {
		this.sCommand = sCommand;
	}*/
	//[생성자에 부착]-단,@Qualifier부착 불가
    //※이때는 빈 설정파일의 id속성값이 생성자의 매개변수명과 일치시켜야 한다	
	@Autowired	
	public AutowiredController(Command fCommand, Command sCommand) {		
		this.fCommand = fCommand;
		this.sCommand = sCommand;
	}
	
	@RequestMapping("/Annotaiton/Autowired.do")
	public String execute(Model model){
		//데이타 저장]
		model.addAttribute("message",String.format("fCommand:%s,sCommand:%s",fCommand,sCommand));
		//뷰정보 반환]
		return "annotation06/Annotation";
	}//////////
	
}
