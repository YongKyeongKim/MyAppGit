<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core 태그 라이브러리용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 국제화 태그 라이브러리용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 문자열이나 컬렉션등을 처리하기 위한 함수 라이브러리 -->
<!-- 사용법:EL에서 사용.태그형태 가 아님 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FunctionOfJSTL.jsp</title>
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
    		<legend class="w-auto p-3">JSTL의 함수 라이브러리</legend>
    		<!-- JSTL에서 제공하는 함수들은 EL에서 호출 해야한다 
                         호출방법: \${접두어:함수명([매개변수들])}
             JSTL의 모든 함수는 항상 값을 반환한다. 
        	-->
        	<!--  데이타 준비 -->
        	<% String[] mountains={"한라산","성인봉","태백산","덕유산"}; %>
    		<fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 M월 dd일" var="today"/>
    		<c:set var="todayString">Today는 ${today } 입니다</c:set>
    		<c:set var="interString">Politics,Economics,Entertainments,Sports</c:set>
    		<c:set var="array" value="<%=mountains %>"/>
    		<c:set var="collection" value="<%=new HashMap() %>"/>
    		<c:set target="${collection }" property="user" value="kosmo"/>
    		<c:set target="${collection }" property="pass" value="1234"/>
    		\${todayString } : ${todayString }
    		
    		<h3>int length(Object)</h3>
    		<!-- 
	     	문자열인 경우는 문자열의 길이 반환
	     	(한글 1자도 길이 1로 처리)
	     	배열인 경우는 배열의 크기(즉 메모리 개수) 반환
	    	컬렉션인 경우는 컬렉션에 저장된 객체의 수 반환 
	     	-->   		
    		<ul class="list-unstyled">
    			<li>문자열의 길이 : ${fn:length(todayString) }</li>
    			<li>배열의 크기 : ${fn:length(array) }</li>
    			<li>컬렉션에 저장된 객체 수(JSTL 함수 사용) : ${fn:length(collection) }</li>
    			<li>컬렉션에 저장된 객체 수(자바객체 메소드 사용) : ${collection.size()}</li>    		
    		</ul>
    		<h5>컬렉션에 저장된 객체 여부 판단:JSTL 함수 사용</h5>
    		<c:if test="${fn:length(collection) !=0}" var="result">
    			<c:forEach var="item" items="${collection }">
    				${item.key } : ${item.value }<br/>
    			</c:forEach>    		
    		</c:if>
    		<c:if test="${! result }">
    			저장된 객체가 없어요
    		</c:if>
    		<h5>컬렉션에 저장된 객체 여부 판단:자바객체 메소드 사용</h5>
    		<c:if test="${collection.size() !=0 or not empty collection}" var="result">
    			<c:forEach var="item" items="${collection }">
    				<!-- 키=값  형태로 출력됨-->
    				${item}<br/>
    			</c:forEach>    		
    		</c:if>
    		<c:if test="${! result }">
    			저장된 객체가 없어요
    		</c:if>
    		<h3>String substring(문자열,시작인덱스,끝인덱스)</h3>
    		<!-- 
		       문자열에서 시작인덱스부터 끝인덱스-1까지 추출, 
		       끝인덱스가 -1 인경우 시작인덱스부터 
		       문자열 끝까지 추출
		       인덱스는 0부터 시작
		    -->
		    <ul class="list-unstyled">
		    	<li>Toaday 추출 :${fn:substring(todayString,0,5) }</li>
		    	<li>날짜부분부터 끝까지 추출 :${fn:substring(todayString,7,-1) }</li>
		    	<li>날짜부분부터 끝까지 추출 :${fn:substring(todayString,7,fn:length(todayString)) }</li>
		    </ul>
		    <h3>String substringAfter(문자열,str):str이후의 문자열 반환</h3>
		    "Today" 이후의 문자열 추출 : ${fn:substringAfter(todayString,"는 ") }
		    <h3>String substringBefore(문자열,str):str이전의 문자열 반환</h3>
		    "는" 이전의 문자열 추출 : ${fn:substringBefore(todayString,"는") }
		    <h3>String replace(문자열,src,dest)</h3>
		    ${fn:replace(todayString,"Today","Tomorrow") }
		    <h4>문]todayString에서 Today는 Tomorrow로 11은 12로 replace하여라</h4>
		    <c:set var="temp" value='${fn:replace(todayString,"Today","Tomorrow") }'/>
		    ${fn:replace(temp,"11","12") }<br/>
		    ${fn:replace(fn:replace(todayString,"Today","Tomorrow"),"11","12") }
		    <h3>String trim(문자열):양쪽의 공백 제거</h3>
		    트림 전: X${"    J  S T  L   "}Y<br>
		    트림 후: X${fn:trim("    J  S T  L   ")}Y
		    <h3>boolean startsWith(문자열,str)</h3>
		    ${fn:startsWith(todayString,"To") }
		    <h3>boolean endsWith(문자열,str)</h3>
		    ${fn:endsWith(todayString,"다") }
		    <h3>String[] split(문자열,delim)</h3>
		    <c:forEach var="item" items="${fn:split(interString,',') }">
		    	${item }<br/>		    	
		    </c:forEach>
		    <h3>String escapeXml(문자열):태그를 그대로 출력하고자 할때</h3>
		    ${fn:escapeXml("<h3>함수 라이러리 사용</h3>") }<br/>
		    <c:out value="<h3>코어 라이러리 사용</h3>" />
		    <h3>String join(String[],str):모든 배열 요소를 str로 연결해서 하나의 문자열로 반환</h3>
		    ${fn:join(array,'▲') }
		    <h3>int indexOf(str1,str2)</h3>
		    ${fn:indexOf(todayString,'Day') }<br/>
		    ${fn:indexOf(todayString,'day') }
		    <h3>boolean contains(str1,str2)</h3>
		    ${fn:contains(todayString,'Day') }<br/>
		    ${fn:contains(todayString,'day') }
		    <h3>boolean containsIgnoreCase(str1,str2)</h3>
		    ${fn:containsIgnoreCase(todayString,'Day') }<br/>
		    ${fn:containsIgnoreCase(todayString,'day') }
		    <h3>String toUpperCase(String) 및 String toLowerCase(String)</h3>
		    ${fn:toUpperCase(interString) }<br/>
		    ${fn:toLowerCase(interString) }
    	</fieldset>
  	</div><!-- container -->
</body>
</html>