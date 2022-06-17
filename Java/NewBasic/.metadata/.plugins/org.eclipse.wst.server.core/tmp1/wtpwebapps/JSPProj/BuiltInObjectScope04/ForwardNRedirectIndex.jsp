<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ForwardNRedirectIndex.jsp</title>
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
	      <h1>포워드/리다이렉트 예제</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">포워드/리다이렉트 연습하기</legend>
    		<form class="form-inline" action="ForwardNRedirectProcess.jsp" method="post">
				<label>아이디</label> <input class="form-control mx-2 mt-2" type="text" name="id" value="<%=request.getParameter("id")==null?"":request.getParameter("id") %>"/> 
				<label>비밀번호</label> <input class="form-control mx-2 mt-2" type="password" name="pwd" value="<%=request.getParameter("pwd")==null?"":request.getParameter("pwd") %>"/> 
				<input class="btn btn-info ml-2 mt-2" type="submit" value="로그인" />
			</form>
			<span class="text-danger font-weight-bold"><%=request.getAttribute("errorMsg")==null?"":request.getAttribute("errorMsg") %></span>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>