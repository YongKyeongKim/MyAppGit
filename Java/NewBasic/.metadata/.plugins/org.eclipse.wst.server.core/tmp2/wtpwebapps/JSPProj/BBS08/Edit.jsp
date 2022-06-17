<%@page import="model.BBSDto"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 로그인 여부 판단 -->
<jsp:include page="/Common/IsMember.jsp" />

<%
	//1]파라미터(키값) 받기	
	String no = request.getParameter("no");
	//현재 페이지번호 받기
	String nowPage=request.getParameter("nowPage");
	//검색과 관련된 파라미터 받기
	String searchWord = request.getParameter("searchWord");
	String searchColumn = request.getParameter("searchColumn");
	
	//2]CRUD작업용 BbsDAO생성
	BBSDao dao = new BBSDao(application);	
	BBSDto article = dao.selectOne(no,null);
	dao.close();
%>

<jsp:include page="/Template/Top.jsp" />

<div class="jumbotron jumbotron-fluid bg-warning">
	<div class="container-fluid">
		<h1>
			게시판 수정<small>글을 수정 하세요</small>
		</h1>
	</div>
	<!--jumbotron-->
</div>
<!--container-->
<div class="container">
	<form method="post" action="EditOk.jsp">  
	 	<input type="hidden"  value="<%=article.getNo()%>" name="no"> 
	 	<input type="hidden"  value="<%=nowPage%>" name="nowPage"> 
	 	<input type="hidden"  value="<%=searchWord==null?"":searchWord%>" name="searchWord"> 
	 	<input type="hidden"  value="<%=searchColumn==null?"":searchColumn%>" name="searchColumn">    
      <div class="form-group">
        <label><kbd class="lead">제목</kbd></label>
        <input type="text"  value="<%=article.getTitle()%>" class="form-control" placeholder="제목을 입력하세요" name="title">
      </div>
      <div class="form-group">
		<label><kbd class="lead">내용</kbd></label>
		<textarea class="form-control" rows="5" name="content"><%=article.getContent()%></textarea>
	  </div>
      <button type="submit" class="btn btn-primary">수정</button>
    </form>	
</div>

<jsp:include page="/Template/Footer.jsp" />

