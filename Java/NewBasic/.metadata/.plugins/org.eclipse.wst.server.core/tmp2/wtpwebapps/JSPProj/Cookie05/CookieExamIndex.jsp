<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//요청 헤더에서 쿠키값 읽기
	Cookie[] cookies=request.getCookies();
	//상품 코드값을 담을 컬렉션
	List cart = new Vector();
	//아이디 저장용
	String username="";
	if(cookies !=null){
		for(Cookie cookie:cookies){
			//쿠키명 얻기
			String name=cookie.getName();
			//쿠키값 얻기
			String value=cookie.getValue();
			//장바구니용
			if(name.indexOf("product") != -1) cart.add(value);
			//아이디 저장용
			if("USER_ID".equals(name)) username=value;
			
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CookieExamIndex.jsp</title>
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
  .custom-control-label{
  	margin-right:.8rem;
  }
</style>
</head>
<body>
	<div class="jumbotron jumbotron-fluid bg-warning">
	    <div class="container-fluid">
	      <h1>쿠키 예제</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">장바구니 예제</legend>
    		<form action="CookieExamCartProcess.jsp">
    		<div class="form-group">
				
					<div class="d-flex">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="product1" id="product1" <%if(cart.contains("product1")){%>  disabled <%} %>>
							<label class="custom-control-label" for="product1">상품1</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="product2" id="product2" <%if(cart.contains("product2")){%>  disabled <%} %>>
							<label class="custom-control-label" for="product2">상품2</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="product3" id="product3" <%if(cart.contains("product3")){%>  disabled <%} %>>
							<label class="custom-control-label" for="product3">상품3</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="product4" id="product4" <%if(cart.contains("product4")){%>  disabled <%} %>>
							<label class="custom-control-label" for="product4">상품4</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="product15" id="product15" <%if(cart.contains("product15")){%>  disabled <%} %>>
							<label class="custom-control-label" for="product15">상품15</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="cart" value="product190" id="product190" <%if(cart.contains("product190")){%>  disabled <%} %>>
							<label class="custom-control-label" for="product190">상품190</label>
						</div>
						<input type="submit" value="장바구니 담기" class="btn btn-info"/>
					</div>
				</div>
			</form>
			<form action="CookieExamCartEmpty.jsp">
				<input type="submit" value="장바구니 비우기" class="btn btn-info"/>
			</form>
			<hr/>
			<a href="CookieExamCartShow.jsp" class="btn btn-info">장바구니 보기</a>
    	</fieldset>
    	<hr/>
    	<span class="font-weight-bold text-danger mb-2"><%=request.getAttribute("ERROR")==null?"":request.getAttribute("ERROR")%></span>
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">아이디 저장 예제</legend>
    		<% if(session.getAttribute("USER_ID") ==null){ %>
    		<form class="form-inline" action="CookieExamLoginProcess.jsp" method="POST">
    			<label>아이디</label>
    			<input type="text" name="id" class="form-control mx-2" value="<%=request.getParameter("id")==null?username:request.getParameter("id") %>"/>
    			
    			<label>비밀번호</label>
    			<input type="password" name="pwd" class="form-control mx-2"  value="<%=request.getParameter("pwd")==null?"":request.getParameter("pwd") %>"/>
    			<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="id-save" value="Y" id="id-save" <%if(username.length()!=0){ %>checked<%} %>>
					<label class="custom-control-label" for="id-save" >아이디 저장</label>
				</div>
    			<input type="submit" class="btn btn-danger mx-2" value="로그인"/>
    		</form> 
    		<%}else{ %>    		
    		<a href="CookieExamLogout.jsp" class="btn btn-info">로그아웃</a> 	
    		<%} %>	
    	</fieldset>
  	</div><!-- container -->
</body>
</html>