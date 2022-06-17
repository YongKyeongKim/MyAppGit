<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 스프링 씨큐리티 태그 라이브러리 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<title>한소인</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CDN -->

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
.jumbotron {
	padding-top: 1rem;
	padding-bottom: 1rem;
}

body {
	padding-top: 65px;
}
</style>
</head>
<body>


	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark fixed-top">
		<a class="navbar-brand" href="<c:url value="/"/>"> <i class="material-icons"
			style="font-size: 2rem">home</i>
		</a>

		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbar-link">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-end"
			id="navbar-link">
			<ul class="navbar-nav">
				<!-- 스프링 씨큐러티 사용하지 않을때 -->
				<%-- 
				<c:if test="${empty sessionScope.id}" var="isLogin">
				<li class="nav-item"><a class="nav-link active" href="<c:url value="/onememo/auth/Login.do"/>">로그인</a></li>
				</c:if>
				<c:if test="${not isLogin }">
				<li class="nav-item"><a class="nav-link" href="<c:url value="/onememo/auth/Logout.do"/>">로그아웃</a></li>
				</c:if>
				--%>
				<!-- 
			     스프링 씨큐리티 사용시 :단,<security:csrf disabled="false" />
			     설정시 로그아웃을 GET방식이 아닌 POST방식으로 해야한다
			     true로 지정시에는 GET방식이어도 상관없다(CSRF공격은 막지 못한다)
			     -->
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link active" href="<c:url value="/onememo/auth/Login.do"/>">로그인</a></li>
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item"><a class="nav-link" href="<c:url value="/onememo/auth/Logout.do"/>">로그아웃</a></li>
				</sec:authorize>
				
				<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>				
				<li class="nav-item"><a class="nav-link" href="<c:url value="/onememo/bbs/List.do"/>">한줄 댓글 게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="#">회원가입</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
						인재채용 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">인재상</a> <a class="dropdown-item"
							href="#">채용정보</a> <a class="dropdown-item" href="#">입사지원</a>
					</div></li>
				<li class="nav-item">
					<form class="form-inline" action="#" >
						<input class="form-control mr-sm-2 mt-1" type="text"
							placeholder="검색어 입력">
						<button class="btn btn-success mt-1" type="submit">확인</button>

					</form>
				</li>
			</ul>
		</div>
	</nav>