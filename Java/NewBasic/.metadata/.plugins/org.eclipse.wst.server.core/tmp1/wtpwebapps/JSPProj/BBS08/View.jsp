<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Map"%>
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
	String searchString ="";//검색용 쿼리 스트링	
	if(searchWord !=null && searchWord.length()!=0){		
		//검색시 생성된 페이징 번호 클릭시 처리하기 위한 추가 쿼리스트링
		searchString=String.format("searchWord=%s&searchColumn=%s&",URLDecoder.decode(searchWord,"UTF-8"),searchColumn);
	}	
	
	//2]CRUD작업용 BbsDAO생성
	BBSDao dao = new BBSDao(application);
	//이전 페이지명 얻기:List.jsp에서 뷰로 올때만 조회수 증가 하기 위함
	String referer = request.getHeader("referer");
	//http://localhost:8080/JSPProj/BBS08/List.jsp
	String prev = referer.substring(referer.lastIndexOf("/") + 1);
	BBSDto article = dao.selectOne(no, prev);
	
	//이전글/다음글 조회
	Map<String,BBSDto> map= dao.prevNext(no);
	
	dao.close();
%>
<jsp:include page="/Template/Top.jsp" />
<script>
	function isDelete(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.replace("Delete.jsp?no=<%=no%>&nowPage=<%=nowPage%>");
		}
	}
</script>

<div class="jumbotron jumbotron-fluid bg-warning">
	<div class="container-fluid">
		<h1>
			게시판 상세<small>상세보기 입니다</small>
		</h1>
	</div>
	<!--jumbotron-->
</div>
<!--container-->
<div class="container">
	<table class="table table-bordered">
		<tbody class="table-sm">
			<tr>
				<th class="w-25 bg-dark text-white text-center">번호</th>
				<td><%=article.getNo()%></td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">작성자</th>
				<td><%=article.getName()%></td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">작성일</th>
				<td><%=article.getPostDate()%></td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">조회수</th>
				<td><%=article.getHitCount()%></td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">제목</th>
				<td><%=article.getTitle()%></td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2"><%=article.getContent().replace("\r\n", "<br/>")%></td>
			</tr>
		</tbody>
	</table>
	<!-- 이전글/다음글 -->
	<div>
		<table class="table">
			<tbody>
				<tr>
					<td class="border-top-0 bg-info" style="width:7%">이전글</td>
					<td class="border-top-0"><%=map.get("PREV")==null? "이전 글이 없습니다":String.format("<a href='View.jsp?no=%s'>%s</a>",map.get("PREV").getNo(),map.get("PREV").getTitle())%></td>
				</tr>
				<tr>
					<td class="bg-info">다음글</td>
					<td><%=map.get("NEXT")==null? "다음 글이 없습니다":String.format("<a href='View.jsp?no=%s'>%s</a>",map.get("NEXT").getNo(),map.get("NEXT").getTitle())%></td>
				</tr>
			</tbody>
		</table>
	</div>

	<!-- 수정/삭제/목록 컨트롤 버튼 -->
	<div class="text-center">
		<%
		if (session.getAttribute("USER-ID").equals(article.getId())) {
		%>
		<a href="Edit.jsp?no=<%=article.getNo()%>&nowPage=<%=nowPage %>&<%=searchString %>" class="btn btn-success">수정</a>
		<a href="javascript:isDelete()" class="btn btn-success">삭제</a>
		<%
		}
		%>
		<a href="List.jsp?nowPage=<%=nowPage %>&<%=searchString %>" class="btn btn-success">목록</a>
	</div>

</div>
<jsp:include page="/Template/Footer.jsp" />

