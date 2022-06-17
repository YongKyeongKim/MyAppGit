<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
JSTL사용]
1]WEB-INF/lib폴더에 필요한 jar파일 추가
2]taglib지시어를 JSP페이지에 추가.
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SetTagIndex.jsp</title>
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
    		<legend class="w-auto p-3">set태그</legend>
    		<!-- 
			var속성:문자열만
			value속성:값(문자열이든 숫자든),표현식,EL식 모두 가능
			scope속성:문자열만(
				"page","request","session","application"중 
				하나)"page"가 기본 값			         
		 	-->
    		<h3>set태그로 EL에서 사용할 변수 설정</h3>
    		<ul class="list-unstyled">
    			<li>value속성에 직접 값 설정 : <c:set var="directvar" value="100"/> </li>
    			<!-- 위 JSTL코드는 아래의 자바코드와 같다 -->
    			<% pageContext.setAttribute("directvar","100"); %>
    			<li>value속성에 EL로 값 설정 : <c:set var="elvar" value="${directvar}"/> </li>
    			<li>value속성에 표현식으로 값 설정 : <c:set var="expvar" value="<%=new Date(new java.util.Date().getTime()) %>"/></li>
    			<li>시작태그와 종료태그사이에 값 설정 : <c:set var="betweenvar"><h4>시작태그와 종료태그</h4>사이에 값을 설정합니다</c:set></li>
    		</ul>
    		<h3>set태그로 설정한 값 출력하기</h3>
    		<h5>자바코드(스크립팅요소)로 출력</h5>
    		<ul class="list-unstyled">
    			<li>directvar : <%=pageContext.getAttribute("directvar") %></li>
    			<li>elvar : <%=pageContext.getAttribute("elvar") %></li>
    			<li>expvar : <%=pageContext.getAttribute("expvar") %></li>
    			<li>betweenvar : <%=pageContext.getAttribute("betweenvar") %></li>
    		
    		</ul>
    		<h5>EL로 출력</h5>
    		<ul class="list-unstyled">
    			<li>directvar : ${pageScope.directvar}</li>
    			<li>elvar : ${elvar}</li>
    			<li>expvar : ${expvar}</li>
    			<li>betweenvar : ${betweenvar}</li>
    		</ul>
    		<h3>set태그로 각 영역에 저장</h3>
    		<c:set var="pagevar" value="페이지 영역" />
    		<c:set var="requestvar" value="리퀘스트 영역" scope="request" />
    		<c:set var="sessionvar" value="세션 영역" scope="session" />
    		<c:set var="applicationvar" value="어플리케이션 영역" scope="application" />
    		
    		<h5>자바코드(스크립팅요소)로 출력</h5>
    		<ul class="list-unstyled">
    			<li>pagevar : <%=pageContext.getAttribute("pagevar") %></li>
    			<li>requestvar : <%=request.getAttribute("requestvar") %></li>
    			<li>sessionvar : <%=session.getAttribute("sessionvar") %></li>
    			<li>applicationvar : <%=application.getAttribute("applicationvar") %></li>    		
    		</ul>    		
    		<h5>EL로 출력</h5>
    		<ul class="list-unstyled">
    			<li>pagevar : ${pagevar}</li>
    			<li>requestvar : ${requestvar}</li>
    			<li>sessionvar : ${sessionvar}</li>
    			<li>applicationvar : ${applicationvar}</li>
    		</ul>
    		<h3>set태그로 자바빈 객체 저장</h3>
    		
    		<c:set scope="request" var="defaultMember" value="<%=new MemberDTO() %>"/>
    		<h5>자바코드(스크립팅요소)로 출력</h5>
    		<ul class="list-unstyled">
    			<li>이름:<%=((MemberDTO)request.getAttribute("defaultMember")).getName() %></li>
    			<li>아이디:<%=((MemberDTO)request.getAttribute("defaultMember")).getId() %></li>
    			<li>비번:<%=((MemberDTO)request.getAttribute("defaultMember")).getPwd() %></li>
    		</ul>
    		<h5>EL로 출력</h5>
    		<ul class="list-unstyled">
    			<li>이름:${defaultMember.name}</li>
    			<li>아이디:${defaultMember.id}</li>
    			<li>비번:${defaultMember.pwd}</li>
    		</ul>
    		<c:set  scope="request" var="argsMember" value='<%=new MemberDTO("KIM","1234","김길동","20") %>'/>
    		<h5>자바코드(스크립팅요소)로 출력</h5>
    		<ul class="list-unstyled">
    			<li>이름:<%=((MemberDTO)request.getAttribute("argsMember")).getName() %></li>
    			<li>아이디:<%=((MemberDTO)request.getAttribute("argsMember")).getId() %></li>
    			<li>비번:<%=((MemberDTO)request.getAttribute("argsMember")).getPwd() %></li>
    		</ul>
    		<h5>EL로 출력</h5>
    		<ul class="list-unstyled">
    			<li>이름:${argsMember.name}</li>
    			<li>아이디:${argsMember.id}</li>
    			<li>비번:${argsMember.pwd}</li>
    		</ul>
    		<!-- 
		set태그의 target속성과 property속성은
		자바빈 객체나
		컬렉션계열 객체 설정할때
		사용할 수 있는 속성.
		
		※target속성:반드시 EL식이나 표현식만 가능
		 property속성:값,표현식,EL식 모두 가능.
		  자바빈 인 경우-속성명(멤버변수명)
		 Map컬렉션 - 키값  	
		
		※scope속성은 var속성을 지정한 태그에서만   설정 가능
	     -->
		<!-- target과 property를 사용해서
	         자바빈이나 컬렉션에 값을 설정할때는
	         var속성을 지정하면 안된다.
	    -->
		<!-- target속성과 property속성을 이용해서
	            자바빈 객체의 속성값 설정
	     -->
	     <c:set target="${defaultMember}" property="id" value="PARK"/>
	     <c:set target="${defaultMember}" property="pwd" value="1234"/>
	     <c:set target="${defaultMember}" property="name" value="박길동"/>
	     <h5>target 및 property속성으로 값 설정후 EL로 출력</h5>
   		 <ul class="list-unstyled">
   			<li>이름:${defaultMember.name}</li>
   			<li>아이디:${defaultMember.id}</li>
   			<li>비번:${defaultMember.pwd}</li>
   		 </ul>
   		 <%
   			//리스트 계열 컬렉션
   			List list = Arrays.asList(request.getAttribute("defaultMember"),request.getAttribute("argsMember"));
   		 %>
   		 <c:set scope="request" value="<%=list%>" var="list"/>
   		 <h5>속성값 변경 전 출력</h5>
   		 <ul class="list-unstyled">
   			<li>이름:${list[0].name}</li>
   			<li>아이디:${list[0].id}</li>
   			<li>비번:${list[0].pwd}</li>
   		 </ul>
   		  <h5>target 및 property속성으로 값 설정후 EL로 출력</h5>
   		  <c:set target="${list[0]}" property="name" value="한소인"/>
   		  <c:set target="${list[0]}" property="id" value="KOSMO"/>
   		  <c:set target="${list[0]}" property="pwd" value="1234"/>
   		  <ul class="list-unstyled">
   			<li>이름:${list[0].name}</li>
   			<li>아이디:${list[0].id}</li>
   			<li>비번:${list[0].pwd}</li>
   		 </ul>
   		 <%
   			//맵 계열 컬렉션
   		 	Map map = new HashMap();
   		 	map.put("default",request.getAttribute("defaultMember"));
   			map.put("args",request.getAttribute("argsMember"));   		 
   		 %>
   		 <c:set var="map" value="<%=map %>" scope="request"/>
   		 <h5>속성값 변경 전 출력</h5>
   		 <!--  default는 EL스펙의 예약어 고로  map["default"].id방식으로 접근-->
   		 <ul class="list-unstyled">
   			<li>이름:${map['default'].name}</li>
   			<li>아이디:${map['default'].id}</li>
   			<li>비번:${map['default'].pwd}</li>
   		 </ul>
   		 <h5>target 및 property속성으로 값 설정후 EL로 출력</h5>
   		  <c:set target="${map['default']}" property="name" value="한소인2"/>
   		  <c:set target="${map['default']}" property="id" value="KOSMO2"/>
   		  <c:set target="${map['default']}" property="pwd" value="0000"/>
   		  <ul class="list-unstyled">
   			<li>이름:${map['default'].name}</li>
   			<li>아이디:${map['default'].id}</li>
   			<li>비번:${map['default'].pwd}</li>
   		 </ul>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>
<jsp:forward page="SetTagResult.jsp">
	<jsp:param value="android" name="subject"/>
</jsp:forward>
