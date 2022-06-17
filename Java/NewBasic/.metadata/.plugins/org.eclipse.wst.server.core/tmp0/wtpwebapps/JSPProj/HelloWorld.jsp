<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	info="JSP및 Servlet테스트 페이지 입니다"	
	 %>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytag.tld"  %>
 
<%
	SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String dateString=dateFormat.format(new Date());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HelloWorld.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
			<h1>JSP 및 Servlet테스트</h1>
		</div>
		<!--container-fluid-->
	</div>
	<!--jumbotron-fluid-->
	<div class="container">
	
		<h2>HELLO WORLD(최철환)</h2>
		
		<fieldset class="form-group border p-3">
			<legend class="w-auto px-3">JSP테스트</legend>
			<h3>오늘은 <%= dateString %>일 입니다</h3>
		</fieldset>
		<fieldset class="form-group border p-3">
			<legend class="w-auto px-3">Servlet테스트</legend>			
			<a href="HelloServlet.do" class="page-link">HELLO SERVLET</a>			
			<span class="font-weight-bold text-danger" style="font-size:1.2em">${message}</span>
			<h2>계산기</h2>
			<form action="Calculator.kosmo">
				<div class="form-group">
					<input type="text" class="form-control form-control-sm w-50" name="firstNum"  /> 
				</div>
				<div class="form-group">
					<select	name="operator" class="form-control form-control-sm w-50">
						<option value="+">더하기</option>
						<option value="-">빼기</option>
						<option value="*">곱하기</option>
						<option value="/">나누기</option>
					</select> 
				</div>
				<div class="form-group">
					<input class="form-control form-control-sm w-50" type="text" name="secondNum"/> 
				</div>
				<input class="btn btn-success"	type="submit" value="결과는" /> 
				<span class="font-weight-bold text-danger" style="font-size:1.4em">${result }</span>
			</form>
		</fieldset>
		\${my:isNumber("100사") } : ${my:isNumber("100사") }<br/>
		
	</div>
</body>
</html>