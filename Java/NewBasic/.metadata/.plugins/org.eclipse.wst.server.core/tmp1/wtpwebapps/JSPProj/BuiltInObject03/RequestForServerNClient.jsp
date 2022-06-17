<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RequestForServerNClient.jsp</title>
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
	      <h1>HttpServletRequest : 요청한 서버와 클라이언트에 대한 정보</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">서버 및 클라이언트 정보</legend>
    		<form method="post">
    			<input class="btn btn-info" type="submit" value="서버로 전송"/>
    		</form>
    		<h3 class="mt-4">HTTP메소드 : <small><%=request.getMethod() %></small></h3>
    		<h3>전체 URL : <small><%=request.getRequestURL() %></small></h3>
    		<h3>도메인을 제외한 URI : <small><%=request.getRequestURI() %></small></h3>    		
    		<h3>요청 프로토콜 : <small><%=request.getProtocol() %></small></h3>
    		<h3>요청 서버명 : <small><%=request.getServerName() %></small></h3>
    		<h3>요청 서버포트 : <small><%=request.getServerPort() %></small></h3>
    		<!-- 
				IPV6값으로 반환시
				톰캣 실행시의 JVM에 환경변수를 추가.
				이클립스 > Run > Run Configuration > Arguiments > -Djava.net.preferIPv4Stack=true				
			
			 -->
			 
    		<h3>클라이언트의 IP주소 : <small><%=request.getRemoteAddr() %></small></h3>
    		<h3>클라이언트의 IP주소 : <small><%=request.getRemoteHost() %></small></h3>
    		<h3>요청과 관련된 세션 객체 얻기(서블릿에서 사용 - 인증처리) : <small><%=request.getSession() %></small></h3>
    		<h3>세션 내장 객체 : <small><%=session %></small></h3>
    		<!-- 
			 	JSP에서는 웹 어플리케이션 전체 영역을 Context라 칭함.
			 	
			 	getContextPath(): server.xml의 Context태그에
			 	path속성에 지정한 값을 얻어옴.
			 	※HTML에서 절대경로로 링크를 걸때 주로 사용(단,JSTL사용시에는 사용하지 않는다(모델 2방식))	 
			  -->
			<h3>Context Path(프로젝트명) : <small><%=request.getContextPath() %></small></h3>  
    	</fieldset>
  	</div><!-- container -->
</body>
</html>