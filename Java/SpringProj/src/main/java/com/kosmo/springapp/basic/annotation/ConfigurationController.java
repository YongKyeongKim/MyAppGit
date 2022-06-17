package com.kosmo.springapp.basic.annotation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*
[스프링에  빈 등록 방법]

	방법1. @Controller,@Service,@Repository,@Component,@Configuration가 붙은 클래스를 스캔 해서 
		  스프링 컨테이너에 빈으로 등록	
		  빈의 아이디는 카멜 케이스  형태의 클래스명이 된다		
		  빈의 아이디를 직접 지정시에는 name속성 추가.
		  단,@Controller(value="빈 아이디"),@Component(value="빈 아이디")는 value속성 사용

	방법2.@Congiguration어노테이션과 @Bean어노테이션  사용해서 자바코드로 
	     내가 생성해서 빈 등록.     
	
		@Configuration	
		public  class  SpringBeanConfig{
		
			@Bean		
		    public  OneMemoService  oneMemoService(){		    	
		   		//return  new  OneMemoService();
		   		 OneMemoService oneMemoService= new  OneMemoService();
		   		 return oneMemoService;
		    }
		    @Bean	
		    public  OneMemoRepository  oneMemoRepository(){
		    	return  new  OneMemoRepository();
		    }
		
		}
	
	이때 빈의 아이디는 카멜케이스  형태의 메소드명이된다	
	혹은 @Bean(name="빈 아이디")으로 지정한다
	
	단.@Controller는  요청처리를 하기위한 빈이니까	@Configuration으로 등록하는 빈에서 제외한다	
	이제 서비스와 리포지토리에서는 @Service  ,@Repository는 붙이지 않는다	
	※생성된 빈은 @Autowired나 @Resource로 주입해서 사용
	
	//@Service
	public class OneMemoService{
	
	}
	//@Repository
	public class OneMemoRepository{
	
	}
	※주된 목적은 빈을 설정파일이 아닌 자바코드로 등록해서 빈을 주입받고자할때
	주로 사용한다
	즉 외부 라이러리에서 제공하는 빈이나 빈을 Config별로 구분해서 등록후
	주입받을때 사용한다
	
	방법3. 빈 설정파일에 빈으로 등록
	<beans:bean name="/HandlerMapping/BeanNameUrl.do" class="com.kosmo.springapp.basic.handlermapping.BeanNameUrlController"/>
*/


@Controller
@Lazy //최초 프로젝트 실행시 생성이 안되고 요청이 있을때 생성된다
public class ConfigurationController {

	//ConfigBean을 주입 받자
	@Autowired
	private ConfigBean configBean;
	
	@RequestMapping("/Configuration/Configuration.do")
	public String exec(Model model) {
		//데이타 저장]
		model.addAttribute("message", configBean);
		//뷰정보 반환]
		return "annotation06/Annotation";
	}
}
