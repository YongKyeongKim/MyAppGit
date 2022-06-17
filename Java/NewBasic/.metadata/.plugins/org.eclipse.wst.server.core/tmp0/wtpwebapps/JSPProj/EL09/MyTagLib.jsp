<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytag.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MyTagLib.jsp</title>
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
	      <h1>Expression Language</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">내가 만든 커스텀 태그 라이브러리 사용하기</legend>
    		\${my:isNumber("100사") } : ${my:isNumber("100사") }<br/>
    		\${my:isNumber("1004") } : ${my:isNumber("1004") }<br/>
    		\${my:getGender('123456-1234567') }:${my:getGender('123456-1234567') }<br/>
    		\${my:getGender('123456-8234567') }:${my:getGender('123456-8234567') }<br/>
    		<c:if test="${not empty param.years }">
    			<c:if test="${not my:isNumber(param.years) }" var="result">
    			 나이는 숫자만....
    			</c:if>  
    			
    			<c:if test="${not result }">
    			  당신의 10년후 나이는 ${param.years +10 }살 입니다.
    			</c:if>  		
    		</c:if>
    		
    	</fieldset>
  	</div><!-- container -->
</body>
</html>
