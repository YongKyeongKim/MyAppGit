<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<div class="container">
	<div class="jumbotron">
		<h1>로그인</h1>
	</div>
	<!-- 스프링 씨큐리티 사용하지 않을때 -->
	<%-- 
	
	<c:if test="${! empty NotMember}">
		<!--아이디와 비번 불일치시-->
		<div class="alert alert-success alert-dismissible fade show">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong>Failure!</strong> ${NotMember}
		</div>
	</c:if>
	
	<c:if test="${empty sessionScope.id}" var="isLogin">
		<form class="form-inline"
			action="<c:url value="/onememo/auth/LoginProcess.do"/>"
			method="GET">
			<label>아이디</label> <input type="text" name="id"
				class="form-control mx-2" /> <label>비밀번호</label> <input
				type="password" name="pwd" class="form-control mx-2" /> <input
				type="submit" class="btn btn-danger mx-2" value="로그인" />
		</form>
	</c:if>
	<c:if test="${not isLogin }">
		<div class="alert alert-success">
		  <strong>Success!</strong> ${sessionScope.id}님 즐감하세요!
		</div>
	</c:if>
	--%>
	<!-- 스프링 씨큐리티 사용할때 -->
	<!--아이디와 비번 불일치시-->
	<c:if test="${not empty param.NotMember }">
	<div class="alert alert-success alert-dismissible fade show">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>Failure111!</strong> ${param.NotMember}
	</div>
	</c:if>
	<sec:authorize access="isAnonymous()">
		<form class="form-inline"
			action="<c:url value="/onememo/auth/LoginProcess.do"/>" method="post">
			<label>아이디</label> <input type="text" name="id"
				class="form-control mx-2" /> <label>비밀번호</label> <input
				type="password" name="pwd" class="form-control mx-2" /> <input
				type="submit" class="btn btn-danger mx-2" value="로그인" />
		</form>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<div class="alert alert-success">
			  <strong>Success!</strong> <sec:authentication property="principal.username"/> 님 즐감하세요!
		</div>
	</sec:authorize>


</div>
<!-- container -->


