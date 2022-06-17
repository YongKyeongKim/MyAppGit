package com.kosmo.springapp.basic.annotation;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
public class SpringBeanConfig {

	public SpringBeanConfig() {
		System.out.println("@Configuration붙은 SpringBeanConfig의 생성자");
	}/////////////
	/*
	 * 접근지정자 : public
	 * 반환타입 : 스프링 컨테이너에 등록하고자하는 빈의 타입
	 * 메소드명 : 소문자로 시작하는 클래스명
	 * 
	 * name속성으로 빈의 아이디 설정가능
	 * 해당 빈을 필요로 하는 곳에서 @Autowired나 @Resource로 자동 주입해서 사용
	 */
	@Bean
	@Lazy //ConfigurationController에도 @Lazy를 추가해야 한다.
	public ConfigBean configBean() {
		return new ConfigBean();
	}
	/*
	//root-context.xml에 빈으로 등록해 놓음
	 
	@Bean
	public HikariDataSource hikariDataSource() {
		
		HikariConfig hikariConfig= new HikariConfig();
		hikariConfig.setDriverClassName("oracle.jdbc.OracleDriver");
		hikariConfig.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
		hikariConfig.setUsername("SPRING");
		hikariConfig.setPassword("SPRING");
		
		return new HikariDataSource(hikariConfig);
	}*/
	
	
}
