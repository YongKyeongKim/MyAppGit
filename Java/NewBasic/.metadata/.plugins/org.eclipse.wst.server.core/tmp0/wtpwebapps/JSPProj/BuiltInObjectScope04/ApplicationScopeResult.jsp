<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ApplicationScopeResult.jsp</title>
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
	      <h1>application영역에 저장된 속성 읽기</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<h2>리스트 계열 컬렉션</h2>
    	<ul class="list-unstyled">
    		<%
    			List<MemberDTO> list=(List<MemberDTO>)application.getAttribute("list");
    			for(MemberDTO member:list){
    		%>
    		<li><%=member %></li>
    		<% } %>
    	</ul>
    	<h2>맵 계열 컬렉션</h2>
    	<ul class="list-unstyled">
    		<%
    		Map<String,MemberDTO> map=(Map<String,MemberDTO>)application.getAttribute("map");
    		Set<String> keys= map.keySet();
    		for(String key:keys){
    		%>
    		<li><%=map.get(key) %></li>
    		<%} %>
    	</ul>
  	</div><!-- container -->
</body>
</html>