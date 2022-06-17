<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
※include지시어의 file속성과
  include액션태그의 page속성에
  절대경로로 페이지 포함시에는 Context 루트 제외한
 경로.
 단,server.xml의 Context엘리먼트의 path속성을 ""으로
 설정시에는 request.getContextPath()로 해도 상관없다.
 
※include지시어의 file속성에는 표현식 사용불가
 include액션태그의 page속성에는 표현식 사용가능
  단,표현식을 사용할때는 page속성에 표현식만 와야한다.



[include지시어와 include 액션태그의 차이점]

  include 지시어를 사용한 페이지 include(포함)]
    -소스 그대로 해당 위치에 포함됨
    -include지시어를 통해 포함된 페이지는 현재 페이지와 같은 페이지를 의미
 include 액션태그를 사용한 페이지 include(포함)]
    -JSP컨테이너에 의해 실행된 결과가  해당 위치에 포함됨
    -서로 다른 페이지를 의미
    -단, request영역 공유
-->
<%
	//페이지명 변수에 저장
	String directivePath="DirectivePage.jsp";
	String actionPath="ActiontagPage.jsp";
	//페이지 및 리퀘스트 영역에 속성 저장
	pageContext.setAttribute("pageVar", "페이지 영역입니다");
	request.setAttribute("requestVar", "리퀘스트 영역입니다");	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IncludeActiontag.jsp</title>
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
	      <h1>include액션태그</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">include지시어와 &lt;include&gt;액션태그</legend>
    		<!-- file속성에 표현식 사용불가 -->
    		<%--@ include file="<%=directivePath %>" --%>
    		<h2>include지시어로 페이지 삽입하기</h2>
    		<%@ include file="DirectivePage.jsp" %>
    		<h2>include액션태그로 페이지 삽입하기</h2>
    		<!-- page속성에 표현식 가능 -->
    		<jsp:include page="<%=actionPath %>"/>
    		<h2>삽입된 페이지 안에서 선언한 변수 사용하기</h2>
    		directiveString : <%=directiveString %><br/>
    		<!-- include액션태그로 포함된 페이지에서 선언한 변수는
		         사용불가(실행결과(HTML결과)만 포함됨으로)
		    -->
    		actiontagString : <%--=actiontagString --%>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>