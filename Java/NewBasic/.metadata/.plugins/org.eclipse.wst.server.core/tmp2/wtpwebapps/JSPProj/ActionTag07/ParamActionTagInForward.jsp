<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ParamActionTagInForward.jsp -->
<%-- 
forward액션태그는 쿼리스트링으로 데이타를 전달해도 된다

<jsp:forward page="ForwardedPage.jsp?id=KOSMO&name=한소인"/>
--%>
<%
	/*
	 톰캣 9이하에서
	 포워드로 페이지 전환시
	 파라미터로 한글 전달시 한글이 깨진다
	 이때는 포워드시키는 페이지나 포워드되는 페이지 어느쪽에서나 
	 아래 코드추가
	*/
	request.setCharacterEncoding("UTF-8");
	/*
	파라미터의 값을 표현식으로 처리하고자 할때는 param액션 태그를 이용한다.
	value속성은 표현식 가능
	단,name속성은 표현식 사용불가.즉 문자열만 와야한다
	*/
	String pageName="ForwardedPage.jsp?id=KOSMO&name=한소인";
	String password="1234";
	
	request.setAttribute("requestScope", "리퀘스트 영역입니다");
%>
<%--
page속성에 표현식을 넣을때는 Only 표현식  
<jsp:forward page="<%=pageName%>"/>
--%>
<%-- 
에러 발생 즉 Only 표현식만
<jsp:forward page="<%=pageName%>&pwd=1234"/>
--%>
<jsp:forward page="<%=pageName%>">
	<jsp:param value="<%=password%>" name="pwd"/>

</jsp:forward>
