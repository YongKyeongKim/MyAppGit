<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ActiontagPage.jsp -->
<%
	//- 이 페이지는 서블릿으로 변환
	//- 즉 다른 페이지다
	//- 실행결과가 페이지에 포함된다.
	//- request영역 공유

	//변수 선언
	String actiontagString="액션태그로 삽입된 페이지안에서 선언한 변수";
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<hr/>
<h4>ActiontagPage.jsp페이지 입니다</h4>
<ul class="list-unstyled">
	<li>페이지 영역 : <%=pageContext.getAttribute("pageVar") %></li>
	<li>리퀘스트 영역 : <%=request.getAttribute("requestVar") %></li>
	
</ul>