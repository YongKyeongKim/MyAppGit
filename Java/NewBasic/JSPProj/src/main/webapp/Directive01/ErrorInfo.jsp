<%@ page language="java" contentType="text/html; charset=UTF-8"  
		 pageEncoding="UTF-8"
		 isErrorPage="true"
		 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ErrorInfo.jsp</title>
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
	      <h1>errorPage 및 isErrorPage속성</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
			<legend class="w-auto px-3">에러 발생</legend>
			<h2>관리자에게 문의 하세요:010-1234-5678</h2>
			<!-- 
			exception내장객체는 page지시어의 isErrorPage속성이
			true인 jsp페이지에서만 사용가능	
	     	-->
	     	<h2>에러 내용</h2>
	     	<%=exception.getMessage() %>
		</fieldset>
  	</div><!-- container -->
</body>
</html>