package com.kosmo.springapp.basic.database;


import java.sql.Connection;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zaxxer.hikari.HikariDataSource;





//1]pom.xml에 스프링 JDBC 라이브러리 추가(메이븐 리포지토리 spring jdbc 검색후)
//2]DataSource를 얻기 위한 빈 등록은 root-context.xml에서 등록
//그래야 각각의 디스패처 서블릿에서 해당 빈을 공통으로 사용가능
@Controller
@RequestMapping("/Database")
public class DatabaseController {
	//데이타 소스를 자동으로 주입 받기 위한(와이어링) 멤버변수(속성) 선언]
	@Resource(name = "dataSourceByJDBC")
	private DataSource jdbc;	
	@Resource(name = "dataSourceByJNDI")
	private DataSource jndi;
	@Autowired
	private HikariDataSource hikari;
	
	
	@RequestMapping("/JDBCConnection.do")
	public String jdbc(Model model) throws SQLException {
		
		//주입받은 DataSource객체로 Connection객체 얻기]
		Connection conn= jdbc.getConnection();
		//데이타 저장]
		model.addAttribute("message",conn==null?"[데이타베이스 연결실패]":"[데이타베이스 연결성공]");
		//커넥션 객체 메모리 해제
		if(conn  !=null) conn.close();
		//뷰정보 반환]
		return "database07/Database";
	}
	
	@RequestMapping("/JNDIConnection.do")
	public String jndi(Model model) throws SQLException {
		//주입받은 DataSource객체로 Connection객체 얻기]
		Connection conn= jndi.getConnection();
		//데이타 저장]
		model.addAttribute("message",conn==null?"[데이타베이스 연결실패]":"[데이타베이스 연결성공]");
		//커넥션 객체를 풀에 반납
		if(conn  !=null) conn.close();
		//뷰정보 반환]
		return "database07/Database";
	}
	
	@RequestMapping("/HikariConnection.do")
	public String hikari(Model model) throws SQLException {
		//주입받은 DataSource객체로 Connection객체 얻기]
		Connection conn= hikari.getConnection();
		//데이타 저장]
		model.addAttribute("message",conn==null?"[데이타베이스 연결실패]":"[데이타베이스 연결성공]");
		//커넥션 객체를 풀에 반납
		if(conn  !=null) conn.close();
		//뷰정보 반환]
		return "database07/Database";
	}
}
