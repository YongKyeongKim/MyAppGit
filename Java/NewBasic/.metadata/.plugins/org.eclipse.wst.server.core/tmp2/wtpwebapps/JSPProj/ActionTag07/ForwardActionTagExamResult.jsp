<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ForwardActionTagExamResult.jsp</title>
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
	      <h1>forward액션태그 예제</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">리퀘스트영역에 저장된 값</legend>
    		<%
    		Map<String,String[]> map=(Map<String,String[]>)request.getAttribute("map");
    		
    		%>
    		<ul class="list-unstyled">
    			<li>아이디 : <%=map.get("username")[0] %></li>
    			<li>비번 : <%=map.get("password")[0] %></li>
    			<li>운동종목 : <%=Arrays.toString(map.get("sports"))%></li>
    			<li>연령대 : <%=map.get("ages")[0] %></li>
    		</ul>
    	</fieldset>
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">파라미터로 받은 값</legend>
    		<ul class="list-unstyled">
    			<li>아이디 : <%=request.getParameter("username") %></li>
    			<li>비번 : <%=request.getParameter("password") %></li>
    			<li>운동종목 : <%=Arrays.toString(request.getParameterValues("sports"))%></li>
    			<li>연령대 : <%=request.getParameter("ages") %></li>
    		</ul>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>