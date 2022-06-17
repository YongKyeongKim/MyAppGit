<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
	 톰캣 9이하에서
	 인클르드로 페이지 포함시
	 파라미터로 한글 전달시 한글이 깨진다
	 이때는 반드시 인클루드 시키는 페이지에서 아래 코드 추가 
	
	*/
	request.setCharacterEncoding("UTF-8");
	/*
		include의 page속성에는 반드시 페이지명만 그리고 표현식 가능
		include액션태그는 반드시 하위 요소인 param액션 태그를 통해서만 파라미터 전달 가능
		value속성은 표현식 가능
		단,name속성은 표현식 사용 불가.즉 문자열만 와야한다
  
	*/
	request.setAttribute("requestScope", "리퀘스트 영역입니다");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ParamActionTagInInclude.jsp</title>
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
	      <h1>inlcude액션태그에 하위요소로 param액셔태그 추가</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class='form-group border p-3'>
    		<legend class="w-auto p-3">삽입하는 페이지에 파라미터 전달</legend>
    		<%--
    		//page속성에는 page명만 넣자    		 
    		<jsp:include page="IncludedPage.jsp?id=PARK&name=박길동"></jsp:include>
    		--%>
    		<jsp:include page="IncludedPage.jsp">
    			<jsp:param value="PARK" name="id"/>
    			<jsp:param value='<%=request.getParameter("pwd") %>' name="pwd"/>
    			<jsp:param value="박길동" name="name"/>
    		</jsp:include>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>