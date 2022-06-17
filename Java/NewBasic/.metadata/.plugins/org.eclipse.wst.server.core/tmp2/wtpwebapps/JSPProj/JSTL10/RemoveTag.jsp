<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RemoveTag.jsp</title>
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
    		<legend class="w-auto p-3">remove태그</legend>
    		<!-- 각 영역에 JSTL을 이용해서 속성 저장 -->
    		<my:set var="pagevar" value="페이지 영역" />
    		<my:set var="pagevar" value="리퀘스트 영역1" scope="request"/>
    		<my:set var="requestvar" value="리퀘스트 영역2" scope="request" />
    		<my:set var="sessionvar" value="세션 영역" scope="session" />
    		<my:set var="applicationvar" value="어플리케이션 영역" scope="application" />
    		<h3>삭제 전 출력</h3>
    		<ul class="list-unstyled">
    			<ul class="list-unstyled">
    			<li>pagevar : ${pagevar}</li>
    			<li>pagevar : ${requestScope.pagevar}</li>
    			<li>requestvar : ${requestvar}</li>
    			<li>sessionvar : ${sessionvar}</li>
    			<li>applicationvar : ${applicationvar}</li>
    		</ul>
    		<!-- 삭제만 안됨(세션영역에 키가 없으니까) -->
    		<my:remove var="requestvar" scope="session"/>
    		<h3>영역이 다른 경우</h3>
    		<ul class="list-unstyled">
    			<ul class="list-unstyled">
    			<li>pagevar : ${pagevar}</li>
    			<li>pagevar : ${requestScope.pagevar}</li>
    			<li>requestvar : ${requestvar}</li>
    			<li>sessionvar : ${sessionvar}</li>
    			<li>applicationvar : ${applicationvar}</li>
    		</ul>
    		<!-- 영역 미 지정시 모든 영역에서 동일한 이름의 속성들이 삭제된다 -->
    		<my:remove var="pagevar"/>
    		<h3>동일한 속성명 삭제(영역 미 지정) 경우</h3>
    		<ul class="list-unstyled">
    			<ul class="list-unstyled">
    			<li>pagevar : ${pagevar}</li>
    			<li>pagevar : ${requestScope.pagevar}</li>
    			<li>requestvar : ${requestvar}</li>
    			<li>sessionvar : ${sessionvar}</li>
    			<li>applicationvar : ${applicationvar}</li>
    		</ul>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>