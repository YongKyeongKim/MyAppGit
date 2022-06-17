<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>컨트롤러</h1>	  
	</div>
	<h3>하나의 컨트롤러 클래스로 여러 요청 처리하기(요청 수만큼 컨트롤러 메소드 생성)</h3>
	<ul class="list-unstyled">
		<li><a href="<c:url value="/Controller/OneClass/List.do"/>" >목록요청</a></li>
	</ul>
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		