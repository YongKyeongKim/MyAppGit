<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ServletBasic.jsp</title>
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
	      <h1>서블릿</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">서블릿으로 요청 보내기</legend>
    		<!--URL은 디렉토리 구조와 상관없다 -->
    		<ul class="list-unstyled">
    			<li><kbd>GET방식</kbd><a href="<c:url value="/Basic/get.kosmo"/>">GET방식</a></li>
    			<li><kbd>POST방식</kbd>
    				<form class="form-inline" action="<c:url value="/Basic/post.kosmo"/>" method="POST">
						<label>아이디</label> 
						<input type="text" name="id" class="form-control mx-2" /> 
						<label>비밀번호</label> 
						<input type="password" name="pwd" class="form-control mx-2" /> 
						<input type="submit" class="btn btn-danger mx-2" value="로그인" />
					</form>
    			</li>
    			<li>
    				<kbd>GET/POST에 상관없이 요청받기(하나의 컨트롤러(서블릿)로 GET/POST방식 둘다 처리)</kbd><br/>
    				<a href="<c:url value="/Basic/both.kosmo"/>">GET방식</a>
    				<form class="form-inline" action="<c:url value="/Basic/both.kosmo"/>" method="POST">
    					<input type="submit" class="btn btn-danger mx-2" value="POST방식" />
    				</form>
    			</li>
    			<li>
    				<kbd>하나의 컨트롤러로 여러 요청 처리하기(파라미터로 구분해서)</kbd><br/>
    				<a href="<c:url value="/Basic/multi.kosmo?crud=create"/>">입력요청</a>
    				<a href="<c:url value="/Basic/multi.kosmo?crud=read"/>">조회요청</a>
    				<a href="<c:url value="/Basic/multi.kosmo?crud=update"/>">수정요청</a>
    				<a href="<c:url value="/Basic/multi.kosmo?crud=delete"/>">삭제요청</a>
    			
    			</li>
    			<li>
    				<kbd>링크메뉴 클릭(GET요청)->FIRSTController->입력폼페이지로 포워드->입력폼에서 POST방식 요청(SECONDController)->SECONDController에서는 FIRSTController로 포워드(405에러)</kbd>
    				<a href="<c:url value="/Basic/first.kosmo"/>">링크 메뉴</a>
    			</li>
    		
    		</ul>
    		
    	</fieldset>
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">리퀘스트 영역에 저장된 데이타 출력</legend>    		
    		<ul class="list-unstyled">
    			<li>get.kosmo요청시 : ${GET}</li>   
    			<li>post.kosmo요청시 : ${POST}</li>  
    			<li>both.kosmo요청시 : ${BOTH}</li> 
    			<li>multi.kosmo요청시 : ${MULTI}</li>     	 		
    		
    		</ul>
    		
    	</fieldset>
  	</div><!-- container -->
</body>
</html>