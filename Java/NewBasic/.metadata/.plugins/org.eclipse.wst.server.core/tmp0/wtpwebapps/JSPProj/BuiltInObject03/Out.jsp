<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Out.jsp</title>
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
	      <h1>JspWriter</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">out내장 객체</legend>
    		<h2>버퍼와 관련된 메소드</h2>
    		<%
    			out.println("버퍼에 저장될 문자열<br/>");
    			//버퍼에 저장된 내용이 웹브라우저로 바로 전송됨.
    			out.flush();
    			out.println("웹브라우저에 출력 안될 문자열");
    			out.clearBuffer();
    			out.println("마지막으로 저장될 문자열");    		
    		%>
    		<h2>기타 메소드</h2>
    		<ul class="list-unstyled">
    			<li>자동 플러쉬 여부:<%=out.isAutoFlush() %></li>
    			<li>버퍼크기:<%=out.getBufferSize() %>바이트</li>
    			<li>남은 버퍼크기:<%=out.getRemaining() %>바이트</li>    		
    		</ul>
    		<h2>print와 println차이</h2>
    		<h4>print메소드</h4>
    		<%
    			out.print("<table class='table'>");
    			out.print("<tr>");
    			out.print("<td>가</td><td>나</td>");
    			out.print("</tr>");
    			out.print("</table>");
    		%>
    		<h4>println메소드</h4>
    		<!--소스보기시 줄바꿈 처리되어 있음(소스보기시 가독성이 높다)  -->
    		<%
    			out.println("<table class='table'>");
    			out.println("<tr>");
    			out.println("<td>가</td><td>나</td>");
    			out.println("</tr>");
    			out.println("</table>");
    		%>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>