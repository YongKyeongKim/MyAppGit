package com.kosmo.springapp.basic.dynamicsql;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/Mybatis")
public class DynamicSqlController {
	
	@Autowired
	private DynamicSqlDAO dao;
	
	@RequestMapping("/If1.do")
	public String if1(@RequestParam Map map,Model model) {
		
		List list= dao.if1(map);
		
		model.addAttribute("message", "검색된 글 총수:"+list.size());
		//뷰정보 반환]
		return "dynamicsql11/DynamicSql";
	}/////////

	
	@RequestMapping("/If2.do")
	public String if2(@RequestParam Map map,Model model) {		
		List list= dao.if2(map);		
		model.addAttribute("message", "검색된 글 총수:"+list.size());
		//뷰정보 반환]
		return "dynamicsql11/DynamicSql";
	}/////////
	
	@RequestMapping("/choose.do")
	public String choose(@RequestParam Map map,Model model) {		
		List list= dao.choose(map);		
		model.addAttribute("message", "검색된 글 총수:"+list.size());
		//뷰정보 반환]
		return "dynamicsql11/DynamicSql";
	}/////////
	//※where절 동적으로 추가시 <where>태그 권장
	@RequestMapping("/where.do")
	public String where(@RequestParam Map map,Model model) {		
		List list= dao.where(map);		
		model.addAttribute("message", "검색된 글 총수:"+list.size());
		//뷰정보 반환]
		return "dynamicsql11/DynamicSql";
	}/////////
	
	@RequestMapping("/trim1.do")
	public String trim1(@RequestParam Map map,Model model) {		
		List list= dao.trim1(map);		
		model.addAttribute("message", "검색된 글 총수:"+list.size());
		//뷰정보 반환]
		return "dynamicsql11/DynamicSql";
	}/////////
	
	@RequestMapping("/trim2.do")
	public String trim2(@RequestParam Map map,Model model) {	
		if(!(map.get("title")==null && map.get("content")==null)) {
			int affected= dao.trim2(map);		
			model.addAttribute("message", "수정된 글 총수:"+affected);
		}
		else 
			model.addAttribute("message", "제목이나 내용 둘 중 하나는 전송하세요");
		//뷰정보 반환]
		return "dynamicsql11/DynamicSql";
	}/////////
	@RequestMapping("/set.do")
	public String set(@RequestParam Map map,Model model) {	
		if(!(map.get("title")==null && map.get("content")==null)) {
			int affected= dao.set(map);		
			model.addAttribute("message", "수정된 글 총수:"+affected);
		}	
		else 
			model.addAttribute("message", "제목이나 내용 둘 중 하나는 전송하세요");
		//뷰정보 반환]
		return "dynamicsql11/DynamicSql";
	}/////////
	
	@RequestMapping("/foreach.do")
	public String foreach(Model model) {	
		/*
		리스트인 경우
		List list= Arrays.asList(1,2,3,4,5,6,7,8,9,10);//글번호들
		List result=dao.foreach(list);
		*/
		//맵인 경우
		Map map = new HashMap();
		map.put("key", Arrays.asList(1,2,3,4,5,6,7,8,9,10));
		List result=dao.foreach(map);
		
		model.addAttribute("message", "검색된 글 총수:"+result.size());
		//뷰정보 반환]
		return "dynamicsql11/DynamicSql";
	}/////////
	
	@RequestMapping("/foreachExam.do")
	public String foreachExam(@RequestParam int[] email,Model model) {		
		int affected = dao.foreachExam(email);
		model.addAttribute("message", "삭제된 글 총수:"+affected);
		//뷰정보 반환]
		return "dynamicsql11/DynamicSql";
	}/////////
}
