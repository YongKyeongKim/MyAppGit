<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>유효성 검증 완료페이지</h1>	  
	</div>	
	<ul class="list-group list-group-flush">
	  <li class="list-group-item">이름 : ${param.name }</li>
	  <li class="list-group-item">나이 : ${param.years }</li>
	  <li class="list-group-item">성별 : ${param.gender}</li>
	  <li class="list-group-item">관심사항 :${fn:join(inter,',')}</li>
	  <li class="list-group-item">학력 :${param.grade }</li>
	</ul>
	
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		