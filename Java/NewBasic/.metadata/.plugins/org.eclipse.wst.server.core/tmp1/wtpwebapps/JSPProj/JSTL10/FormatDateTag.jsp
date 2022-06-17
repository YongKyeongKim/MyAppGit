<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FormatDateTag.jsp</title>
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
    		<legend class="w-auto p-3">formatDate 태그</legend>
    		<c:set var="today" value="<%=new Date() %>"/>
    		<!-- 
			 value는 필수속성 ,단 날짜타입이 와야됨
			 type은 기본값:date
		     dateStyle 기본값 :default
		 	-->
    		
    		<h3>필수 속성만 사용</h3>
    		<h5>EL로 출력</h5>
    		${today}
    		<h5>JSTL의 국제화 태그로 출력</h5>
    		<fmt:formatDate value="${today }"/>
    		<h3>type="date"(디폴트),dateStyle="default"</h3>
    		<fmt:formatDate value="${today }" type="date" dateStyle="default"/>
    		<h3>type="date"(디폴트),dateStyle="short"</h3>
    		<fmt:formatDate value="${today }" type="date" dateStyle="short"/>
    		<h3>type="date"(디폴트),dateStyle="medium"</h3>
    		<fmt:formatDate value="${today }" type="date" dateStyle="medium"/>
    		<h3>type="date"(디폴트),dateStyle="long"</h3>
    		<fmt:formatDate value="${today }" type="date" dateStyle="long"/>
    		<h3>type="date"(디폴트),dateStyle="full"</h3>
    		<fmt:formatDate value="${today }" type="date" dateStyle="full"/>
    		<hr/>
    		<h3>type="time"(디폴트),timeStyle="default"</h3>
    		<fmt:formatDate value="${today }" type="time" timeStyle="default"/>
    		<h3>type="time"(디폴트),dateStyle="short"</h3>
    		<fmt:formatDate value="${today }" type="time" timeStyle="short"/>
    		<h3>type="time"(디폴트),dateStyle="medium"</h3>
    		<fmt:formatDate value="${today }" type="time" timeStyle="medium"/>
    		<h3>type="time"(디폴트),dateStyle="long"</h3>
    		<fmt:formatDate value="${today }" type="time" timeStyle="long"/>
    		<h3>type="time"(디폴트),dateStyle="full"</h3>
    		<fmt:formatDate value="${today }" type="time" timeStyle="full"/>
    		<h3>pattern속성 - type속성 의미 없다(주로 사용)</h3>
    		<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
    		<fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일 HH시 입니다"/><br/>
    		<fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일 EEEE"/><br/>
    		<h3>var속성 지정해서 원하는 위치에 출력</h3>
    		<fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일 EEEE" var="promise"/>
    		모임 날짜는 ${promise } 입니다
    	</fieldset>
  	</div><!-- container -->
</body>
</html>