<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BuiltInObjectOfScopeForwarded.jsp</title>
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
	      <h1>Expression Language</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">EL의 xxxScope계열 내장객체(포워드된 페이지)</legend>
    		<h4>자바코드로 각 영역에 저장된 속성 읽기(xxxScope계열 객체 지정)</h4>
    		<ul class="list-unstyled">
    			<li>페이지 영역 : <%=pageContext.getAttribute("scopeVar") %></li>
    			<li>리퀘스트 영역 : <%=request.getAttribute("scopeVar") %></li>
    			<li>세션 영역 : <%=session.getAttribute("scopeVar") %></li>
    			<li>어플리케이션 영역 : <%=application.getAttribute("scopeVar") %></li>
    		</ul>
    		
    		<h4>각 영역에 저장된 속성 읽기(xxxScope계열 객체 지정)</h4>
    		<ul class="list-unstyled">
    			<li>\${pageScope.scopeVar } : ${pageScope.scopeVar }</li>
    			<li>\${requestScope.scopeVar } : ${requestScope.scopeVar }</li>
    			<li>\${sessionScope['scopeVar'] } : ${sessionScope['scopeVar'] }</li>
    			<li>\${applicationScope["scopeVar"] } : ${applicationScope["scopeVar"] }</li>
    		
    		</ul>
    		<h4>각 영역에 저장된 속성 읽기(xxxScope계열 객체 미 지정)</h4>
    		<ul class="list-unstyled">
    			<li>\${scopeVar } : ${scopeVar}</li>
    			<li>\${scopeVar } : ${scopeVar}</li>
    			<li>\${scopeVar} : ${scopeVar}</li>
    			<li>\${scopeVar} : ${scopeVar}</li>    		
    		</ul>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>
