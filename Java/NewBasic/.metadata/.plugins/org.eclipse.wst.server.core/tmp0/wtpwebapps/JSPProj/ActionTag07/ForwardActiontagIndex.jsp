<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ForwardActiontagIndex.jsp -->
<%
	//포워드前 영역에 속성 저장	
	pageContext.setAttribute("pageVar", "페이지 영역");
	request.setAttribute("requestVar", "리퀘스트 영역");
%>
<!-- 액션 태그로 포워딩 -->
<jsp:forward page="/ActionTag07/ForwardActiontagResult.jsp"/>