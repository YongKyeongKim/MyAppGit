<%@page import="model.PagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BBSDto"%>
<%@page import="java.util.List"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			자료실 목록<small>모든 자료실의 목록입니다</small>
		</h1>
	</div>
	<!--jumbotron-->
</div>

<!--container-->
<div class="container">
	<div class="text-right mb-2">
		<a href="<c:url value="/DataRoom/Write.kosmo"/> " class="btn btn-danger">자료 등록</a>
	</div>
	<table class="table table-dark table-hover text-center">
	
		<thead>
			<tr>
				<th class="col-1">번호</th>
				<th>제목</th>
				<th class="col-2">올린이</th>
				<th class="col-2">자료파일</th>
				<th class="col-1">다운수</th>
				<th class="col-2">등록일</th>
			</tr>
		</thead>
		<tbody class="table-sm down-file-body">
			<c:if test="${empty records }" var="isEmpty">
				<tr>
					<td colspan="6">등록된 자료가 없습니다.</td>
				</tr>	
			</c:if>
			<c:if test="${not isEmpty }">
				<c:forEach var="record" items="${records}" varStatus="loop">
					<tr>
						<td>${pagingMap.totalRecordCount - (((pagingMap.nowPage - 1) * pagingMap.pageSize) + loop.index)}</td>				
						<td class="text-left"><a href="<c:url value="/DataRoom/View.kosmo?no=${record.no}&nowPage="/><c:out value="${param.nowPage}" default="1"/>">${record.title}</a></td>
						<td>${record.name}</td>	
						<td><a class="down-file${loop.count}" href="<c:url value="/DataRoom/Download.kosmo?filename=${record.attachFile}&no=${record.no}"/>">${record.attachFile}</a></td>	
						<td id="down-count${loop.count}">${record.downCount}</td>
						<td>${record.postDate}</td>	
					</tr>
				</c:forEach>
			</c:if>
			
		</tbody>
	</table>
	<!-- 페이징 출력 -->
	<div>
	${pagingString }
	</div>
</div>
<jsp:include page="/Template/Footer.jsp" />
<script>
	var tbody=document.querySelector(".down-file-body");
	tbody.onclick= function(e){
		console.log(e.target.nodeName);
		if(e.target.nodeName ==="A"){
			console.log("클릭한 A태그의 클래스명:",e.target.className);
			//a태그의 클래스명에서 끝에 숫자 추출
			var className= e.target.className;
			var numbering = className.substring("down-file".length,className.length);
			//아이디로 다운수가 있는  td요소 얻기
			var td = tbody.querySelector("#down-count"+numbering);
			console.log("다운로드수:"+td.textContent);
			//다운수 읽어오기(숫자로 변환)
			var downCount = Number(td.textContent);
			//1을 더해서 다시 설정
			td.textContent=downCount+1;
		}
	};

</script>

