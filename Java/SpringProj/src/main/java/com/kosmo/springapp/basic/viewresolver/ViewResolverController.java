package com.kosmo.springapp.basic.viewresolver;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

//컨트롤러 클래스]
@Controller
public class ViewResolverController {
	/*
	//컨트롤러 메소드-String타입으로 뷰정보 반환]	
	@RequestMapping("/ViewResolver/ViewResolver.do")
	public String execute(Model model) {
		//데이타 저장]
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		model.addAttribute("message", dateFormat.format(new Date()));
		//접두어(/WEB-INF/views/)와 접미어(.jsp)를 뺀 논리적인 이름만 반환
		//1. .jsp페이지로 forward
		//뷰 정보 반환]
		//return "viewresolver03/ViewResolver";
		//return "viewresolver03/ViewResolver?message=Hello Spring!!!";//404에러
		//2. .do로 forward
		//아래 처럼 뷰정보 반환시 접두어/접미어가 붙어서 404에러 발생
	    // /WEB-INF/views/ViewResolver/NotJSP.do.jsp
		//return "/ViewResolver/Continues.do";
		//※InternalResourceViewResolver를 통한 접두어/접미어에 
		// 영향을 안 받으려면 String으로 반환시 "forward:" 이나
		//"redirect:"를 앞에 붙인다.
		//forward:이 디폴트 이다 즉 포워드방식으로 이동이 기본이다
		//return "forward:/ViewResolver/Continues.do";
		//[----접두어/접미어 영향 받지 않기-주로 .do로 이동시에 적용한다----]
		//[forward 로 이동시]
		//1. .jsp페이지로 forward
		//return "forward:/WEB-INF/views/viewresolver03/ViewResolver.jsp?message=Hello Spring!!!";
		//2. .do로 forward
		//return "forward:/ViewResolver/Continues.do?message=Hi Spring!!!";
		//[redirect로 이동시]
	    //※리다이렉트시  모델객체에 저장된 데이타는 쿼리스트링으로 전달된다
		//1. .jsp페이로 redirect-/WEB-INF밑에 있는 JSP파일을 직접 URL로 요청한거와 같다 그래서 404에러
		//return "redirect:/WEB-INF/views/viewresolver03/ViewResolver.jsp";
		//2. .do로 redirect
		return "redirect:/ViewResolver/Continues.do";
	}///////////////*/
	//컨트롤러 메소드-ModelAndView타입으로 뷰정보 반환]	
	@RequestMapping("/ViewResolver/ViewResolver.do")
	public ModelAndView execute() {
		
		ModelAndView mav = new ModelAndView();
		//데이타 저장]
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		mav.addObject("message", dateFormat.format(new Date()));		
		//뷰 정보 설정
		//RedirectView view = new RedirectView("/WEB-INF/views/viewresolver03/ViewResolver.jsp");
		//view.setContextRelative(true);
		//mav.setView(view);//404에러
		RedirectView view = new RedirectView("/ViewResolver/Continues.do");
		view.setContextRelative(true);
		mav.setView(view);
		
		return mav;
	}///
	@RequestMapping("/ViewResolver/Continues.do")
	public String continues() {
		//ViewResolver.jsp로 포워드
		return "viewresolver03/ViewResolver";
	}
}
