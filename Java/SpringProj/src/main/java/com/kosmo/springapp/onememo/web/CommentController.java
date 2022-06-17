package com.kosmo.springapp.onememo.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.springapp.onememo.service.LineCommentDTO;
import com.kosmo.springapp.onememo.service.ListPagingData;
import com.kosmo.springapp.onememo.service.impl.LineCommentServiceImpl;

//@SessionAttributes({"id"})//씨큐리티 사용시 주석
@RestController
@RequestMapping("/onememo/comments/")
public class CommentController {
	
	//서비스 주입
	@Autowired
	private LineCommentServiceImpl commentService;
	//ObjectMapper API(Jackson에 포함된 클래스) 주입:빈 설정파일에 등록 혹은 
	//자바클래스(OneMemoConfig)에 @Bean으로 등록
	@Autowired
	private ObjectMapper mapper;
	
	/*
	 * @RequestParam : key=value쌍으로 받을때
	 * 					1.form으로 전송시
	 *                 <form action="my.do" enctype="x-www-form-urlencoded">
	 *                 	<input type="text" name="age"/>
	 *                 </form>
	 *                
	 * 					age=사용자 입력값 으로 전송됨 
	 * 					전송방식 즉 post 혹은 get상관없다
	 * 					2.쿼리 스트링으로 전송시
	 * 	                <a href="my.do?age=30">클릭</a>
	 * 					age=30으로 전송됨
	 * 					{age:20} 서버로 보내도 됨 단,contentType:"application/x-www-form-urlencoded"로
	 * 
	 * @RequestBody : JSON으로 받을때 즉 자바스크립트 객체로 받을떼 사용
	 * 			      즉 contentType:"application/json"
	 * 매핑용 어노테이션의 produces = "text/plain;charset=UTF-8"은 
	 * 응답바디에 Content-type:text/plain;charset=UTF-8 쓰는 거와 같다
	 * 
	 * ※@RequestParam Map map으로 받은때는 요청을 보낼때 JSON이 아니라 
	 *  key=value형태로 보내야 한다
	 */
	//코멘트 입력처리	
	//1.String으로 반환
	//@PostMapping(value="Write.do",produces = "text/plain; charset=UTF-8")
	//public String write(@ModelAttribute("id") String id,@RequestParam Map map) {
	//2.Map으로 반환:JACKSON라이브러리 설치시에만
	@PostMapping(value="Write.do")
	public Map write(
			//@ModelAttribute("id") String id,
			Authentication auth,
			@RequestParam Map map) {
		//한줄 댓글 작성자의 아이디 설정
		//map.put("id", id);
		map.put("id", ((UserDetails)auth.getPrincipal()).getUsername());
		//서비스 호출
		int newLno=commentService.insert(map);
		map.put("lno", newLno);
		String name = commentService.findNameByKey(map);
		map.put("name", name);
		
		//데이타 반환]
		//1.String반환시
		//return String.format("{\"lno\":\"%s\",\"name\":\"%s\"}",newLno,name);
		//2.MAP반환시
		return map;
	}////////////write
	@PostMapping(value="List.do",produces = "text/plain; charset=UTF-8")
	public String list(
			//@ModelAttribute("id") String id,
			@RequestParam Map map) throws JsonProcessingException {
		//서비스 호출
		 ListPagingData<LineCommentDTO> commentPagingData = commentService.selectList(map,null,0);
		/*
		※JACKSON이 List<LineCommentDTO>을 JSON형태 문자열로 변경시
		날짜 데이타를 2021-11-23 12:34:49.0에서 1637638489000로 변경해버린다.
		숫자형태의 날짜를 년월일형태의 문자열로 변경해서 다시 Map에 해당 키값으로 저장해여한다.		  
	    */		
		//ObjectMapper의 writeValueAsString(리스트계열 컬렉션<맵 혹은 DTO>)은
		//리스트계열 컬렉션<맵 혹은 DTO>를 JSON형식의 문자열로 변환해준다.
		String comments= mapper.writeValueAsString(commentPagingData.getLists());		
		//데이타 반환
		return comments;
	}
	
	@PostMapping(value="Edit.do")
	public Map edit(
			//@ModelAttribute("id") String id,
			@RequestParam Map map) {
		
		//서비스 호출
		commentService.update(map);		
		//데이타 반환]		
		return map;
	}////////////write
	@PostMapping(value="Delete.do")	
	public Map delete(
			//@ModelAttribute("id") String id,
			@RequestParam Map map) {
		
		//서비스 호출
		commentService.delete(map);		
		//데이타 반환]		
		return map;
	}////////////write
}
