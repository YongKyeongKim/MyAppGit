<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>핸들러 매핑</h1>	  
	</div>
	<h3>디폴트(기본) 핸들러 매핑</h3>
	<ul class="list-unstyled">
		<li><a href="<c:url value="/HandlerMapping/BeanNameUrl.do"/>">BeanNameUrlHandlerMapping</a></li>
		<li><a href="<c:url value="/HandlerMapping/Annotation.do"/>">DefaultAnnotationHandlerMapping</a></li>
	</ul>
	<h3>SimpleUrlHandlerMapping(디폴트(기본) 핸들러 매핑이 아님)</h3>
	<ul class="list-unstyled">
		<li><a href="<c:url value="/HandlerMapping/SimpleUrlFirst.do"/>">SimpleUrlFirst.do</a></li>
		<li><a href="<c:url value="/HandlerMapping/SimpleUrlSecond.do"/>">SimpleUrlSecond.do</a></li>
	</ul>
	<kbd>${message}</kbd>
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
