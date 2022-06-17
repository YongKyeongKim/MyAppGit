<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	private int getTotal(int start,int end){
		int sum=0;
		for(int i=start;i<=end;i++) sum+=i;
		return sum;
	}////////////////
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Expression.jsp</title>
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
	      <h1>Expression 정리</h1>  	     
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">표현식(Expression) 사용하기</legend>
    		<h1 class="display-4">out내장객체를 사용한 출력</h1>
    		<h4>1부터 100까지 누적합</h4>
    		<%
    			out.println(getTotal(1, 100));
    			out.println("<h4>1부터 1000까지 누적합</h4>");
    			out.println(getTotal(1, 1000));    
    			out.println("<h4>1부터 10000까지 누적합</h4>");
    			out.println(getTotal(1, 10000));    
    		%>
    		<h1 class="display-4">표현식을 사용한 출력</h1>
    		<h4>1부터 100까지 누적합</h4>
    		<%=getTotal(1, 100) %>
    		<h4>1부터 1000까지 누적합</h4>
    		<%=getTotal(1, 1000) %>
    		<h4>1부터 10000까지 누적합</h4>
    		<%=getTotal(1, 10000) %>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>