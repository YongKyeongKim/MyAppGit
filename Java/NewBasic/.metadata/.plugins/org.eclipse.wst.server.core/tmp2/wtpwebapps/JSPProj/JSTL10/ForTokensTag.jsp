<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ForTokensTag.jsp</title>
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
	      <h1>JSTL(JSP Standard Tag Library)</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">forTokens태그</legend>
    		<%
    			String colors="red,green,blue,#ab7dff";
    			out.println("<h3>String클래스</h3>");
    			for(String color:colors.split(","))
    				out.println("<span style='color:"+color+"'>"+color+"</span>");
    			out.println("<h3>StringTokennizer클래스</h3>");
    			StringTokenizer tokenizer = new StringTokenizer(colors,",");
    			out.println("토큰 수:"+tokenizer.countTokens()+"<br/>");
    			//hasMoreTokens():꺼내올 토큰이 있으면 true,없으면 false반환
    			while(tokenizer.hasMoreTokens()){
    				//토큰을 꺼내올때는 nextToken()
    				String color=tokenizer.nextToken();
    				out.println("<span style='color:"+color+"'>"+color+"</span>");
    			}    		
    		
    		%>	
    		
    		<h3>forTokens태그로 토큰화</h3>
    		<c:set var="colors" value="<%=colors %>"/>
    		<c:forTokens items="${colors}" delims="," var="color">
    			<span style="color:${color}">${color}</span>
    		</c:forTokens>
    		
    	</fieldset>
  	</div><!-- container -->
</body>
</html>