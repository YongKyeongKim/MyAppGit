<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SessionIndex.jsp</title>
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
	<!-- 
	세션이 삭제되는 경우
	1.유효시간동안 서버에 아무런 요청을 보내지 않았을때
	2.브라우저를 닫았을때
	※현재 브라우저 안에서 모든 JSP(서블릿)은 동일한 세션영역에 있다
	 -->
	<div class="jumbotron jumbotron-fluid bg-warning">
	    <div class="container-fluid">
	      <h1>세션</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">session(HttpSession)내장 객체의 주요 메소드</legend>
    		<ul class="list-unstyled">
    			<li>세션의 유효시간(web.xml:분단위) : <%=session.getMaxInactiveInterval() %>초</li>
    			<% session.setMaxInactiveInterval(60);//60초 %>
    			<li>세션아이디 : <a href="SessionResult.jsp"><%=session.getId() %></a></li>
    			<%
    				//세션의 최초 생성시간
    				long createTime=session.getCreationTime();
    				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    				String createTimeString= dateFormat.format(new Date(createTime));
    				//클라이언트가 서버로  마지막으로  요청한 시간
    				long accessTime=session.getLastAccessedTime();
    				String accessTimeString= dateFormat.format(new Date(accessTime));
    			%>
    			<li>세션의 최초 생성시간:<%=createTimeString %></li>
    			<li>클라이언트의 최근 요청 시간:<%=accessTimeString %></li>
    		</ul>
    		<h2>세션 및 리퀘스트 영역에 속성 저장</h2>
    		<%
    			request.setAttribute("requestScope", "리퀘스트 영역입니다");
    			session.setAttribute("sessionScope", "세션 영역입니다");
    		%>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>