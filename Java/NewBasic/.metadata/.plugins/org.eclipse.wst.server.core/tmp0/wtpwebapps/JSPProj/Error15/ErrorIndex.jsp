<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ErrorIndex.jsp</title>
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
    		<legend class="w-auto p-3">파라미터로 받은 문자열 길이 출력</legend>
    		<%
    			//방법1]try~catch사용
				/*
				try{
    				out.println("전송방식:"+request.getMethod()+"<br/>");
    				out.println("파라미터의 문자열 길이:"+request.getParameter("name").length());
				}
    			catch(NullPointerException e){
    				out.println("<h2>관리자에게 문의 하세요</h2>");
    				return;
    			}*/
    			//방법2]page지시어 속성 사용
    			//방법3]web.xml의 설정으로 예외 처리- 전역설정으로 페이지마다 설정 불필요
				//     즉 web.xml에 설정만 하면 모든 .jsp혹은 서블릿에서 적용된다.
				/*
	   	 		
	       		-개발완료후 범용적인 에러 처리시
	        	 방법1:에러코드로 
	         	 방법2:예외 클래스 직접 지정
	         	 예외 클래스 직접 지정이 우선한다.
	         
	       		location:컨텍스트 루트를 제외한 /로 시작하는 웹상의 경로
	       		try~catch불필요
	       		포워드로 에러 처리 페이지로 이동시킨다
	   			*/
	   			
	   			request.setAttribute("requestVar", "리쿼스트 영역");
	   			out.println("전송방식:"+request.getMethod()+"<br/>");
				out.println("파라미터의 문자열 길이:"+request.getParameter("name").length());
    		%>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>