<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!-- 여러 JSP페이지에서 공통으로 사용할 변수나 상수, 메소드 정의 --> 
<%!
	private SimpleDateFormat dateFormat= new SimpleDateFormat();
	//공통 메소드]
	private String getDate(String pattern){
		
		dateFormat.applyPattern(pattern);
		return dateFormat.format(new Date());
	}////////////getDate
%>
<%
	
	//공통 변수]
	String currentPageName = 
		request.getRequestURL().toString().substring(request.getRequestURL().toString().lastIndexOf("/")+1);

%>