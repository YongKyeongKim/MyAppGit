package com.kosmo.springapp.basic.annotation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RequestMappingController {

	/* @RequestMapping("/요청URL")
	 * -주로 요청을 처리하는 메소드 앞에 단다.
	 * -컨텍스트 루트를 제외한 /로 시작하는 요청URL
	 * -GET방식 및 POST방식 둘다 처리 가능
	*/
	/*
	@RequestMapping("/Annotation/RequestMappingBoth.do")
	public String both(HttpServletRequest req) {
		//데이타 저장]리퀘스트 영역에 직접 저장
		String loginInfo =String.format(
				"[아이디:%s,비번:%s,요청방식:%s]",
				req.getParameter("id"),
				req.getParameter("pwd"),
				req.getMethod()
				);
		req.setAttribute("loginInfo", loginInfo);
		//뷰정보 반환]
		return "annotation06/Annotation";
	}///////////////
	*/
	/* @RequestMapping(value="/요청URL",mehtod=전송방식지정)
	 * -하나만 처리 가능
	 */	
	/*
	@RequestMapping(value = "/Annotation/RequestMappingOne.do",method = RequestMethod.GET)
	public String one(HttpServletRequest req) {
		return both(req);
	}*/
	/*
	 * 여러요청을 하나의 컨트롤러 메소드로 처리하기
	 * 1.value={"요청URL1","요청URL2",...}
	 * 2.@PathVariable 과 요청URL의 바뀌는 부분을 변수처리
	 */
	/*
	//@RequestMapping({"/Annotation/RequestMappingBoth.do","/Annotation/RequestMappingOne.do"})
	@RequestMapping(value={"/Annotation/RequestMappingBoth.do","/Annotation/RequestMappingOne.do"},method= {RequestMethod.GET,RequestMethod.POST})
	public String multi(HttpServletRequest req) {
		//데이타 저장]리퀘스트 영역에 직접 저장
		String loginInfo =String.format(
				"[아이디:%s,비번:%s,요청방식:%s]",
				req.getParameter("id"),
				req.getParameter("pwd"),
				req.getMethod()
				);
		req.setAttribute("loginInfo", loginInfo);
		//뷰정보 반환]
		return "annotation06/Annotation";
	}///////////////
	*/
	@RequestMapping("/Annotation/{path}")
	public String both(@PathVariable String path,@RequestParam Map<String,String> map,Model model) {
		//데이타 저장]
		String loginInfo =String.format(
				"[아이디:%s,비번:%s]",
				map.get("id"),
				map.get("pwd")
				);
		model.addAttribute("loginInfo", loginInfo);
		//뷰정보 반환]
		return "annotation06/Annotation";
	}///////////////
	
	
}
