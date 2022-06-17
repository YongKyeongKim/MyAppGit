<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//[응답헤더 설정]	
	/*
	웹브라우저가 지원하는 캐쉬기능를 이용하지 않겠다
	즉 현재 페이지를 매번 서버에 요청하도록 만드는 것
	*/
	//HTTP/1.0에 적용시킬때
	response.setHeader("pragma", "no-cache");
	//HTTP/1.1에 적용시킬때
	response.setHeader("cache-control", "no-cache");
	/*
	웹브라우저가 인식하지 못하는 Content-Type(MIME타입)인 경우
	웹브라우저는 파일 다운로드창을 보여준다
	※다운로드 구현시 적용
	
	IE에서는 아무값이나 FX에서는 
	application/unknown이나
	binary/octect-stream등	
	*/
	//response.setContentType("binary/octect-stream");
	/*
		add계열:기존 헤더명이 존재시 계속 추가,없을시 생성됨
		set계열:기존 헤더명이 존재시 기존 헤더명의 값이 변경됨,없을시 생성.	
	*/
	//add계열
	Date date = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	response.addHeader("Current-Date", dateFormat.format(date));
	response.addDateHeader("Current-Date",date.getTime());
	//set계열
	response.setHeader("Number-Of-Student","30");
	response.setIntHeader("Number-Of-Student",29);
	//response.setDateHeader("Current-Date", date.getTime()); //모든 Current-Date라는 응답헤더명이 대체됨.
	response.setContentType("text/html; charset=UTF-8");
	//setContentLength()는 파일 다운로드시 파일의 크기로 Content-Length를 설정할때 사용(진행바가 표시된다)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ResponseForHeader.jsp</title>
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
	      <h1>응답헤더</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
  		<h3>설정한 응답헤더 출력하기</h3>
    	<ul class="list-unstyled">
    		<%
    			//1]응답 헤더 명 얻기:getHeaderNames().
				//add계열 혹은 set계열로 설정한 응답헤더명을 가져 온다.단, 기존의 응답헤더명과 같은 setter로 설정해도
				//헤더명을 가져오지 못한다(예:setContdentType()/setContentLength()등)
				Collection<String> names= response.getHeaderNames();
    			for(String headerName:names){
    				//2]응답헤더값 얻기 : String getHeader("헤더명")
					String headerValue = response.getHeader(headerName);
					out.println(String.format("<li>%s : %s</li>",headerName,headerValue));
    			}
    		
    		%>
    	</ul>
    	<h3>응답헤더 존재 여부 판단:boolean containHeader("헤더명")</h3>
    	<h5>Content-Type존재 여부:존재</h5>
    	<%=response.containsHeader("Content-Type") ? "Content-Type 존재" : "Content-Type 미 존재" %><br/>
    	<%=response.getContentType() %>    	
    	<h5>Content-Length존재 여부:미 존재</h5>
    	<%=response.containsHeader("Content-Length") ? "Content-Length 존재" : "Content-Length 미 존재" %>
  	</div><!-- container -->
</body>
</html>