package com.kosmo.springapp.basic.injection;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SetterController {
	/*현재 클래스가 Person객체 필요]	- new하지 않고 세터를 통해서 주입 받자*/
	
	//속성에 붙이기(세터를 만들 필요 없다)
	//속성의 변수명(멤버변수명)과 빈 설정파일의 주입할려고하는 객체의 id속성이 일치시 name속성 생략가능
	@Resource
	private Person personType;
	@Resource
	private Person personIndex;
	
	//세터 인젝션-주입받은 값을 가공해서 속성에 넣을때
	//1.@Resource(name="id명") 단,세터의 매개변수명과 빈 설정파일의 주입할려고하는 객체의 id속성이 일치시 생략가능
	//  @Resource해도 된다
	//2.타입으로 찾아서 주입하는데 여러개 있는 경우 에러.하나 있으면 같은 객체가 주입된다
	//3.Qualifier이름으로 찾아서 주입
	/*
	@Resource
	@Qualifier("person1")
	public void setPersonType(Person personType) {
		//나이를 가공하자
		personType.setAge("40");
		this.personType = personType;
	}
	@Resource	
	@Qualifier("person2")
	public void setPersonIndex(Person personIndex) {
		this.personIndex = personIndex;
	}*/
	
	//컨트롤러 메소드]
	@RequestMapping("/Injection/Setter.do")
	public String execute(Map map) {
		//데이타 저장]
		map.put("personInfo", personType+"<hr/>"+personIndex);
		//뷰정보 반환
		return "injection05/Injection";
	}

	
}
