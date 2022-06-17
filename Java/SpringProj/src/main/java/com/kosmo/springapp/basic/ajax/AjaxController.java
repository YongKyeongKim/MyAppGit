package com.kosmo.springapp.basic.ajax;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.exc.StreamReadException;
import com.fasterxml.jackson.core.exc.StreamWriteException;
import com.fasterxml.jackson.databind.DatabindException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.springapp.onememo.service.ListPagingData;
import com.kosmo.springapp.onememo.service.OneMemoDTO;
import com.kosmo.springapp.onememo.service.PagingUtil;
import com.kosmo.springapp.onememo.service.impl.OneMemoServiceImpl;

@Controller
public class AjaxController {

	@Autowired
	private OneMemoServiceImpl service;
	
	//[ajax 미 사용]-새로고침이 됨.
	/* 반환타입 void:직접 웹브라우저에 출력 스트림으로 결과값 출력
	*  반환타입 String:디스패처서블릿에게 뷰 반환, 결과값은 모델에 저장(JSP로 포워드)
	*/
	/*
	@RequestMapping("/Ajax/NoAjax.do")
	public void noajax(@RequestParam Map map,HttpServletResponse resp) throws IOException {
		//1]컨텐츠 타입 설정
		resp.setContentType("text/html; charset=UTF-8");
		//2]웹브라우저에 출력하기위한 출력스트림 얻기
		PrintWriter out= resp.getWriter();
		//3]비지니스 로직 호출
		boolean isLogin=service.isLogin(map);
		if(isLogin)
			out.println("<h2>"+map.get("id")+"님 즐감하세요</h2>");
		else {
			out.println("<script>");
			out.println("alert('아뒤와 비번이 틀려요');");
			out.println("history.back();");
			out.println("</script>");
		}
		//4]웹브라우저와 연결된 스트림 닫기
		out.close();
	}/////////*/
	@RequestMapping("/Ajax/NoAjax.do")
	public String noajax(@RequestParam Map map,Model model) {
		//1]서비스 호출
		boolean isLogin=service.isLogin(map);
		//2]데이타 저장
		model.addAttribute("isLogin",isLogin?map.get("id")+"님 반갑습니다":"회원정보 불일치");
		//3]뷰정보 반환]
		return "ajax12/Ajax";
	}////////
	//[AJAX 사용]-페이지를 전송하지 않고 데이타만 전송
	//[TEXT로 응답할때]	
	/*
	 * 반환타입은 void이거나 
	 * 반환타입이 String인 경우는 @ResponseBody()어노테이션 사용
	 * 위는 둘다 디스패처서블릿에게 반환하지 않는다
	 */
	/*
	@RequestMapping("/Ajax/AjaxText.do")	
	public void ajaxText(@RequestParam Map map,HttpServletResponse resp) throws IOException {
		//1]컨텐츠 타입 설정
		resp.setContentType("text/plain; charset=UTF-8");
		//2]웹브라우저에 출력하기위한 출력스트림 얻기
		PrintWriter out= resp.getWriter();
		//3]비지니스 로직 호출
		boolean isLogin=service.isLogin(map);
		//"Y" 혹은 "N" 값으로 응답할때-반드시 print()메소드로 안그러면 println은 줄바꿈이 추가됨
		//out.print(isLogin ?"Y":"N");
		//일반 메시지로 응답할때
		out.print(isLogin ?map.get("id")+"님 즐감!!":"회원 가입해...");
		//4]웹브라우저와 연결된 스트림 닫기
		out.close();
	}*/
	@RequestMapping(value="/Ajax/AjaxText.do",produces = "text/plain; charset=UTF-8")	
	public @ResponseBody String ajaxText(@RequestParam Map map) {
		//1]서비스 호출
		boolean isLogin=service.isLogin(map);		
		//return isLogin ?"Y":"N";//Y 혹은 N 값으로 응답할때
		return isLogin ?map.get("id")+"님 즐감!!":"회원 가입해...";//일반 메시지로 응답할때
	}
	
	
	/*
	 * 	사전준비:pom.xml에 jackson-databind라이브러리 의존성 추가
	 * 
		[Jackson]
		Java 객체(Map혹은 DTO)를 JSON으로 변환하거나 
		JSON을 Java 객체(Map혹은 DTO)로 변환하는 라이브러리
		List계열 컬렉션 즉 List<Map> 혹은 List<DTO>는
		자바스크립트로 변환시 JSON배열로 변환된다
		예] [ {key1:value2,key2:value2,},{},{},{}...]
		
		Spring 3.0 이후로부터, Jacskon과 관련된 API를 제공
		Jackson라이브러리를 사용하면 자동화 처리 가능
		
		Jackson라이브러리 pom.xml에 설정시
		
		MessageConverter API인 MappingJacksonHttpMessageConverter API가
		작동하여 컨트롤러가 리턴하는 객체를 후킹하여 ObjectMapper API로 JSON
		형태의 문자열로 자동으로 변환하여 반환한다.	
		1.자바객체를 JSON으로 변환시
		writeValue(File객체,DTO혹은 MAP) :객체를 JSON파일(.json)로 변환	
		writeValueAsString(DTO혹은 MAP):객체를 JSON형식의 문자열로 변환
		writerWithDefaultPrettyPrinter().writeValueAsString(DTO혹은 MAP)
		2.JSON을 자바객체로 변환시
		readValue(File객체,DTO혹은 MAP):JSON파일(.json)에 있는 내용을 자바객체로 읽어들일때
		readValue(JSON형식 문자열,DTO혹은 MAP):JSON형식의 문자열을 자바객체로 읽어 들일때
	 */
	
	
	
	@Autowired
	private ObjectMapper mapper;
	
	//[JSON으로 응답할때]
	@RequestMapping(value="/Ajax/AjaxJson.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody String ajaxJson(@RequestParam Map map) throws JsonProcessingException {
		//1]서비스 호출
		boolean isLogin=service.isLogin(map);	
		//[ObjectMapper 미 사용]  직접 json형식의 문자열 생성해서 반환.
		//반환 : 회원인 경우- {"isLogin":"방가방가"} 비회원인 경우- {"isLogin":"다음기회에"}
		/*
		return String.format("{\"isLogin\":\"%s\",\"id\":\"%s\",\"pwd\":\"%s\"}",
				isLogin?"방가방가":"다음 기회에",
				map.get("id"),
				map.get("pwd")
				);*/
		//[ObjectMapper 사용]
		//Map혹은 DTO를 JSON형식의 문자열로 변경 -writeValueAsString()
		map.put("isLogin",isLogin?"방가방가":"다음 기회에");
		System.out.println("mapper.writeValueAsString(map):"+mapper.writeValueAsString(map));
		return mapper.writeValueAsString(map);
	}
	
	@RequestMapping(value="/Ajax/AjaxJsonArray.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody String ajaxJsonArray(@RequestParam Map map,HttpServletRequest req) throws JsonProcessingException {
		//1]서비스 호출
		map.put(PagingUtil.NOW_PAGE,1);
		map.put(PagingUtil.PAGE_SIZE,10);
		ListPagingData<OneMemoDTO> listPagingData= service.selectList(map, req,1);
		List<OneMemoDTO> lists=listPagingData.getLists();
		System.out.println(mapper.writeValueAsString(lists));
		/*
		 [{"no":"17","title":"제목입니다5","content":"1","postDate":1654095600000,"id":"KIM","name":"김길동","commentCount":"0","comments":null},
		  {"no":"16","title":"제목입니다4","content":"1","postDate":1654095600000,"id":"KIM","name":"김길동","commentCount":"0","comments":null}]
		 */
		return mapper.writeValueAsString(lists);
	}/////////////////
	@RequestMapping(value="/Ajax/AjaxCourse.do",produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ajaxCourse(@RequestParam String course) throws JsonProcessingException {
		Map map = new TreeMap();
		switch(course) {
			case "java":
				map.put("j01","자바");
				map.put("j02","JSP");
				map.put("j03","스프링");
				break;
			case "dotnet":
				map.put("d01","C#");
				map.put("d02","ASP.NET");
				map.put("d03","WPF4");
				break;
			default:
				map.put("i01","라즈베리파이");
				map.put("i02","파이썬");
		}
		return mapper.writeValueAsString(map);
	}
	
	//1.자바객체를 JSON으로 변환
	//가.KEY=VALUE쌍으로 데이타 받기(폼으로 받을때)
	@RequestMapping("/Ajax/form.do")
	public String form(OneMemoDTO dto,Model model,HttpServletRequest req) throws StreamWriteException, DatabindException, IOException {
		//[자바객체(OneMemoDTO)를 JSON으로 변환] 
		//1.JSON파일로 서버에 저장
		//mapper.writeValue(new File("onememo.json"), dto);//IDE도구 실행파일이 있는 곳에 저장됨	
		String resources=req.getSession().getServletContext().getRealPath("/resources");
		mapper.writerWithDefaultPrettyPrinter().writeValue(new File(resources+File.separator+"onememo.json"), dto);
		
		//2.JSON형태의 문자열로 변환
		//String json = mapper.writeValueAsString(dto);
		String json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(dto);
		model.addAttribute("formRequestResult", json);
		
		//뷰정보 반환]
		return "ajax12/Ajax";
	}
	//위 요청후 브라우저에서 http://localhost:8080/springapp/resources/onememo.json로 요청하면
	//json형태로 잘 나옴
	
	//1.자바빈 반환하는 경우
	@RequestMapping("/Ajax/AjaxDataKeyValue.do")
	/*
	public @ResponseBody OneMemoDTO ajaxKeyValue(OneMemoDTO dto) {
		return dto;//JSON형식의 문자열로 변환되서 반환됨
	}*/
	//2.Map으로 반환하는 경우 : 값을 받지 않은 속성인 경우 null인 속성 제거 효과
	public @ResponseBody Map ajaxKeyValue(@RequestParam Map map) {
		return map;//JSON형식의 문자열로 변환되서 반환됨
	}
	
	@RequestMapping("/Ajax/AjaxDataJson.do")
	public @ResponseBody Map ajaxDataJson(@RequestBody Map map) {
		return map;//JSON형식의 문자열로 변환되서 반환됨
	}
	
	@RequestMapping("/Ajax/AjaxDataArray.do")
	public @ResponseBody List<Map> ajaxDataArray(){
		List<Map> lists = new Vector<>();
		Map map = new HashMap();
		map.put("id", "KIM");
		map.put("name", "김길동");
		lists.add(map);
		map = new HashMap();
		map.put("id", "LEE");
		map.put("name", "이길동");
		lists.add(map);
		return lists;
	}/////////
	@RequestMapping("/Ajax/JsonToJava.do")
	//2.JSON을 자바객체로 변환시-서버에 저장된 .json파일을 읽어서 브라우저로 보내기
	//json구조를 자바빈으로 만들어주는 사이트:
	//https://www.jsonschema2pojo.org/
	//public @ResponseBody OneMemoDTO jsonToJava(HttpServletRequest req) throws StreamReadException, DatabindException, IOException {
	public @ResponseBody Map jsonToJava(HttpServletRequest req) throws StreamReadException, DatabindException, IOException {
		/*
		 * //onememo.json파일에서 읽기
		  {
			  "no" : null,
			  "title" : "제목입니다",
			  "content" : "내용입니다\r\n내용입니다\r\n",
			  "postDate" : null,
			  "id" : null,
			  "name" : "한소인",
			  "commentCount" : null,
			  "comments" : null
			}
		 */
		String resources=req.getSession().getServletContext().getRealPath("/resources");
		//1.읽어온 데이타를 자바빈에 저장 -반환타입을 OneMemoDTO 혹은 Map으로
		//OneMemoDTO dto= mapper.readValue(new File(resources+File.separator+"onememo.json"), OneMemoDTO.class);
		Map map= mapper.readValue(new File(resources+File.separator+"onememo.json"), Map.class);
		//System.out.println("제목:"+dto.getTitle());
		System.out.println("제목:"+map.get("title"));
		//return dto;
		return map;
	}
	
}
