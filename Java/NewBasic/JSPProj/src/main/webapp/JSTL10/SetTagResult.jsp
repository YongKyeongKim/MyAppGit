<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SetTagResult.jsp</title>
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
	      <h1>JSTL(JSP Standard Tag Library)</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">set태그로 설정한 객체를 EL로 출력</legend>
    		<h3>xxxvar계열</h3>
    		<ul class="list-unstyled">
    			<li>pagevar : ${pagevar}</li>
    			<li>requestvar : ${requestvar}</li>
    			<li>sessionvar : ${sessionvar}</li>
    			<li>applicationvar : ${applicationvar}</li>
    		</ul>
    		<h3>MemberDTO계열(argsMember)출력</h3>
    		<ul class="list-unstyled">
    			<li>이름:${argsMember.name}</li>
    			<li>아이디:${argsMember.id}</li>
    			<li>비번:${argsMember.pwd}</li>
    		</ul>
    		<h3>리스트 계열 컬렉션(인덱스 1인 객체) 출력</h3>
    		<ul class="list-unstyled">
	   			<li>이름:${list[1].name}</li>
	   			<li>아이디:${list[1].id}</li>
	   			<li>비번:${list[1].pwd}</li>
   		 	</ul>
   		 	<h3>맵 계열 컬렉션(키값이 'args'인 객체) 출력</h3>
   		 	<ul class="list-unstyled">
	   			<li>이름:${map.args.name}</li>
	   			<li>아이디:${map['args'].id}</li>
	   			<li>비번:${map['args']['pwd']}</li>
	   		 </ul>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>