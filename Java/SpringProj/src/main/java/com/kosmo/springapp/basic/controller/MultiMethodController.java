package com.kosmo.springapp.basic.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MultiMethodController {

	@RequestMapping("/Controller/MultiMethod/List.do")
	public String list(ModelMap model) {
		//데이터 저장]
		model.addAttribute("message", "It requests LIST");
		//디스패처 서블릿에게 뷰정보 반환]
		return "controller02/Controller";
	}//////list
	@RequestMapping("/Controller/MultiMethod/Edit.do")
	public String edit(Model model) {
		//데이터 저장]
		model.addAttribute("message", "It requests EDIT");
		//디스패처 서블릿에게 뷰정보 반환]
		return "controller02/Controller";
	}//////list
	@RequestMapping("/Controller/MultiMethod/Delete.do")
	public String delete(Map map) {
		//데이터 저장]
		map.put("message", "It requests DELETE");
		//디스패처 서블릿에게 뷰정보 반환]
		return "controller02/Controller";
	}//////list
	@RequestMapping("/Controller/MultiMethod/View.do")
	public String view(Model model) {
		//데이터 저장]
		model.addAttribute("message", "It requests VIEW");
		//디스패처 서블릿에게 뷰정보 반환]
		return "controller02/Controller";
	}//////list
}
