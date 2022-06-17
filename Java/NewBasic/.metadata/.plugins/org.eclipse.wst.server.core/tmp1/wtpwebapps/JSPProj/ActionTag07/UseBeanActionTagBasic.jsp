<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>UseBeanActionTagBasic.jsp</title>
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
	      <h1>useBean액션태그</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">액션 태그만으로 자바빈 객체 생성하기</legend>
    		
    		<jsp:useBean id="member" class="model.MemberDTO" scope="request"/>
    		
    		<!--위 액션태그를 자바코드 만으로 코딩시 아래와 같다 -->
    		<%--
    			//1]scope속성에 지정한 영역에서 객체 얻기(속성명은 id에 지정한 이름으로..)
				//인스턴스 변수명은 역시 id에 지정한 이름으로	 
    			MemberDTO member = (MemberDTO)request.getAttribute("member");
    			//2]영역에 존재하지 않을때 생성
    			if(member ==null){
    				//기본 생성자로 생성]
    				member = new MemberDTO();
    				//생성된 객체를 scope에 지정한 영역에 저장(속성명은 id에 지정한 이름으로..)
    				request.setAttribute("member", member);
    			} 		
    		
    		--%>
    		<%=member %>
    		<h4>setProperty액션태그로 자바빈 객체 속성 설정</h4>
    		<!-- 액션 태그로 속성 설정 -->	
			<!-- 
		  	- setter를 호출한 것과 같다
		  	- name속성에는 액션태그로 자바빈 객체 생성시 id속성에 지정한 값
		  	-->
		  	<jsp:setProperty property="id" name="member" value="KIM"/>
		  	<jsp:setProperty property="name" name="member" value="김길동"/>
    		<!-- 자바코드로 속성 설정 -->
    		<%
    			member.setAge("20");
    			member.setPwd("1234");
    			
    		%>
    		<h2>속성 설정후 출력</h2>
    		<%=member %>
    		<h4>getProperty액션태그로 자바빈 객체 속성 읽기</h4>
    		<!-- getter를 호출한 것과 같다 -->
    		<ul class="list-unstyled">
    			<li>아이디 : <jsp:getProperty  name="member" property="id"/></li>
    			<li>비번 : <jsp:getProperty  name="member" property="pwd"/></li>
    			<li>이름 : <%=member.getName() %></li>
    			<li>나이 : <%=member.getAge() %></li>
    		</ul>
    	</fieldset>
  	</div><!-- container -->
  	<jsp:forward page="UseBeanActionTagBasicResult.jsp"  />
</body>
</html>
