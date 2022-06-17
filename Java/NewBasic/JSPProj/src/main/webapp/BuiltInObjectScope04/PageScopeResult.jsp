<%@page import="model.MemberDTO"%>
<%@ page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PageScopeResult.jsp</title>
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
	      <h1>page영역</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<h2>페이지 영역에 저장된 속성 읽기</h2>    	
    	<ul class="list-unstyled">
    		<li>Integer 타입: <%=pageContext.getAttribute("pageInteger") %></li>
    		<li>String 타입: <%=pageContext.getAttribute("pageString") %></li>
    		<li>Date 타입: <%=pageContext.getAttribute("pageDate") %></li>
    		<li>MemberDTO 타입 1: <%=pageContext.getAttribute("pageMemberFirst") %></li>
    		<li>MemberDTO 타입 2: <%=pageContext.getAttribute("pageMemberSecond") %></li>
    	</ul>
    	
  	</div><!-- container -->
</body>
</html>