<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RequestForHeader.jsp</title>
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
	      <h1>HttpServletRequest : 요청헤더 정보</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">요청헤더명:요청헤더값</legend>
    		<ul class="list-group">
    			<%
	    			/*
	    			request객체의 메소드]
	    			1]요청 헤더명 얻기:getHeaderNames()
	    			2]헤더명에 따른 헤더값:getHeader(헤더명)		
	    			*/
    				Enumeration<String> names= request.getHeaderNames();
	    			while(names.hasMoreElements()){
	    				//헤더명 얻기
	    				String headerName=names.nextElement();
	    				//헤더값  얻기]
	    				String headerValue=request.getHeader(headerName);		
    			%>
			    <li class="list-group-item"><%=headerName %> : <%=headerValue %></li>	
			    <% }//while %>		    
			</ul>
			<span class="lead"><%=request.getHeader("user-agent").toUpperCase().indexOf("FIREFOX")!=-1 ?"파이어 폭스 브라우저":"파이어 폭스가 아니다" %></span>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>