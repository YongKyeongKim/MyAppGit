<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>컨트롤러 메소드의 반환타입</h1>	  
	</div>
	<h3>반환타입들</h3>
	<ul class="list-unstyled">
		<li><a href="<c:url value="/ReturnType/ModelAndView.do?returnType=ModelAndView!!!"/>" >ModelAndView반환</a></li>
		<li><a href="<c:url value="/ReturnType/String.do?returnType=String!!!"/>" >String반환</a></li>
		<li><button class="btn btn-link" id="ajax">void타입 반환(@Controller어노테이션 사용시에 클라이언트로 페이지가 아닌 데이타를 보낼때)</button></li>
	</ul>
	<h3>결과값 출력</h3>
	<ul class="list-unstyled">
		<li>\${requestScope.message } : ${requestScope.message }</li>
		<li>\${requestScope.returnType } : ${requestScope.returnType }</li>
		<li>\${param.returnType } : ${param.returnType }</li>
	</ul>
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
<script>
	$('#ajax').click(function(){
		console.log('클릭 발생');
		$.ajax({
			url:"<c:url value="/ReturnType/Void.do?returnType=Void!!!"/>",			
			dataType:"json"
		}).done(function(data){
			console.log('서버로부터 받은 데이타:',data);
			data.forEach(function(item,index){
				console.log("아이디:%s,비밀번호:%s",item.username,item.password);
			});
			/*
			$.each(data,function(index,item){
				console.log("아이디:%s,비밀번호:%s",item.username,item.password);
			});*/			
		});
	});


</script>
		