<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>UseBeanActionTagBasicResult.jsp</title>
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
	      <h1>자바빈 객체 읽어오기</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<%--
    	    //자바코드로 영역에서 가져오기
    		MemberDTO member= (MemberDTO)request.getAttribute("member");    	
    	--%>
    	<!-- useBean액션태그로 영역에서 가져오기 -->
    	<jsp:useBean id="member" type="model.MemberDTO" scope="request"/>
    	<%--=member.getName() --%>
    	<!-- 
		※자바코드(스크립팅 요소)에서 사용한 인스턴스 변수는  useBean액션태그에서 사용불가.
		  단, 액션태그에서 사용한 변수(id속성에 지정한 값)는 자바코드(스크립팅 요소)에서도 사용가능		
		--> 
    	<%--
    	    	<jsp:getProperty property="name" name="member"/>
    	--%>
    	<h4>액션태그로 출력</h4>
    	<ul class="list-unstyled">
  			<li>아이디 : <jsp:getProperty  name="member" property="id"/></li>
  			<li>비번 : <jsp:getProperty  name="member" property="pwd"/></li>
  			<li>이름 : <jsp:getProperty  name="member" property="name"/></li>
  			<li>나이 : <jsp:getProperty  name="member" property="age"/></li>
  		</ul>
  		<h4>자바코드(스크립팅 요소)로 출력</h4>
    	<ul class="list-unstyled">
  			<li>아이디 : <%=member.getId() %></li>
  			<li>비번 : <%=member.getPwd() %></li>
  			<li>이름 : <%=member.getName()%></li>
  			<li>나이 : <%=member.getAge() %></li>
  		</ul>
  	</div><!-- container -->
</body>
</html>