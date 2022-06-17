<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />
<!-- 
	컨트롤러 메소드 작성 규칙]
	
	 접근지정자 : public
	 반환타입 : 주로 String(뷰정보를 문자열로 반환)
	 메소드명: 임의
	 인자 : 원하는 타입을 사용할 수 있다(단, 사용할 수 있는 타입이 정해져 있다)
	       어노테이션도 가능
	 예외를 throws할 수 있다(선택) 
	 

 -->
<div class="container">    
 	<div class="jumbotron">
	  <h1>컨트롤러 <small>${message}</small></h1>	  
	</div>
	<h3>하나의 컨트롤러 클래스,하나의 컨트롤러 메소드로 여러 요청 처리하기1</h3>
	<ul class="list-unstyled">
		<li><a href="<c:url value="/Controller/OneClass/List.do"/>" >목록요청</a></li>
		<li><a href="<c:url value="/Controller/OneClass/Edit.do"/>" >수정요청</a></li>
		<li><a href="<c:url value="/Controller/OneClass/Delete.do"/>" >삭제요청</a></li>
		<li><a href="<c:url value="/Controller/OneClass/View.do"/>" >상세보기요청</a></li>
	</ul>
	<h3>하나의 컨트롤러 클래스,하나의 컨트롤러 메소드로 여러 요청 처리하기2</h3>
	<ul class="list-unstyled">
		<li><a href="<c:url value="/Controller/OneClassParam/List.do?crud=read-list"/>" >목록요청</a></li>
		<li><a href="<c:url value="/Controller/OneClassParam/Edit.do?crud=update"/>" >수정요청</a></li>
		<li><a href="<c:url value="/Controller/OneClassParam/Delete.do?crud=delete"/>" >삭제요청</a></li>
		<li><a href="<c:url value="/Controller/OneClassParam/View.do?crud=read-one"/>" >상세보기요청</a></li>
	</ul>
	<h3>하나의 컨트롤러 클래스,여러개의 컨트롤러 메소드로 여러 요청 처리하기</h3>
	<ul class="list-unstyled">
		<li><a href="<c:url value="/Controller/MultiMethod/List.do"/>" >목록요청</a></li>
		<li><a href="<c:url value="/Controller/MultiMethod/Edit.do"/>" >수정요청</a></li>
		<li><a href="<c:url value="/Controller/MultiMethod/Delete.do"/>" >삭제요청</a></li>
		<li><a href="<c:url value="/Controller/MultiMethod/View.do"/>" >상세보기요청</a></li>
	</ul>
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		