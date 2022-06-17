<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>뷰 리졸버 <small>Scope : ${requestScope.message } ,Parameter : ${param.message}</small></h1>	  
	</div>
	<a href="<c:url value="/ViewResolver/ViewResolver.do"/>">InternalResourceViewResolver</a>
	
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		