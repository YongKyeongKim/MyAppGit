<%@page import="java.net.URLEncoder"%>
<%@page import="model.BBSDao"%>
<%@page import="model.BBSDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 여부 판단 -->
<jsp:include page="/Common/IsMember.jsp" />

<!-- EditOk.jsp -->
<%
	//POST방식일때 한글 깨지는거 처리용
	request.setCharacterEncoding("UTF-8");
	//파라미터 받기
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String no=request.getParameter("no");
	//현재 페이지번호 받기
	String nowPage=request.getParameter("nowPage");
	
	/*
	searchWord를 한글로 검색후 수정시/삭제시 주의 사항
	※sendRedirect()메소드로 쿼리스트링으로 한글 전달시 한글 깨짐
	해결책:
	1.검색어를  URLEncoder.encode()
	  단,검색후 총 레코드 수 구할때는 인코딩하지 않는 검색어 전달
	2.수정완료시 뷰 혹은 삭제 완료시 목록으로 이동시 뷰(View.jsp)나 목록(List.jsp)에서는 URLDecoder.decode()해야 한다
	
	단,form태그로 이동하거나 a 태그로 이동시에는  URL 인코딩 및 디코딩 불필요
	*/
	//검색과 관련된 파라미터 받기
	String searchWord = request.getParameter("searchWord");// 한글 그대로 받음	
	String searchColumn = request.getParameter("searchColumn");
	String searchString ="";//검색용 쿼리 스트링	
	if(searchWord !=null && searchWord.length()!=0){		
		//검색시 생성된 페이징 번호 클릭시 처리하기 위한 추가 쿼리스트링
		searchString=String.format("searchWord=%s&searchColumn=%s&",URLEncoder.encode(searchWord,"UTF-8") ,searchColumn);
	}	
	//데이타를 전달할 DTO객체 생성및 데이타 설정
	BBSDto dto = new BBSDto();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setNo(no);
	//CRUD작업용 DAO계열 객체 생성
	BBSDao dao = new BBSDao(application);
	int affected=dao.update(dto);
	dao.close();
	if(affected==1){
		//sendRedirect()로 이동(URLEncoder으로 한글 처리)
		response.sendRedirect("View.jsp?no="+no+"&nowPage="+nowPage+"&"+searchString);
	}
	else{
		out.println("<script>");
		out.println("alert('수정 실패했어요');");
		out.println("history.back();");
		out.println("</script>");		
	}

%>