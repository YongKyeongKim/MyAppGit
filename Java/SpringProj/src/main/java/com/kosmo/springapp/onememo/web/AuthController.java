package com.kosmo.springapp.onememo.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kosmo.springapp.onememo.service.impl.OneMemoServiceImpl;


//@SessionAttributes({"id"})  //스프링씨큐리티 사용시 주석
@Controller
@RequestMapping("/onememo/auth/")
public class AuthController {
	
	//※스프링씨큐리티 적용시 서비스 주입 /로그인처리 /로그아웃처리를  주석
	
	//서비스 주입]
	//@Resource(name = "memoService")
	//private OneMemoServiceImpl memoServcie;
	
	//로그인 폼으로 이동
	@RequestMapping("Login.do")
	public String login() {		
	
		return "onememo10/member/Login.kosmo";
	}
	/*
	//로그인 처리]
	@RequestMapping("LoginProcess.do")
	public String process(@RequestParam Map map,Model model,SessionStatus status) {
		//서비스 호출]
		boolean flag=memoServcie.isLogin(map);
		
		model.addAttribute("id", map.get("id"));
		if(!flag) {
			status.setComplete();
			model.addAttribute("NotMember", "아이디와 비번 불일치");
		}
		//뷰정보 번환]
		return "onememo10/member/Login.kosmo";
	}//////////////
	//로그아웃 처리]
	@RequestMapping("Logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		//뷰정보 번환]
		return "onememo10/member/Login.kosmo";
	}///////////
    */
}
