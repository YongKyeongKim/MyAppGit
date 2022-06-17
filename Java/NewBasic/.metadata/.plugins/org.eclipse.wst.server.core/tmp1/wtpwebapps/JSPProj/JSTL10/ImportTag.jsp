<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ImportTag.jsp</title>
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
  	<div class="container-fluid">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">import 태그</legend>
    		<!-- jsp:include액션태그와 같다. request영역 공유	-->
			<!-- url속성에 절대 경로 설정시 프로젝트명은 제외
	         단,server.xml의 Context태그의  path속성값을 지운 경우는 상관없다.
	 		-->
    		<!-- 리퀘스트 영역에 속성 저장 -->
    		<c:set scope="request" var="requestVar" value="리퀘스트 영역"/>    		
    		<h3>var속성 미 지정(해당 위치에 바로 삽입됨)</h3>
    		<c:import url="ImportedPage.jsp">
    			<c:param name="user" value="PAKR"/>
    			<c:param name="pass" value="1234"/>
    		</c:import>
    		<h3>var속성 지정(원하는 위치에 삽입하고자 할때)</h3>
    		<c:import url="ImportedPage.jsp" var="content">
    			<c:param name="user" value="PAKR"/>
    			<c:param name="pass" value="1234"/>
    		</c:import>
    		<h3>아래에 import된 페이지 내용 출력</h3>
    		${content}
    		<h3>외부에 있는 컨텐츠 삽입</h3>
    		<%-- 
    		<c:import url="https://www.nate.com"/>
    		--%>
    		<iframe src="ImportedNate.jsp" style="border:none;width:100%;height:500px"></iframe>
    	</fieldset>
  	</div><!-- container -->
  
</body>
</html>