<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>업로드된 파일 목록</h1>	  
	</div>
	<h2>File[]일때</h2>
	<ul class="list-unstyled">	
		<c:forEach var="file" items="${files}">
			<li>파일명 : ${file.name}, 파일 크기 : ${fn:substringBefore(Math.ceil(file.length()/1024.0),".")}KB</li>
		</c:forEach>	
	</ul>
	<h2>컬렉션일때</h2>
	<ul class="list-unstyled">	
		<c:forEach var="map" items="${list}">
			<li><a href="<c:url value="/FileUpDown/FileDownload.do?filename=${map.fileName}"/>">파일명 : ${map.fileName}, 파일 크기 : ${map.fileSize}KB</a></li>
		</c:forEach>	
	</ul>
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		