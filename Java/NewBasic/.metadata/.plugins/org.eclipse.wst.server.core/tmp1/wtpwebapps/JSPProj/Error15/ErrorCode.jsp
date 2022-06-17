<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ErrorCode.jsp</title>
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
	      <h1>web.xml설정을 통한 예외처리</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid-->
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">에러코드로 예외처리</legend>
    		<h2>관리자에게 문의하세요</h2>
    		<h3>리퀘스트 영역에 저장된 속성값:<%=request.getAttribute("requestVar") %></h3>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>