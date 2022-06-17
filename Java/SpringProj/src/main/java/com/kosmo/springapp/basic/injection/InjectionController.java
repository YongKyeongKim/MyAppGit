package com.kosmo.springapp.basic.injection;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InjectionController {

	@Resource
	private Person personArgs;
	@Resource
	private Person personDefault;
	@RequestMapping("/Injection/Injection.do")
	public String execute(Map map,@RequestParam Map paramMap) {
		//데이타 저장]
		//사용자 입력값으로 personDefault를 설정
		personDefault.setAddr(paramMap.get("addr").toString());
		personDefault.setAge(paramMap.get("age").toString());
		personDefault.setName(paramMap.get("name").toString());
		map.put("personInfo", personArgs+"<hr/>"+personDefault);
		//뷰정보 반환
		return "injection05/Injection";
	}
}
