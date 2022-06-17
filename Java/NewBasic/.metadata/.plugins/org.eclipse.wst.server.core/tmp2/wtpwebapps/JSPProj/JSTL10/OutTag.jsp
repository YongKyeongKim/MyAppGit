<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OutTag.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">out 태그</legend>
    		<c:set var="htmlString"><h4>h4태그로 감싼 문자열</h4></c:set>
    		
    		
    		<h3>EL로 출력</h3>
    		\${htmlString } : ${htmlString }
    		<h3>JSTL의 out태그로 출력-escapeXml="false"(EL과 동일)</h3>
    		<c:out value="${htmlString }" escapeXml="false"/>
    		<h3>JSTL의 out태그로 출력-escapeXml="true"(디폴트-HTML태그가 그대로 출력)</h3>
    		<c:out value="${htmlString }"/>
    		<h3>default속성</h3>
    		<!-- 
			out태그의 value속성의 값이 없을때
			default속성에 지정한 값을 출력함.	
	 	 	-->
	 	 	<ul class="list-unstyled">
	 	 		<li>value="" : <c:out value="" default="빈 문자열이다"/></li>
	 	 		<li>value="null" : <c:out value="null" default="null 문자열이다"/></li>
	 	 		<li>value="\${null}" : <c:out value="${null}" default="null이다"/></li>	 	 	
	 	 	</ul>
    		<h3>페이지 링크에 응용</h3>
    		<c:out value="${param.nowPage}" default="1"/><br/>
    		<a href="<c:url value="/BBS08/List.jsp?nowPage="/><c:out value="${param.nowPage}" default="1"/>">BBS 리스트</a>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>