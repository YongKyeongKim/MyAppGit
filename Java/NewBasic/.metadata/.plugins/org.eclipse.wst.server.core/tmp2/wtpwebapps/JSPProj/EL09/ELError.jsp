<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ELError.jsp</title>
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
    		<legend class="w-auto p-3">EL에서 에러나거나 혹은 출력이 안되는 경우</legend>
    		<h4>+를 숫자형식이 아닌 문자열에 적용시(에러)</h4>
    		<ul class="list-unstyled">
    			<li>\${'100'+100 }[정상] : ${'100'+100 }</li>
    			<li>\${'백'+100 }[500에러] : \${'백'+100 }</li>
    			<li>\${'HELLO'+' HI' }[500에러] : \${'HELLO'+' HI'}</li>    		
    		</ul>
    		<h4>.인덱스번호 형식으로 배열이나 리스트계열 컬렉션 요소에 접근시(에러)</h4>
    		<%
    			String[] mountains={"설악산","소백산","비슬산","덕유산"};//mountains[0]
    			List collection = Arrays.asList(mountains);//collection.get(0)
    			//아래 두 줄의 코드를 JSTL로 변경
    			//pageContext.setAttribute("mountains", mountains);
    			//pageContext.setAttribute("collection", collection);
    		%>
    		<c:set var="mountains" value="<%=mountains%>"/>
    		<c:set var="collection" value="<%=collection%>"/>
    		${mountains}<br/>
    		${collection}
    		<ul class="list-unstyled">
    			<li>\${mountains[0]}[정상] : ${mountains[0]}</li>
    			<li>\${collection[0]}[정상] : ${collection[0]}</li>
    			<!-- 아래 두 줄은 Failed to parse the expression -->
    			<li>\${mountains.0}[에러] : \${mountains.0}</li>
    			<li>\${collection.0}[에러] : \${collection.0]}</li>
    		</ul>
    	</fieldset>
    	<h4>배열이나 리스트계열 컬렉션의 인덱스를 벗어난 경우(에러 NO,출력 NO)</h4>
    	<ul class="list-unstyled">
    		<li>\${mountains[100]} : ${mountains[100]}</li>
    		<li>\${mountains[100]==null} : ${mountains[100]==null}</li>
    		<li>\${collection[100]} : ${collection[100]}</li>
    		<li>\${collection[100]==null} : ${collection[100]==null}</li>
    	</ul>
    	<h4>없는 속성이거나 속성은 존재하지만 getter가 없는 경우(에러)-자바빈의 경우</h4>
    	<c:set value='<%=new MemberDTO("KIM","1234","김길동","20") %>' var="member"/>
    	<ul class="list-unstyled">
    		<li>없는 속성 접근 [PropertyNotFoundException에러] : \${member.addr}</li>
    		<li>속성은 존재,getter가 없는 경우 [PropertyNotFoundException에러] : \${member.id}</li>
    		<!-- membar.id 는 null이다 -->
    		<li>EL변수명이 틀린 경우(에러 NO,출력 NO) :${membar.id}</li>
    	</ul>
    	<h4>EL 내장개체의 없는 속성으로 접근시</h4>
    	<!-- 
  		EL의 내장객체중 사용자가 정의한 속성에 접근하는 
		내장객체(xxxScope계열/param계열등) 및 맵 컬렉션인 경우, 
		존재하지 않은 속성이나 키값으로 접근시 null임으로 에러는 안나고 출력만 안됨
  	 	-->
  	 	<c:set var="myrequest" value="리퀘스트 영역" scope="request"/>
  	 	<%
  	 		Map map = new HashMap();
  	 		map.put("mymap","맵 컬렉션");		
  	 	
  	 	%>
  	 	<c:set var="map" value="<%=map %>"/>
  	 	<ul class="list-unstyled">
  	 		<li>\${requestScope.myrequest } : ${requestScope.myrequest }</li>
  	 		<li>\${requestScope.yourrequest } : ${requestScope.yourrequest }</li>
  	 		<li>\${map.mymap } : ${map.mymap }</li>
  	 		<li>\${map.yourmap } : ${map.yourmap }</li>
  	 		<li>\${map.noproperty }[PropertyNotFoundException에러] : \${pageContext.noproperty }</li>
  	 	</ul>
  	 	<h4>숫자를 0으로 나누면 Infinity</h4>
  	 	\${100 /0  } : ${100 /0  }
  	 	<h4>임의의  변수로 .을 통해서 접근시-에러 NO,출력 NO</h4>
  	 	\${myvar } : ${myvar }<br/>
  	 	\${myvar.num } : ${myvar.num}
  	 	
  	 	
  	</div><!-- container -->
</body>
</html>
