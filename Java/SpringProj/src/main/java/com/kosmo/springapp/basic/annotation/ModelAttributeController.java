package com.kosmo.springapp.basic.annotation;

import java.util.Arrays;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ModelAttributeController {
	
	/*방법1]
	맵으로 받기:커맨드 객체(DTO계열 클래스) 생성 불필요
             단,체크박스 처럼 하나의 파라미터명(키값이 됨)으로 여러값이 넘어올때는
  		     Map으로 받기때문에 하나만 받을 수 있다.*/
	/*
	@RequestMapping("/Annotation/ModelAttribute.do")
	public String map(@RequestParam Map map,@RequestParam String[] inter,Model model) {
		//데이타 저장]
		map.put("inter", Arrays.toString(inter));
		model.addAllAttributes(map);
		//뷰정보 반환]
		return "annotation06/ModelAttribute";
	}///////////*/
	/*
	 방법2]커맨드객체로 받기 : @ModelAttribute 사용(생략가능)
	 * 파라미터가 많은 경우 서블릿 API(HttpServletRequest)보다는
	 * 커맨드객체 혹은 맵으로 받는게 유리
	 * -단, 커맨드 객체(DTO계열)의 속성명과 파라미터명을 일치시켜야 한다.
	 * 
	 * 예]
	 * @ModelAttribute 커맨드객체타입 매개변수명
	 * 
	 * ※@SessionAttribute와 함께 세션처리(인증)에서 주로 사용
	 */
	@RequestMapping("/Annotation/ModelAttribute.do")
	public String map(Command cmd,Model model) {
		System.out.println("커맨드객체(cmd):"+cmd);
		//데이타 저장]
		System.out.println("관심사항:"+cmd.getInter());
		model.addAttribute("cmd", cmd);
		//뷰정보 반환]
		return "annotation06/ModelAttribute";
	}///////////
}
