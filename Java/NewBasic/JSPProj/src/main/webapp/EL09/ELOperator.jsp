<%@page import="java.util.Collection"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ELOperator</title>
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
    		<legend class="w-auto p-3">EL의 연산자들</legend>
    		<!-- EL에서 null이 연산에 참여시 0으로 처리된다 -->
    		<ul class="list-unstyled">
    			<li>\${null +10} : ${null +10}</li>
    			<li>\${null *10} : ${null *10}</li>
    			<li>param 내장객체 : ${param }</li>
    			<li>\${param.myparam+10 } : ${param.myparam+10 }</li>
    			<li>\${param['myparam']+10 } : ${param["myparam"]+10 }</li>
    			<% String varInScriptlet="스크립틀릿에서 선언한 변수"; %>
    			<!-- EL 표현식 \${}에서는 JSP의 스크립팅 요소에서 선언한
	          	 변수를 직접 사용 못한다.값이 출력 안됨.	-->
	    		<!-- null로 처리됨 -->
	    		<!-- 고로 EL식에서 사용할 변수는 JSTL을 이용해서 선언해야 한다. -->
    			<li>\${varInScriptlet } : ${varInScriptlet }</li>
    			<li>\${varInScriptlet==null } : ${varInScriptlet==null }</li>
    		</ul>
    		<h4>JSTL로 EL에서 사용할 변수 선언</h4>
    		<c:set var="varInScriptlet" value="<%=varInScriptlet %>" />
    		\${varInScriptlet } : ${varInScriptlet }<br/>
    		\${pageScope.varInScriptlet } : ${pageScope.varInScriptlet }
    		<h4>EL변수에 값 할당 불가  </h4>
    		<!-- 톰캣 8.0부터는 할당 가능(비 권장):el-api.jar변경됨. -->
    		<c:set var="fnum" value="9"/>
    		<c:set var="snum" value="5"/>
    		\${fnum=100} : ${fnum=100}
    		<h4>EL의 산술 연산자</h4>
    		<ul class="list-unstyled">
    			<li>\${fnum + snum} : ${fnum + snum}</li>
    			<li>\${fnum - snum} : ${fnum - snum}</li>
    			<li>\${fnum * snum} : ${fnum * snum}</li>
    			<li>\${fnum / snum} : ${fnum / snum}</li>
    			<li>\${fnum div snum} : ${fnum div snum}</li>
    			<li>\${fnum % snum} : ${fnum % snum}</li>
    			<li>\${fnum mod snum} : ${fnum mod snum}</li>
    			<!-- EL에서는 숫자형식의 문자열을 자동으로 숫자로 형변환 -->	
    			<li>\${'100' + 100} : ${'100' + 100}</li>
    			<!-- EL에서 +는 숫자 연산에만 사용가능.문자열 연결시 에러 -->
    			<li>\${'HELLO' + " EL!!"} : \${'HELLO' + " EL!!"}</li>
    		</ul>
    		<h4>EL의 비교 연산자</h4>
    		<c:set var="fnum" value="100"/>
    		<c:set var="snum" value="9"/>
    		<!-- 
			EL에서 비교 연산자를 이용한  비교 연산시에는 
			JSTL에서 선언한 변수에 저장된 값을
			모두 문자열로 인식하여 String클래스의 
			compareTo()메소드 방식으로
			비교한다. 즉 첫번째 문자부터 하나씩 비교해 나간다.
			단,실제 숫자 비교시에는 정상적인 숫자 비교가 
			이루어짐.
			 -->
			<ul class="list-unstyled">
				<li>\${fnum > snum } : ${fnum > snum }</li>
				<!-- 문자열 비교가 이루어 진다 -->
				<li>\${"100" > "9" } : ${"100" > "9" }</li>
				<!-- 문자열 "100"이 숫자 100으로 자동 변환 -->
				<li>\${"100" > 9 } : ${"100" > 9 }</li>
				<li>\${100 > 9 } : ${100 > 9 }</li>
				<li>\${"JSP" > 'JSP' } : ${"JSP" > 'JSP' }</li>
				<!--
	 			자바에서는 문자열 동등 비교시 equals()메소드로 
	 			비교하나 EL에서는 ==로 비교 
	 		    -->
				<li>\${"JSP" == 'JSP' } : ${"JSP" == 'JSP' }</li>
				<li>\${"JSP" eq 'JSP' } : ${"JSP" eq 'JSP' }</li>
				<li>\${"JSP" != 'JSP' } : ${"JSP" != 'JSP' }</li>
				<li>\${"JSP" ne 'JSP' } : ${"JSP" ne 'JSP' }</li>
			</ul> 
    		<h4>EL의 논리 연산자</h4>
    		<ul class="list-unstyled">
    			<li>\${5 >2 && 10 !=10 } : ${5 >2 && 10 !=10 }</li>
    			<li>\${5 gt 2 and 10 ne 10 } : ${5 gt 2 and 10 ne 10 }</li>
    			<li>\${5 >= 2 || 10 < 10 } : ${5 >= 2 || 10 < 10}</li>
    			<li>\${5 ge 2 or 10 lt 10 } : ${5 ge 2 or 10 lt 10}</li>
    		</ul>
    		<h4>EL의 삼항 연산자</h4>
    		\${ 10 gt 9 ? "10은 9보다 크다"  : '10은 9보다 크지 않다' } :
    		${ 10 gt 9 ? "10은 9보다 크다"  : '10은 9보다 크지 않다' }
    		<h4>EL의 empty연산자</h4>
    		<!-- 
			null이거나 
			""(빈문자열)이거나 
			배열인 경우는 길이가 0이거나
			컬렉션인 경우는 size가 0인 경우 true반환
		 
		   empty연산자 사용법 : \${empty el변수}
		   true나 false반환 
	   	  -->
	   	  <%
	   	  String nullString=null;
	   	  String emptyString="";
	   	  Integer[] zeroLength= new Integer[0];
	   	  Collection zeroSize = new Vector();	   	  
	   	  %>
	   	  <!-- JSTL로 EL에서 사용할 변수 선언 -->
	   	  <c:set var="nullString" value="<%=nullString %>"/>
	   	  <c:set var="emptyString" value="<%=emptyString %>"/>
	   	  <c:set var="zeroLength" value="<%=zeroLength %>"/>
	   	  <c:set var="zeroSize" value="<%=zeroSize %>"/>
	   	  <ul class="list-unstyled">
	   	  	<li>\${empty nullString } : ${empty nullString }</li>
	   	  	<li>\${empty emptyString} : ${empty emptyString}</li>
	   	  	<li>\${emptyString == null} : ${emptyString == null}</li>
	   	  	<li>\${empty nullString } : ${empty nullString }</li>
	   	  	<li>\${empty zeroLength} : ${empty zeroLength}</li>
	   	  	<li>\${empty zeroSize} : ${empty zeroSize}</li>
	   	  </ul>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>