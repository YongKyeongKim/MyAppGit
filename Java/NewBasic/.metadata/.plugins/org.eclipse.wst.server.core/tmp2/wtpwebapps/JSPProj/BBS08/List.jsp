<%@page import="model.PagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BBSDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 로그인 여부 판단 -->
<jsp:include page="/Common/IsMember.jsp" />
<%

	//시작 및 끝 행번호 와 검색 관련 데이타 저장용
	Map map = new HashMap();

	//검색과 관련된 파라미터 받기
	String searchWord = request.getParameter("searchWord");
	String searchColumn = request.getParameter("searchColumn");
	
	String searchString ="";//검색용 쿼리 스트링	
	if(searchWord !=null && searchWord.length() !=0){
		map.put("searchWord", searchWord);
		map.put("searchColumn", searchColumn);
		//검색시 생성된 페이징 번호 클릭시 처리하기 위한 추가 쿼리스트링
		searchString=String.format("searchWord=%s&searchColumn=%s&",searchWord,searchColumn);
	}	
	//전체 글 목록 가져오기
	BBSDao dao = new BBSDao(application);
	/*
	//페이징을 위한 로직 시작
	//전체 레코드수
	int totalRecordCount = dao.getTotalRecordCount(map);
	//페이지사이즈
	int pageSize = Integer.parseInt(application.getInitParameter("PAGE-SIZE"));
	//블락페이지
	int blockPage = Integer.parseInt(application.getInitParameter("BLOCK-PAGE"));
	//전체 페이지수
	int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
	//현재 페이지 번호
	int nowPage=request.getParameter("nowPage")==null ? 1 : Integer.parseInt(request.getParameter("nowPage"));
	//시작 및 끝 ROWNUM구하기
	int start=(nowPage-1)*pageSize+1;
	int end=nowPage*pageSize;	
	//페이징을 위한 로직 끝
	map.put("start",start);
	map.put("end",end);
	*/
	//제너릭 인터페이스 상속받은 경우
	PagingUtil.setMapForPaging(map, dao, request);
	int totalRecordCount=Integer.parseInt(map.get("totalRecordCount").toString());
	int pageSize = Integer.parseInt(map.get("pageSize").toString());
	int blockPage=Integer.parseInt(map.get("blockPage").toString());
	int nowPage = Integer.parseInt(map.get("nowPage").toString());
	List<BBSDto> articles= dao.selectList(map);
	
	dao.close();
%>
<jsp:include page="/Template/Top.jsp" />
<style>
	a{
		color:white;
	}
	a:hover{
		color:red;
	}
</style>



<div class="jumbotron jumbotron-fluid bg-warning">
	<div class="container-fluid">
		<h1>
			게시판 목록<small>모든 글의 목록입니다</small>
		</h1>
	</div>
	<!--jumbotron-->
</div>

<!--container-->
<div class="container">
	<div class="text-right mb-2">
		<a href="Write.jsp" class="btn btn-danger">글등록</a>
	</div>
	<table class="table table-dark table-hover text-center">
	
		<thead>
			<tr>
				<th class="col-1">번호</th>
				<th>제목</th>
				<th class="col-2">작성자</th>
				<th class="col-1">조회수</th>
				<th class="col-2">작성일</th>
			</tr>
		</thead>
		<tbody class="table-sm">
			<%if(articles.isEmpty()){ %>
			<tr>
				<td colspan="5">등록된 글이 없습니다.</td>
			</tr>	
			<%}else{
				int countNum=0;
				for(BBSDto article:articles){
					
			%>		
			
			<tr>
				<td><%=totalRecordCount - (((nowPage - 1) * pageSize) + countNum) %></td>				
				<td class="text-left"><a href="View.jsp?no=<%=article.getNo()%>&nowPage=<%=nowPage%>&<%=searchString%>"><%=article.getTitle() %></a></td>
				<td><%=article.getName() %></td>	
				<td><%=article.getHitCount() %></td>	
				<td><%=article.getPostDate() %></td>	
			</tr>
			<%
				countNum++;
			}
				}%>
			
		</tbody>
	</table>
	<!-- 페이징 출력 -->
	<%=PagingUtil.pagingBootStrapStyle(
			totalRecordCount,
			pageSize,
			blockPage,
			nowPage, "List.jsp?"+searchString)  %>
	<!-- 검색 UI -->
	<form class="form-inline justify-content-center" method="post">
       <select class="form-control" name="searchColumn">
	    <option value="title">제목</option>
	    <option value="content">내용</option>
	    <option value="name">작성자</option>	    
	  </select>
      <input type="text" class="form-control mx-2 my-2" placeholder="검색어를 입력하세요" name="searchWord"/>      
      <button type="submit" class="btn btn-primary">검색</button>
    </form>

</div>

<jsp:include page="/Template/Footer.jsp" />

