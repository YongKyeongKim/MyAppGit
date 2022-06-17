<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<hr/>
<h4>삽입된 페이지</h4>
<h5>파라미터로 전달된 데이타</h5>
<ul class="list-unstyled">
	<li>아이디:<%=request.getParameter("id") %></li>
	<li>비밀번호:<%=request.getParameter("pwd") %></li>
	<li>이름:<%=request.getParameter("name") %></li>
</ul>
<h5>리퀘스트 영역에 저장된 데이타</h5>
<%=request.getAttribute("requestScope")  %>