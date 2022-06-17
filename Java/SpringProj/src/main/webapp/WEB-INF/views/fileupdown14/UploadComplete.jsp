<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>파일업로드 결과</h1>	  
	</div>
	
	<ul class="list-unstyled">
		<li>올린이:${param.writer }</li>
		<li>제목:${param.title }</li>
		<li>원본 파일명:${original}</li>
		<li>실제 서버에 저장된 파일명:${real}</li>
		<li>컨텐츠 타입:${type}</li>
		<li>파일 크기:${size}KB</li>
	</ul>
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		