<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BuiltInObjectOfParamResult.jsp</title>
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
	      <h1>Expression Language</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">EL의 param 내장객체</legend>
    		<h4>자바코드로 영역에 저장된 속성 및 파라미터로 전달된 값 읽기</h4>
    		<h6>영역에 저장된 속성</h6>
    		<%
    			MemberDTO member=(MemberDTO)request.getAttribute("dtoObject");
    		%>
    		<ul class="list-unstyled">
    			<li>MemberDTO객체 : <%=member %></li>
    			<li>String객체 : <%=request.getAttribute("stringObject") %></li>
    			<li>Integer객체 : <%=request.getAttribute("integerObject") %></li>    		
    		</ul>
    		<h6>파라미터로 전달된 값</h6>
    		<%
    			int first=Integer.parseInt(request.getParameter("first"));
    			int second=Integer.parseInt(request.getParameter("second"));
    		%>
    		두 파라미터의 합:<%=first+second %>
    		<h4>EL로 영역에 저장된 속성 및 파라미터로 전달된 값 읽기</h4>
    		<h6>영역에 저장된 속성</h6>
    		<!-- 
			영역에 저장된 값은 xxxScope내장 객체로]
			-xxxScope.속성명 혹은 xxxScope["속성명"]
			파라미터로 전달 된 값은
			param내장객체 혹은 paramValues내장객체로
			
			]
			-param.파라미터명 혹은 param["파라미터명"]
			 paramValues.파리미터명 혹은 paramValues["파라미터명"]
			 
			 param은 request.getParameter()와 같고
			 paramValues는 request.getParameterValues()와 같다
			 
			※EL에서는 문자열등을 표시할때 ""이나 '' 둘다 사용가능
		 -->
    		<ul class="list-unstyled">
    			<li>MemberDTO객체 : ${dtoObject}</li>
    			<li>String객체 : ${requestScope.stringObject }</li>
    			<li>Integer객체 : ${integerObject }</li>    		
    		</ul>
    		<h6>파라미터로 전달된 값</h6>
    		두 파라미터의 합 : ${param.first + param['second']}
    	</fieldset>
  	</div><!-- container -->
</body>
</html>