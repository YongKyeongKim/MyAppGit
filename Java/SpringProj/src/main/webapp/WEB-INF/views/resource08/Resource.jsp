<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>리소스</h1>	  
	  <p>
	  	<kbd>빈 설정파일에서 \${}로 읽어온 경우 : ${xmlel}</kbd><br/>
	  	<kbd>클래스 파일(.java)에서 @Value로 읽어온 경우 : ${javavalue}</kbd>
	  <p>
	</div>
	<!-- 
		  리소스파일:.properties로 끝나는 파일로  스프링 프레임웍에서 자원으로 사용하는 파일
		  키=값의 쌍으로 자원(상수)을 등록한다.
		  주석처리는 #으로
		 
		  리소스 파일은 이클립스의 classpath인 
		  src폴더 밑 어디에든 위치하면 된다.
		  (생성시 new->File로 생성.확장자는 .properties 로)  
	  	-->
	<a href="<c:url value="/Resource/Resource.do"/>">리소스 사용하기</a>
	
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		