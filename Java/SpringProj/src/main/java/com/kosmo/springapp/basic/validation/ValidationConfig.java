package com.kosmo.springapp.basic.validation;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;

@Configuration
public class ValidationConfig {
	
	@Bean
	public FormValidator formValidator() {
		return new FormValidator();
	}///////////////////
	/*
	 src 밑이나 WEB-INF 밑에 에러메시지를 저장한 properties파일명(확장자를 생략한) 
	 키값 = 에러메시지 
	 키값은 에러코드.커맨드객체명.속성 = 에러 내용 
	 단,커맨드 객체명은 소문자로 
	 에러코드는 rejectValue("속성","에러코드")에 설정한 에러코드값 
	 예]nameError.formCommand.name 	  
	 */
	@Bean(name = "messageSource")
	public ResourceBundleMessageSource resourceBundleMessageSource() {
		ResourceBundleMessageSource messageSource= new ResourceBundleMessageSource();
		messageSource.setBasenames("com/kosmo/springapp/basic/validation/ErrorMessage");
		return messageSource;
	}
}
