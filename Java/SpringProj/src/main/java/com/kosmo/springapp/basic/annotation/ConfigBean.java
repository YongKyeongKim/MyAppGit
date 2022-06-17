package com.kosmo.springapp.basic.annotation;


//스프링 철학에 맞게 DI를 통해서 주입 받자
//주입받으려면 스프링 컨테이너에 등록되야한다
//등록하려면 
//가.빈 설정파일에 등록해주거나 아니면 
//나.@Component어노이션을 붙이거나 아니면
//다.@Configuration어노테이션이 붙은 클래스에서 @Bean으로 등록한다
//아래 빈은 다. 방법으로 등록해서 주입받아서 사용
public class ConfigBean {

	public ConfigBean() {
		System.out.println("ConfigBean의 생성자");
	}///////
	@Override
	public String toString() {
		
		return "ConfigBean객체 입니다";
	}
	
}
