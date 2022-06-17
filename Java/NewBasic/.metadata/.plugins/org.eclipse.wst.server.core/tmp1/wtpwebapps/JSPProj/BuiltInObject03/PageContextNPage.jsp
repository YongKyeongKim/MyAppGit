<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PageContextNPage.jsp</title>
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
	      <h1>PageContext 및 Object</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">pageContext 및 page내장객체</legend>
    		<h2>pageContext</h2>
    		<h4>request내장객체로 전송방식 얻기</h4>
    		<%=request.getMethod() %>
    		<h4>pageContext내장객체로 전송방식 얻기</h4>
    		<%
    			//※JSP에 출력시 사용하는 언어인 EL에서 pageContext(EL용 내장객체)를 주로 사용한다 
    		
    			//상속 계층도 ServletRequest > HttpServletRequest
    			//1]pageContext로 request객체 얻기	
    			ServletRequest req= pageContext.getRequest();
    			//getMethod()는 HttpServletRequest에서 새롭게 정의한 메소드]
    			//2]req를 HttpServletRequest로 형변환.
				String method=((HttpServletRequest)req).getMethod();
    			out.println(method);
    		%>
    		<h4>pageContext내장객체로 출력하기</h4>
    		<% pageContext.getOut().println("메소드 체인"); %>
    		<h4>pageContext내장객체로 서버의 물리적 경로 얻기</h4>
    		<%=pageContext.getServletContext().getRealPath("/images") %>
    		<h2>page내장 객체</h2>
    		<%
	    		/*
	    		page내장객체(Object타입)는 jsp페이지 자체를 의미하고
	    		this키워드와 같은 의미다. 	
	    		*/
    			out.println("page내장객체의 클래스명:"+page.getClass().getName()+"<br/>");
    			out.println("this의 클래스명:"+this.getClass().getName()+"<br/>");
    			out.println(page instanceof HttpServlet ? "page는 서블릿 이다":"page는 서블릿이 아니다");
    		%>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>