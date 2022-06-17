<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/Template/Top.jsp"/>

	<div class="jumbotron jumbotron-fluid bg-warning">
		<div class="container-fluid">
			<h1>마이 페이지 <small><%=session.getAttribute("USER-ID") %></small></h1>			
		</div>
		<!--jumbotron-->
	</div>
	<!--container-->
	<div class="container">
		<a class="btn btn-info" href="Logout.jsp">로그 아웃</a>	
	</div>

<jsp:include page="/Template/Footer.jsp"/>