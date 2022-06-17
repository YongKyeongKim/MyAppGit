<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- BuiltInObjectOfParamIndex.jsp -->
<%
	//페이지 이동전 리퀘스트 영역에 속성저장]	
	request.setAttribute("dtoObject",new MemberDTO("KIM","1234","김길동","20"));
	request.setAttribute("stringObject",new String("문자열 객체"));
	request.setAttribute("integerObject",new Integer(1000));
%>
<jsp:forward page="BuiltInObjectOfParamResult.jsp">
	<jsp:param value="10" name="first"/>
	<jsp:param value="5" name="second"/>
</jsp:forward>