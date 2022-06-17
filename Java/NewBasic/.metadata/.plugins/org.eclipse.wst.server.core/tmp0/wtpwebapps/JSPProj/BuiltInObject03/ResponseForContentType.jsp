<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ResponseForContent.jsp</title>
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
	      <h1>Content-Type 응답헤더</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<!-- 
		JSP 페이지 에서는 response객체의 setContentType()메소드 불 필요.
	  	page지시어에 속성(contentType)으로 설정해 놓았기때문에....
	  	단,서블릿에서 페이지 이동을 안하고 	직접 서블릿 자체에서 웹브라우저에 출력시에는 반드시 설정해줘라.
	  	-->
	  	<h3>서블릿에서 직접 브라우저로 스트림 출력(이때는 반드시 setContextType()메소드 사용)</h3>
	  		<!-- 
		    	서블릿으로 요청을 보낼때 링크 거는 방법
		    	절대경로:
		    	/Context루트/이후는 마음대로
		    	단,web.xml의 url-pattern요소에서는
		    	Context루트를 제외한 /로 시작
	     	-->
	     	<a href="<%=request.getContextPath() %>/Anidir/Somdir/SetContentType.kosmo">서블릿으로 요청 보내기</a>	
  	</div><!-- container -->
</body>
</html>