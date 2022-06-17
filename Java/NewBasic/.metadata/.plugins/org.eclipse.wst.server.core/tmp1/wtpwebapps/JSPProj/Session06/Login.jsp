<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/Template/Top.jsp"/>

	<div class="jumbotron jumbotron-fluid bg-warning">
		<div class="container-fluid">
			<h1>한국소프트웨어 인재개발원</h1>
			<p>https://www.ikosmo.co.kr/</p>
		</div>
		<!--jumbotron-->
	</div>
	<!--container-->
	<div class="container">
		<h2>로그인</h2>
		<span class="font-weight-bold text-danger"><%=request.getAttribute("NOT-LOGIN")==null?"":request.getAttribute("NOT-LOGIN") %></span>
		<form class="form-inline" action="LoginProcess.jsp" method="POST">
			<label>아이디</label> 
			<input type="text" name="id" class="form-control mx-2" value="<%=request.getParameter("id")==null?"":request.getParameter("id") %>" /> 
			<label>비밀번호</label> 
			<input type="password" name="pwd" class="form-control mx-2" value="<%=request.getParameter("pwd")==null?"":request.getParameter("pwd") %>" /> 
			<input type="submit" class="btn btn-danger mx-2" value="로그인" />
		</form>
	</div>

<jsp:include page="/Template/Footer.jsp"/>

	