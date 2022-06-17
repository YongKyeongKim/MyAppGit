<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ForwardNRedirectMyPage.jsp</title>
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
	      <h1>마이페이지</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">아이디 및 비밀번호 출력</legend>
    		<h2>리퀘스트 영역에서 읽어오기</h2>
    		<ul class="list-unstyled">
    			<li>아이디 : <%=request.getAttribute("id") %></li>
    			<li>비밀번호 : <%=request.getAttribute("pwd") %></li>
    		</ul>
    		<h2>파라미터로 읽어오기</h2>
    		<ul class="list-unstyled">
    			<li>아이디 : <%=request.getParameter("id") %></li>
    			<li>비밀번호 : <%=request.getParameter("pwd") %></li>
    		</ul>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>