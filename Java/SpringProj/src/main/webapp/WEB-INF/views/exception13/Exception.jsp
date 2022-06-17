<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>스프링 예외처리</h1>	
	  <p>${message }</p>  
	</div>
	<form class="form-inline"
			action="<c:url value="/Exception/Exception.do"/>"
			method="post">
			<label>나이</label> 
			<input type="text" name="years"	class="form-control mx-2" /> 
			<input	type="submit" class="btn btn-danger mx-2" value="로그인" />
		</form>
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		