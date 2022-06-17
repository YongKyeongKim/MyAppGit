<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CookieResult.jsp</title>
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
	      <h1>Cookie값 확인</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container"> 
    		<h2>쿠키값 읽기</h2>
    		<%
    			//요청헤더에 보내진 쿠키값 읽기
    			Cookie[] cookies=request.getCookies();
    			if(cookies!=null){
    				for(Cookie cook:cookies){
    					//쿠키명 얻기
    					String name=cook.getName();
    					//쿠키값 얻기
    					String value=cook.getValue();
    					out.println(String.format("%s : %s<br/>",name,value));
    				}
    			}    		
    		%>
    		
  	</div><!-- container -->
</body>
</html>