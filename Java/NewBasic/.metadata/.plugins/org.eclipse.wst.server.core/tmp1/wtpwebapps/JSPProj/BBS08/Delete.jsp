<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BBSDao"%>
<%@page import="model.BBSDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 여부 판단 -->
<jsp:include page="/Common/IsMember.jsp" />

<!-- Delete.jsp -->
<%
	//파라미터 받기
	String no=request.getParameter("no");
	//현재 페이지번호 받기
	int nowPage=Integer.parseInt(request.getParameter("nowPage"));
	//검색과 관련된 파라미터 받기
	String searchWord = request.getParameter("searchWord");// 한글 그대로 받음	
	String searchColumn = request.getParameter("searchColumn");
	String searchString ="";//검색용 쿼리 스트링	
	Map map = new HashMap();
	if(searchWord !=null && searchWord.length()!=0){		
		//검색시 생성된 페이징 번호 클릭시 처리하기 위한 추가 쿼리스트링
		searchString=String.format("searchWord=%s&searchColumn=%s&",URLEncoder.encode(searchWord,"UTF-8") ,searchColumn);
		map.put("searchWord",searchWord);
		map.put("searchColumn",searchColumn);
	}	
	//CRUD작업용 DAO계열 객체 생성
	BBSDao dao = new BBSDao(application);
	int affected=dao.delete(no);
	//마지막 레코드 삭제시 페이지가 하나 줄어드는 경우 코딩 시작
	int totalRowCount = dao.getTotalRecordCount(map);
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE-SIZE"));
	int totalPage= (int)Math.ceil((double)totalRowCount/pageSize);
	if(totalPage < nowPage) nowPage=totalPage;	
	//마지막 레코드 삭제시 페이지가 하나 줄어드는 경우 코딩 끝
	dao.close();
	
	if(affected==1){
		response.sendRedirect("List.jsp?nowPage="+nowPage+"&"+searchString);
	}
	else{
		out.println("<script>");
		out.println("alert('삭제 실패했어요');");
		out.println("history.back();");
		out.println("</script>");		
	}

%>