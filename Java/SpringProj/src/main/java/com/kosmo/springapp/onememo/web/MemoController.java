package com.kosmo.springapp.onememo.web;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kosmo.springapp.onememo.service.ListPagingData;
import com.kosmo.springapp.onememo.service.OneMemoDTO;
import com.kosmo.springapp.onememo.service.OneMemoService;
import com.kosmo.springapp.onememo.service.PagingUtil;

/*
※스프링 씨큐리티 사용시에는 기존 방식의 로그인처리 및 로그인 여부 판단 그리고 로그아웃등
  모두 제거한다(.jsp 에서 혹은 .java에서)
  그리고 나서 스프링 씨큐리티에서 제공하는 API로 처리한다
  단,로그인처리 및 로그아웃은 스프링 씨큐리티에서 제공함으로  로그인 판단 여부만 처리하면 된다.
*/
//@SessionAttributes({"id"})//스프링 씨큐리티를 사용할때 주석
@Controller
@RequestMapping("/onememo/bbs/")
public class MemoController {
	//서비스 주입]
	@Autowired
	private OneMemoService<OneMemoDTO> memoService;
	
	
	/*로그인 하지 않고 각 컨트롤러 메소드 실행시 오류:인자로 @ModelAttribute("id") String id추가시 */
	//씨큐리티 사용시에는 아래 예외처리 불필요
	/*
	@ExceptionHandler({Exception.class})
	public String error(Model model) {
		model.addAttribute("NotMember","로그인후 이용바람...");
		//뷰정보 반환]-로그인이 안된 경우 로그인 페이지로
		return "onememo10/member/Login";
	}//////////////////	*/
	
	//목록 처리]
	@RequestMapping("List.do")
	public String list(
			//@ModelAttribute("id") String id, //스프링씨큐리티 사용시 불필요
			@RequestParam Map map,
			@RequestParam(defaultValue = "1",required = false) int nowPage,
			HttpServletRequest req,
			Model model) {		
		
		//서비스 호출]
		//현재 페이지를 맵에 저장
		map.put(PagingUtil.NOW_PAGE, nowPage);
		ListPagingData<OneMemoDTO> listPagingData= memoService.selectList(map, req, nowPage);		
		
		//데이타 저장]		
		model.addAttribute("listPagingData",listPagingData);
		//뷰정보 반환]
		return "onememo10/bbs/List.kosmo";
	}/////////////list
	//입력폼으로 이동]
	//@RequestMapping(value="Write.do",method=RequestMethod.GET)
	@GetMapping("Write.do")
	public String write(
			//@ModelAttribute("id") String id//(씨큐리티 미 사용시)세션영역에서 id가져오기
			)
	{
		//뷰정보 반환]
		return "onememo10/bbs/Write.kosmo";
	}////////////////////////////////
	//입력처리]
	//@RequestMapping(value="Write.do",method=RequestMethod.POST)
	@PostMapping("Write.do")
	public String writeOk(
			//@ModelAttribute("id") String id,//씨큐리티 사용시 주석처리
			Authentication auth,//씨큐리티 사용시(인증이 안된 사용자는 설정파일의 <security:form-login>태그의 login-page속성에 지정한 페이지로 바로 리다이렉트 됨)
			@RequestParam Map map) {
		//서비스 호출]	
		//map.put("id", id);//씨큐리티 미 사용시.호출전 아이디 맵에 저장
		/*스프링 씨큐리티 적용시 인증(로그인)되었다면 Authentication객체에 로그인과 관련된 정보가 전달됨
		   로그인이 안되어 있으면 auth는 null*/
		System.out.println("[Authentication객체 출력]");
		System.out.println("auth:"+auth);
		UserDetails userDetails= (UserDetails)auth.getPrincipal();		
		System.out.println("아이디:"+userDetails.getUsername());
		System.out.println("비밀번호:"+userDetails.getPassword());
		System.out.println("부여된 권한들:");
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>)userDetails.getAuthorities();
		for(GrantedAuthority authority:authorities) System.out.println(authority.getAuthority());
		
		map.put("id",userDetails.getUsername());
		
		memoService.insert(map);
		//뷰정보 반환]-목록을 처리하는 컨트롤러로 이동
		return "forward:/onememo/bbs/List.do";
	}/////////////////////////
	//상세보기]
	@RequestMapping("View.do")
	public String view(
			//@ModelAttribute("id") String id,
			@RequestParam Map map,Model model) {
		
		//서비스 호출]
		OneMemoDTO record= memoService.selectOne(map);
		
		//데이타 저장]		
		model.addAttribute("record", record);
		//뷰정보 반환]
		return "onememo10/bbs/View.kosmo";
	}///////////////////////
	//상세보기]
	@GetMapping("Edit.do")
	public String edit(
			//@ModelAttribute("id") String id,
			@RequestParam Map map,Model model) {
		
		//서비스 호출]
		OneMemoDTO record= memoService.selectOne(map);
		
		//데이타 저장]		
		model.addAttribute("record", record);
		//뷰정보 반환]
		return "onememo10/bbs/Edit.kosmo";
	}///////////////////////
	@PostMapping("Edit.do")
	public String editOk(
			//@ModelAttribute("id") String id,
			@RequestParam Map map) {
		//서비스 호출]		
		memoService.update(map);
		//뷰정보 반환]-목록을 처리하는 컨트롤러로 이동
		return "forward:/onememo/bbs/View.do";
	}/////////////////////////
	
	@GetMapping("Delete.do")
	public String delete(
			//@ModelAttribute("id") String id,
			@RequestParam Map map) {
		//서비스 호출]		
		memoService.delete(map);
		//뷰정보 반환]-목록을 처리하는 컨트롤러로 이동
		return "forward:/onememo/bbs/List.do";
	}/////////////////////////
}//////////////
