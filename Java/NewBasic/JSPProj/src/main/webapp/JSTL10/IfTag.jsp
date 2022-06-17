<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IfTag.jsp</title>
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
    		<legend class="w-auto p-3">if태그</legend>
    		<c:set value="100" var="numvar"/>
    		<c:set value="JSTL" var="strvar"/>
    		<!--if태그는 시작 태그와 종료 태그를 사용해서 판단해라.		      
	        else문이 없다. --> 
	        <h3>if태그 기본</h3>
	        <c:if test="${   numvar mod 2 eq 0 }" var="result">
	        	${numvar }는 짝수<br/>	        
	        </c:if>
	        <c:if test="${not result}">
	        	${numvar }는 홀수<br/>	        
	        </c:if>
    		\${result } : ${result }<br/>
    		<!-- 위의 if(JSTL)을 EL의 삼항 연산자로 변경 -->
    		${numvar }는 ${numvar mod 2 eq 0 ? "짝수":"홀수"}
    		<h3>문자열 비교</h3>
    		<c:if test="${strvar =='제이에스티엘' }">
    			${strvar}는 '제이에스티엘'이다
    		</c:if>
    		<c:if test="${strvar =='jstl' }">
    			${strvar}는 'jstl'이다
    		</c:if>
    		<c:if test="${strvar =='JSTL' }">
    			${strvar}는 'JSTL'이다<br/>
    		</c:if>
    		<c:if test="${  true }">
    			항상 출력되는 HTML태그
    		</c:if>
    		<c:if test="${false}">
    			항상 출력안되는 HTML태그
    		</c:if>
    		<!-- 
		 	※test속성에 EL식이 아닌 일반 값을
		 	넣으면 무조건 거짓
		 	단,일반 값이라도 TRUE(true)인(대소문자 상관없이) 경우는 true로 판단
		 	또한 EL식이더라도 \${}양쪽에 빈 공백이
		 	들어가면 무조건 거짓	 	
		  	-->
		  	<h3>test속성에 일반 값으로 조건 설정</h3>
		  	<c:if test="100" var="result">
		  		100는 참이다
		  	</c:if>
		  	\${result } : ${result }<br/>
		  	
		  	<c:if test="tRuE" var="result">
		  		'tRuE'는 참이다<br/>
		  	</c:if>
		  	\${result } : ${result }<br/>
		  	
		  	<c:if test=" tRuE" var="result"><!-- 빈 공백이 역시 없어야 한다 -->
		  		' tRuE'는 참이다<br/>
		  	</c:if>
		  	\${result } : ${result }<br/>
		  	<c:if test="100 > 10" var="result">
		  		100 > 10는 참이다<br/>
		  	</c:if>
		  	\${result } : ${result }<br/>
		  	
		  	<c:if test="${ 100 > 10 }" var="result">
		  		\${ 100 > 10 }는 참이다<br/>
		  	</c:if>
		  	\${result } : ${result }<br/>
		  	<h3>if태그 연습</h3>
		  	 	<!-- 
			   문]파라미터로 아이디(user)와 비밀번호(pass)를
			   받아서
			   아이디가 "KIM"이고 비밀번호가 "1234"인 경우
			   회원이라고 가정하자.
			   회원인 경우 "\${EL로 출력} 님 즐감하세요" 출력
			   비회원인 경우 "아뒤와 비번이 틀려요" 출력
			   단,EL과 JSTL만 사용해서 구현해라-->
			   
			   <c:set var="username" value="${param.user }"/>
			   <c:set var="password" value="${param.pass }"/>
			   <c:if test="${! empty username && not empty password }">
			   		<c:if test="${username=='KIM'  and password eq '1234'}" var="result">
			   			${username}님 즐감하세요
			   		</c:if>
			   		<c:if test="${! result}">
			   			아뒤와 비번이 틀려요
			   		</c:if>
			   </c:if>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>