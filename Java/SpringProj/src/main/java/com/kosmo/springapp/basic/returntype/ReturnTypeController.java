package com.kosmo.springapp.basic.returntype;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.InternalResourceView;

//컨트롤러 클래스]
@Controller
public class ReturnTypeController {
	//[컨트롤러 메소드]반환타입-ModelAndView : ModelAndView에 뷰정보와 데이타 정보 저장해서 반환
	@RequestMapping("/ReturnType/ModelAndView.do")
	public ModelAndView modelAndView(@RequestParam Map map,Model model) {
		//방법1]ModelAndView객체에 뷰정보만 저장해서 반환
		//데이타 저장-Model에 데이타 저장
		//model.addAllAttributes(map);//파라미터명이 속성명이되서 리퀘스트영역에 저장된다
		//model.addAttribute("message",String.format("[파라미터:%s]",map.get("returnType")));
		//return new ModelAndView("returntype04/ReturnType");
		//방법2]ModelAndView객체에 뷰정보 와 데이타 저장해서 반환-Model이 필요없다
		ModelAndView mav= new ModelAndView();
		//ModelAndView에 데이타를 저장하는 메소드도 있다
		//데이타 저장
		//mav.addAllObjects(map);
		mav.addObject("message",String.format("[파라미터:%s]",map.get("returnType")));
		//뷰정보 저장
		//mav.setView(new InternalResourceView("/WEB-INF/views/returntype04/ReturnType.jsp"));
		mav.setViewName("returntype04/ReturnType");
		return mav;
	}/////////////////
	//[컨트롤러 메소드]반환타입-String : 뷰정보만 반환
	@RequestMapping("/ReturnType/String.do")
	public String string(Map map,@RequestParam String returnType) {
		//데이타 저장]		
		map.put("message",String.format("[파라미터:%s]",returnType));
		map.put("returnType", returnType);
		//뷰 정보 반환
		return "returntype04/ReturnType";
	}/////////////////////
	//[컨트롤러 메소드]반환타입-void : @Controller어노테이션 사용시 페이지가 아닌 데이타를 보낼때
	@RequestMapping("/ReturnType/Void.do")
	public void noreturn(HttpServletResponse resp,@RequestParam String returnType) throws IOException {
		System.out.println("요청이 들어오나");
		/*
		 * -Ajax나 Rest API구현시 주로 사용
		 * -DispatcherServlet에게 모델 및 뷰정보 전달 안함 ViewResolver를 거치지 않음 
		 * -웹브라우저에 바로 출력시 사용 
		 *  즉 Http응답바디에 데이타 출력시 사용
		 */
		resp.setContentType("application/json");
		//웹브라우저에 출력하기 위한 출력 스트림 얻기]
		PrintWriter out= resp.getWriter();
		out.print("[{\"username\":\"KOSMO\",\"password\":\"1234\"},{\"username\":\"CHOI\",\"password\":\"9999\"}]");
		//스트림 닫기
		out.close();		
	}//////////////////
}
