<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SessionResult.jsp</title>
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
    		<legend class="w-auto p-3">세션 확인</legend>
    		<ul class="list-unstyled">
    			
    			<li>세션 아이디 : <%=session.getId() %></li>
    			<li>세션 유효시간 : <%=session.getMaxInactiveInterval() %>초</li>
    			<li>리퀘스트 영역 : <%=request.getAttribute("requestScope") %></li>
    			<li>세션 영역 : <%=session.getAttribute("sessionScope") %></li>
    		</ul>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>