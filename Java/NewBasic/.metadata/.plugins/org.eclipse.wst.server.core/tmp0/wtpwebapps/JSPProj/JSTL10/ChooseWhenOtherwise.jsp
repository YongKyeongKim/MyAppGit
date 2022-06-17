<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ChooseWhenOtherwise.jsp</title>
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
			<h1>JSTL(JSP Standard Tag Library)</h1>
		</div>
		<!--container-fluid-->
	</div>
	<!--jumbotron-fluid-->
	<div class="container">
		<fieldset class="form-group border p-3">
			<legend class="w-auto p-3">choose~when~otherwise태그</legend>
			<!-- EL에서 사용할 변수 설정 -->
			<c:set var="numvar" value="99" />
			<c:set var="strvar" value="자바" />

			<h3>if태그로 짝/홀수 판단</h3>
			<c:if test="${numvar % 2 ==0 }" var="result">
    			${numvar}는 짝수
    		</c:if>
			<c:if test="${not result}">
				<!-- HTML주석입니다 -->
    			${numvar}는 홀수
    		</c:if>
			<h3>choose~when~otherwise태그로 짝/홀수 판단</h3>
			<!--choose태그안에 주석시 에러 .반드시 when~otherwise절만..-->
			<c:choose>

				<c:when test="${numvar % 2 ==0 }">
					<!-- HTML주석입니다 -->
    				${numvar}는 짝수
    			</c:when>
				<c:otherwise>
					<!-- HTML주석입니다 -->
    				${numvar}는 홀수
    			</c:otherwise>
			</c:choose>
			<h3>choose~when~otherwise태그로 문자열 비교</h3>
			<c:choose>
				<c:when test="${strvar=='JAVA' }">
    				${strvar }는 'JAVA'
    			</c:when>
				<c:when test="${strvar=='java' }">
    				${strvar }는 'java'
    			</c:when>
				<c:when test="${strvar=='자바' }">
    				${strvar }는 '자바'
    			</c:when>
			</c:choose>
			<form>
				<div class="form-group">
					<label><kbd class="lead">국어</kbd></label> <input type="text"
						class="form-control" name="kor" placeholder="국어점수를 입력하세요">
				</div>
				<div class="form-group">
					<label><kbd class="lead">영어</kbd></label> <input type="text"
						class="form-control" name="eng" placeholder="영어점수를 입력하세요">
				</div>
				<div class="form-group">
					<label><kbd class="lead">수학</kbd></label> <input type="text"
						class="form-control" name="math" placeholder="수학점수를 입력하세요">
				</div>

				<button type="submit" class="btn btn-primary">확인</button>
			</form>
			<!-- 국영수 점수를  받아서 평균이
		    90점이상이면 "A학점"출력
		    80점이상이면 "B학점"출력
		    70점이상이면 "C학점"출력
		    60점이상이면 "D학점"출력
		    60점미만이면 "F학점"출력.
		    단,EL과 JSTL만을 사용하여라
		   -->
			<c:set var="kor" value="${param.kor }" />
			<c:set var="eng" value="${param.eng }" />
			<c:set var="math" value="${param.math }" />
			<c:if test="${! empty kor && !empty eng && !empty math }"><!-- 입력한 경우 -->
				
				<c:if test="${my:isNumber(kor) && my:isNumber(eng) && my:isNumber(math) }" var="isNumber">
					<!-- 평균 저장 -->
					<c:set var="avg" value="${(kor+eng+math) /3 }" />
					<c:choose>
						<c:when test="${avg >=90 }">
							<c:set var="level" value="A학점" />
						</c:when>
						<c:when test="${avg >=80 }">
							<c:set var="level" value="B학점" />
						</c:when>
						<c:when test="${avg >=70 }">
							<c:set var="level" value="C학점" />
						</c:when>
						<c:when test="${avg >=60 }">
							<c:set var="level" value="D학점" />
						</c:when>
						<c:otherwise>
							<c:set var="level" value="F학점" />
						</c:otherwise>
					</c:choose>
					<hr/>
					<div class="alert alert-success">
						<strong>${level }</strong>
					</div>
				</c:if>
				<hr/>
				<c:if test="${not isNumber }">
					숫자만 입력하세요....
				</c:if>
			</c:if>
			<!--
	           회원인 경우 "?님 반갑습니다"
	           아닌 경우 "로그인후 이용하세요"출력.
	           단,자신만의 태그라이브러리를 만들어
	           EL식으로 호출하여라 그리고 
	           실제 멤버 테이블을 연동(BBS게시판에서 사용했던 회원테이블 연동)하여라.
	        --> 
			<hr/>
			<form class="form-inline">
				<label>아이디</label> 
				<input type="text" name="id" class="form-control mx-2"/> 
				<label>비밀번호</label> 
				<input type="password" name="pwd" class="form-control mx-2" /> 
				<input type="submit" class="btn btn-danger mx-2" value="로그인" />
			</form>
			<c:set var="id" value="${param.id}" />
			<c:set var="pwd" value="${param.pwd}" />
			<c:if test="${!empty id && ! empty pwd }">
				<c:choose>
					<c:when test="${my:isMember(id,pwd,pageContext.servletContext ) }">
						<kbd>${id }님 반갑습니다</kbd>
					</c:when>
					<c:otherwise>
						<kbd>로그인후 이용하세요</kbd>
					</c:otherwise>
				</c:choose>			
			</c:if>
		</fieldset>
	</div>
	<!-- container -->
</body>
</html>