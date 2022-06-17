<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>UseBeanFormResult.jsp</title>
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
	      <h1>useBean 액션태그로 폼의 하위요소값 받기</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">값 출력</legend>
    		<!-- STEP1]액션태그로 자바빈 객체 생성 -->
    		<jsp:useBean id="action" class="model.MemberDTO"/>
    		<h4>파라미터명과 자바빈의 속성이 불일치시 </h4>
    		<!-- 
   			property에는 자바빈의 속성명(멤버변수명)
   			param속성에는 form의 하위요소명(name속성에 지정한 값)
   		   -->
    		<!-- STEP2]setProperty액션태그로 폼 요소값 설정:value속성 미 지정 -->    		
    		<jsp:setProperty property="id" name="action" param="username"/>
    		<jsp:setProperty property="pwd" name="action" param="password"/>
    		<jsp:setProperty property="name" name="action" />
    		
    		<h4>파라미터명과 자바빈의 속성이 일치시</h4>
    		
    		<jsp:setProperty property="*" name="action" />
    	</fieldset>
    	<%=action %>
  	</div><!-- container -->
</body>
</html>