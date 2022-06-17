<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	private String getProductName(String code){
		return code.replace("product","상품");	
	}////////////
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CookieExamCartShow.jsp</title>
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
	      <h1>장바구니</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">장바구니에 담은 상품들</legend>
    		<ul class="list-unstyled">
    			<%
    			//요청 헤더에서 쿠키값 읽기
    			Cookie[] cookies=request.getCookies();
    			
    			if(cookies !=null){
    				for(Cookie cookie:cookies){
    					//쿠키명 얻기
    					String name=cookie.getName();
    					//쿠키값 얻기
    					String value=cookie.getValue();
    					//장바구니용
    					if(name.indexOf("product") != -1) 
    						out.println(String.format("<li>%s</li>",getProductName(value)));
    					
    				}
    			}
    			
    			
    			%>    		
    		</ul>
    		<a href="CookieExamIndex.jsp" class="btn btn-info">계속 쇼핑하기</a>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>