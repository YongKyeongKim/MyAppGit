<%@page import="model.BBSDao"%>
<%@page import="model.BBSDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 여부 판단 -->
<jsp:include page="/Common/IsMember.jsp" />

<!-- WriteOk.jsp -->
<%
	//POST방식일때 한글 깨지는 거 처리용
	request.setCharacterEncoding("UTF-8");
	//파라미터 받기
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//작성자의 아이디 얻기:세션영역에서
	String id=session.getAttribute("USER-ID").toString();
	//데이타를 전달할 DTO객체 생성및 데이타 설정
	BBSDto dto = new BBSDto();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(id);
	//CRUD작업용 DAO계열 객체 생성
	BBSDao dao = new BBSDao(application);
	int affected=dao.insert(dto);
	dao.close();
	if(affected==1){
		response.sendRedirect("List.jsp");
	}
	else{
		out.println("<script>");
		out.println("alert('입력 실패했어요');");
		out.println("history.back();");
		out.println("</script>");		
	}

%>