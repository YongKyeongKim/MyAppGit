<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//회원인 경우만 이용 가능 토록 처리]
	//로그인 여부 판단]
	if(session.getAttribute("USER-ID")==null){
%>
		<script>
		alert("로그인후 이용하세요");
		location.replace("<%=request.getContextPath() %>/Session06/Login.jsp");
		
		</script>
<%
		return;		
	}////////////
%>