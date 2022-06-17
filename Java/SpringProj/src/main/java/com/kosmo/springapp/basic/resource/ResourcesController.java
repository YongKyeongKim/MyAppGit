package com.kosmo.springapp.basic.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * 1. 확장자가 .properties인 리소스 파일 src/main/resources 에 생성
 *    (하위 폴더 생성시에는 new->package로 생성)
 * 2. servlet-context.xml파일에 <context:property-placeholde>등록
 * 3. 클래스에서 사용시에는 @Value어노테이션 사용
 * 
 */
@Controller
public class ResourcesController {
	
	//빈 설정파일에서 .properties파일의 자원 읽어 오기
	@Autowired
	private UserCommand command;//빈 설정파이에서 ${}로 주입 테스트용
	//.java에서 .properties파일의 자원 읽어 오기
	/*
	@Value어노테이션을 통해서 .properties(리소스파일) 에 있는 키값을 가져 올 수 있다	
	사용 예]
  	@Value("${키값}")
  	private 자료형 변수
	 */
	@Value("${name}")
	private String name;
	@Value("${user}")
	private String username;
	@Value("${password}")
	private String password;
	
	
	@RequestMapping("/Resource/Resource.do")
	public String exec(Model model) {
		//데이타 저장]
		model.addAttribute("xmlel", command);
		model.addAttribute("javavalue", String.format("[이름:%s,아이디:%s,비번:%s]",name,username,password));
		//뷰정보 반환]
		return "resource08/Resource";
	}
}
