<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>UrlTag.jsp</title>
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
    		<legend class="w-auto p-3">url 태그</legend>
    		<!-- url생성시 사용]
	     	-절대경로로 생성시에는 역시
	                  컨텍스트 루트 제외 즉 컨텍스트 루트 신경 쓸 필요 없다
	        -var속성 미 지정시에는 해당 위치에
	         url이 출력됨(param태그에 지정한 파라미터가 쿼리스트링으로 연결됨) 
	    	-->
    		
    		<h3>var속성 미 지정</h3>
    		<c:url value="/JSTL10/ImportedPage.jsp?user=PARK&pass=1234"/>
    		<hr/>
    		<!-- 무조건 /로 시작 /는 webapp의미 -->
    		<c:url value="/JSTL10/ImportedPage.jsp">
    			<c:param name="user" value="KIM"/>
    			<c:param name="pass" value="1234"/>
    		</c:url>
    		<h3>var속성 지정</h3>
    		<c:url value="/JSTL10/ImportedPage.jsp" var="url">
    			<c:param name="user" value="KIM"/>
    			<c:param name="pass" value="1234"/>
    		</c:url>
    		
    		<h3>내가 원하는 위치에서 생성한 url(절대경로)사용</h3>
    		<a href="${url }">ImportedPage.jsp</a>
    		<h3>HTML태그안에서 JSTL로 절대경로 지정시 주로 사용</h3>
    		<a href="<c:url value="/JSTL10/ImportedPage.jsp?user=lee&pass=9090"/>">ImportedPage.jsp</a>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>