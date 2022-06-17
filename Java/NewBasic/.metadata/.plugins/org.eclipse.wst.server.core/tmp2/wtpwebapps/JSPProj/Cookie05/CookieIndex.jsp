<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CookieIndex.jsp</title>
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
	      <h1>Cookie</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">쿠키</legend>
    		<h2>쿠키 설정하기</h2>
    		<%
    		//1]쿠키 객체 생성 :new Cookie("쿠키명","쿠키값");	
    		Cookie cookie = new Cookie("UserID","KOSMO");
    		//2]쿠키가 적용되는 PATH 설정
			cookie.setPath(request.getContextPath());
			//3]쿠키 유효기간 설정-초 단위
			/*
			   유효기간 미 설정시 쿠키는 웹브라우저에 저장됨
			   -웹브라우저 닫을때
			    유효기간 설정시는 사용자의 PC(HDD의 텍스트 파일형태)에 저장됨.
			   -유효기간이 지나면 파일은 자동으로 삭제됨
			*/
			cookie.setMaxAge(30);
			//4]생성된 쿠키를 응답헤더에 설정:addCookie()
			response.addCookie(cookie);
    		%>
    		<h2>쿠키를 생성한 현재 페이지에서 쿠키값 읽기</h2>
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
    		<h2> 클릭으로 페이지 이동후 쿠키값 확인</h2>
    		<a href="CookieResult.jsp">쿠키값 확인</a>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>