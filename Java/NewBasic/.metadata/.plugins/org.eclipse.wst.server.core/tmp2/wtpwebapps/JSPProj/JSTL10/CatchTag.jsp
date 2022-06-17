<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CatchTag.jsp</title>
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
    		<legend class="w-auto p-3">catch 태그</legend>
    		<!-- 
			catch태그:
			-EL에서 오류날때 에러 처리시 주로 사용
			-에러내용을 원하는 위치에서 출력하고자 할때 사용	
			-JSTL문법오류는 catch가 안된다.
		    -->
    		<c:set var="fnum" value="100"/>
    		<c:set var="snum" value="0"/>
    		<h3>에러가 안나는 경우 : 에러내용 저장 안됨</h3>
    		<c:catch var="error">
    		\${fnum/snum } : ${fnum/snum }<br/>
    		</c:catch>
    		\${error } : ${error }
    		<h3>에러가 나는 경우 : 에러내용 저장 됨</h3>
    		<c:catch var="error">
    		\${"백"+100 } : ${"백"+100  }<br/>
    		</c:catch>
    		\${error } : ${error }
    		<h3>JSTL문법 오류는 CATCH가 안됨</h3>
    		<c:catch var="error">
	    		<c:choose>
	    			<!-- 주석 -->
	    			<c:when test="true">
	    				참이다
	    			</c:when>
	    		</c:choose>
	    	</c:catch>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>