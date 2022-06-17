<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>관점지향 프로그래밍</h1>	 
	  <p>${total}</p> 
	</div>
	
	<ul class="list-unstyled">
		<li><a href="<c:url value="/AOP/Aop.do"/>" >AOP</a></li>
	</ul>
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		