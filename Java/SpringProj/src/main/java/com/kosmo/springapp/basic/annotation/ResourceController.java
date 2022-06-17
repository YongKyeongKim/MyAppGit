package com.kosmo.springapp.basic.annotation;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ResourceController {
	//※id-> 타입->Qualifier 
	//필드와 세터에만 붙일 수 있다
	//반드시 IOC가 되어 빈이 생성되어 있어야 한다.그렇지 않으면 무조건 에러(required속성이 없다)
	//@Resource만 설정시에는 반드시 id속성과 필드명이 일치해야한다
	//id속성과 필드명이 불일치하더라도 name속성으로 바인딩해서 주입 가능
	//[필드에 부착]
	//name속성에 빈 설정파일에서 등록한 빈의 id속성값 설정
	@Resource(name="fCommand")
	private Command fCmd;
	@Resource(name="sCommand")
	private Command sCmd;	
	
	@RequestMapping("/Annotaiton/Resource.do")
	public String execute(Model model ) {
		//데이타 저장]
		model.addAttribute("message",String.format("fCmd:%s,sCmd:%s",fCmd,sCmd));
		//뷰정보 반환]
		return "annotation06/Annotation";
	}
}
