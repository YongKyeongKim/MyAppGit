<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core 태그 라이브러리용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 국제화 태그 라이브러리용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FormatNumberTag.jsp</title>
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
    		<legend class="w-auto p-3">국제화 : formatNumber 태그</legend>
    		<!-- 필수 속성: value  
			 type속성의 기본값:number
		     groupingUsed속성의 기본값:true(1000단위로 콤마를 찍는다)
		 	-->
		 	<c:set var="money" value="10000"/>		 			 
    		<h3>필수 속성만 사용</h3>
    		<h5>EL로 출력</h5>
    		${money }
    		<h5>JSTL 국제화 태그로 출력</h5>
    		<fmt:formatNumber value="${money }"/>
    		<h3>JSTL 국제화 태그로 출력:천단위 콤마 생략</h3>
    		<fmt:formatNumber value="${money }" groupingUsed="false"/>
    		<h3>type="currency"일때:현지 통화 단위로 출력</h3>
    		<fmt:formatNumber value="${money }" type="currency"/>
    		<h3>type="currency"일때:통화 단위 $로 출력</h3>
    		<fmt:formatNumber value="${money }" type="currency"  currencySymbol="$"/>
    		<h3>type="percent"일때</h3>
    		<!--  숫자 * 100 -->
    		<fmt:formatNumber value="${5/100}" type="percent"/>
    		<h3>원하는 위치에 출력시</h3>
    		<fmt:formatNumber value="${money }" type="currency" var="price"/>
    		<h4>위 가격을 아래에 출력</h4>
    		가격이 ${price} 내렸어요
    		<ul class="list-unstyled">
    		
    		
    		</ul>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>