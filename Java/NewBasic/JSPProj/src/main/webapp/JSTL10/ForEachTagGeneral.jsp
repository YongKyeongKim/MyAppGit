<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ForEachTagGeneral.jsp</title>
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
    		<legend class="w-auto p-3">forEach 태그-일반 for문 형태</legend>
    		<!-- 
			필수 속성: begin 및 end 그리고  var속성
	            step은 생략가능(생략시 1씩증가)	
	            step에는 0보다 큰 정수값만 가능             
	 		-->
    		<h3>자바코드로 Hn태그 출력</h3>
    		<% for(int i=1;i<=6;i++){ %>
    			<h<%=i %>>제목<%=i %></h<%=i %>>
    		<%} %>
    		<h3>EL과 JSTL로 Hn태그 출력</h3>
    		<c:forEach begin="1" end="6" var="i">
    			<h${i }>제목${i }</h${i }>    		
    		</c:forEach>
    		<h3>varStatus 속성</h3>
    		<!-- varStatus속성에 지정한 변수에는 반복과 관련된 정보를 추상화한 클래스인
             LoopTagStatus객체가 저장됨
     		-->
     		<c:forEach begin="3" end="5" var="i" varStatus="loop">
     			<h5>${loop.count}번째 반복</h5>
     			<ul class="list-unstyled">
     				<li>\${loop.index } : ${loop.index }</li>
    				<li>\${loop.first } : ${loop.first }</li>
    				<li>\${loop.last } : ${loop.last }</li>
    				<li>\${loop.current } : ${loop.current }</li>
    		
    			</ul>
     		</c:forEach>
     		<h3>varStatus 속성 이용한 스타일 변경</h3>
     		<!--문]반복이 짝수번째일때는 글자색을 
              RED로 홀수번째일때는 글자색을 GREEN으로  
              단, 첫번째 반복이라면 글자색을 BLUE로 마지막 반복이면 CYAN  -->
    		<c:forEach begin="1" end="6" var="i" varStatus="loop">
    			<c:choose>
    				<c:when test="${loop.first}">
    					<c:set var="color" value="blue"/>
    				</c:when>
    				<c:when test="${loop.last}">
    					<c:set var="color" value="cyan"/>
    				</c:when>
    				<c:when test="${loop.count % 2==0}">
    					<c:set var="color" value="red"/>
    				</c:when>
    				<c:otherwise>
    					<c:set var="color" value="green"/>
    				</c:otherwise>
    			
    			</c:choose>    		
    			<h${i } style="color:${color}">제목${i }</h${i }>    		
    		</c:forEach>
    		<h3>1부터 100까지 홀수의 합(EL및 JSTL사용)</h3>
    		<c:forEach begin="1" end="100" var="i">
    			<c:if test="${i % 2 !=0 }">
    				<c:set var="sum" value="${sum+i}"/>
    			</c:if>    			
    		</c:forEach>
    		${sum}
    		<h3>for문안의 for문(중첩 for문)</h3>
    		<!-- 
			  1 0 0 0 0
			  0 1 0 0 0
			  0 0 1 0 0
			  0 0 0 1 0
			  0 0 0 0 1	출력
			-->
			<c:forEach begin="1" end="5" var="k">
				<c:forEach begin="1" end="5" var="j">
					<c:if test="${k==j }" var ="result">
						1&nbsp;&nbsp;
					</c:if>
					<c:if test="${!result }">
						0&nbsp;&nbsp;
					</c:if>
				</c:forEach>
				<br/>			
			</c:forEach>
			<h3>구구단 출력</h3>
			<!-- 
	  		문]짝수행에 마우스 오버시 빨강
	  	   	  홀수행에 마우스 오버시 노랑
	  	   	  마우스 아웃시는 흰색 그리고 table태그를 사용해서 출력하여라
	   		-->
	   		<table class="table text-center table-bordered">
	   			
	   			<c:forEach begin="1" end="9" var='i' varStatus="loop">
	   				<c:choose>
		   				<c:when test="${loop.count % 2==0 }">
		   					<c:set var="color" value="red"/>
		   				</c:when>
		   				<c:otherwise>
		   					<c:set var="color" value="yellow"/>
		   				</c:otherwise>
	   				</c:choose>
		   			<tr onmouseover="this.style.backgroundColor='${color}'" onmouseout="this.style.backgroundColor='white'">
						<c:forEach begin="2" end="9" var='k'>
							<td>${k } * ${i } = ${k*i}</td>						
						</c:forEach>					
					</tr>
				</c:forEach>
				
	   		</table>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>