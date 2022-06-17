<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//POST방식 한글 처리
	request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BuiltInObjectOfParamExamResult.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
		</div>
		<!--container-fluid-->
	</div>
	<!--jumbotron-fluid-->
	<div class="container">
		<fieldset class="form-group border p-3">
			<legend class="w-auto p-3">자바코드(스크립팅 요소)로 파라미터 받기</legend>
			<ul class="list-unstyled">
				<li>이름: <%=request.getParameter("name") %></li>
				<li>성별: <%=request.getParameter("gender") %></li>
				<li>관심사항:<br/> 
				<%
					String[] items=request.getParameterValues("inter");
					//Arrays클래스 사용
					out.println(Arrays.toString(items)+"<br/>");
					//for문 사용
					for(String item:items){
						out.println(item+"&nbsp;");
					}
				%>
				
				</li>
				<li>학력: <%=request.getParameter("grade") %></li>
			</ul>
		</fieldset>
		<fieldset class="form-group border p-3">
			<legend class="w-auto p-3">EL로 파라미터 받기</legend>
			<ul class="list-unstyled">
				<li>이름: ${param.name}</li>
				<li>성별: ${param["gender"]}</li>
				<!-- 힌트 : 배열 출력시 JSTL의 forEach사용 -->
				<li>관심사항:<br/>
				 
				 <c:forEach items="${paramValues['inter']}" var="item">
				 	${item}&nbsp;			 
				 </c:forEach>
				 </li>
				<li>학력: ${param.grade}</li>
			</ul>
		</fieldset>
	</div>
	<!-- container -->
</body>
</html>