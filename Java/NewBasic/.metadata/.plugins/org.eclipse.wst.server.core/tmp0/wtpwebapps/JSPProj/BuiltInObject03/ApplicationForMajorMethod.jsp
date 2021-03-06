<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//[선언부에서 물리적 경로 얻는 방법들]	
	//1]this키워드 사용
	private String getRealPath(){
		return this.getServletContext().getRealPath("/images");
	}///////
	//2]매개변수로 내장객체 전달받기
	private String getRealPath(ServletContext app){
		return app.getRealPath("/images");
	}///////
	//3]멤버변수 사용
	private ServletContext application;
	private String getRealPath2(){
		return application.getRealPath("/images");
	}///////

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ApplicationForMajorMethod.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
  /*점보트론 세로폭 줄이기*/
  .jumbotron {
    padding-top: 1rem;
    padding-bottom: 1rem;
  }
</style>
</head>
<body>
	<div class="jumbotron jumbotron-fluid bg-warning">
	    <div class="container-fluid">
	      <h1>ServletContext</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">application내장객체의 주요 메소드</legend>
    		<h2>컨텍스트 초기화 파라미터 얻기:getInitParameter("컨텍스트 초기화 파라미터")</h2>
    		<ul class="list-unstyled">
    			<!-- 
			    -컨텍스트 초기화 파라미터
					목적]웹 어플리케이션(컨텍스트)을 구성하는 모든  jsp(서블릿)
				     에서 스트링형 상수를 공유하기 위함.
					STEP1] web.xml에 컨텍스트 초기화 파라미터 등록    
					STEP2] ServletContext의 getInitParameter("파라미터명") 메소드로 얻기		
			 	-->
    		
    			<li>오라클 주소 : <%=application.getInitParameter("ORACLE-URL") %></li>
    			<li>오라클 드라이버 : <%=application.getInitParameter("ORACLE-DRIVER") %></li>
    			<li>this.getInitParameter("서블릿 초기화 파라미터") : <%=this.getInitParameter("ORACLE-URL") %> </li>
    			<li>this.getInitParameter("서블릿 초기화 파라미터") : <%=this.getInitParameter("ORACLE-DRIVER") %> </li>
    			<li>this.getInitParameter("서블릿 초기화 파라미터") : <%=this.getInitParameter("SERVLET-PARAMETER") %> </li>
    		</ul>
    		<h2>모든 컨텍스트 초기화 파라미터명 얻기:getInitParameterNames()</h2>
    		<ul class="list-unstyled">
    			<%
    				Enumeration<String> names=application.getInitParameterNames();
    				while(names.hasMoreElements()){
    					//컨테스트 초기화 파라미터명 얻기
    					String paramName=names.nextElement();
    					//컨테스트 초기화 파라미터값 얻기
    					String paramValue = application.getInitParameter(paramName);
    			%>
    		
    			<li><%=paramName %> : <%=paramValue %></li>
    			<%  } %>
    		</ul>
    		<h2>서버의 물리적 경로 얻기:getRealPath("/로 시작하는 웹상의 경로")</h2>
    		<!-- 
			ServletContext의 메소드인 	getRealPath(/로 시작하는 웹상의 경로)로 얻는다.
			웹상의 경로는 Context 루트를 제외한 /로 시작
	 		-->
    		<ul class="list-unstyled">
    			<li>application내장객체:<%=application.getRealPath("/images") %></li>
    			<li>request내장객체(주로 내가 만든 서블릿에서 사용):<%=request.getServletContext().getRealPath("/images") %></li>
    			<li>this키워드(주로 선언부에서 사용):<%=this.getServletContext().getRealPath("/images") %></li>
    		</ul>
    		<h3>선언부에서 물리적 경로 얻기</h3>
    		<ul class="list-unstyled">
    			<li>this키워드 사용 : <%=getRealPath() %></li>
    			<li>매개변수로 전달 : <%=getRealPath(application) %></li>
    			<% this.application = application; %>
    			<li>멤버변수 사용 : <%=getRealPath2() %>
    		</ul>    		
    	</fieldset>
  	</div><!-- container -->
</body>
</html>