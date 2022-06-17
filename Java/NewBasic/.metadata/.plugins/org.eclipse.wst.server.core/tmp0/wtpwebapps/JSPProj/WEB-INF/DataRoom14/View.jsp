<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Map"%>
<%@page import="model.BBSDto"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/Template/Top.jsp" />


<div class="jumbotron jumbotron-fluid bg-warning">
	<div class="container-fluid">
		<h1>
			자료실 상세<small>상세보기 입니다</small>
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
				<td>${record.no}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">올린이</th>
				<td>${record.name}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">등록일</th>
				<td>${record.postDate}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">다운수</th>
				<td id="down-count">${record.downCount}</td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">자료파일</th>
				<td><a class="down-file" href="<c:url value="/DataRoom/Download.kosmo?filename=${record.attachFile}&no=${record.no}"/>">${record.attachFile}</a></td>
			</tr>
			<tr>
				<th class="w-25 bg-dark text-white text-center">제목</th>
				<td>${record.title}</td>
			</tr>
			<tr>
				<th class="bg-dark text-white text-center" colspan="2">내 용</th>
			</tr>
			<tr>
				<td colspan="2">${record.content}</td>
			</tr>
		</tbody>
	</table>



	<!-- 수정/삭제/목록 컨트롤 버튼 -->
	<div class="text-center">
		<button class="btn btn-success password-update-delete">수정</button> 
		<button class="btn btn-success password-update-delete">삭제</button> 
		<a href="<c:url value="/DataRoom/List.kosmo?nowPage=${param.nowPage}"/>" class="btn btn-success">목록</a>
	</div>
</div>
<jsp:include page="/Template/Footer.jsp" />


<!-- 수정/삭제시 사용할 모달 시작 -->
<div class="modal fade" id="passwordModal">	
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">비밀번호 입력창</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body d-flex justify-content-center">
				<form class="form-inline" action="<c:url value="/DataRoom/Password.kosmo"/>" method="POST">					
					<!-- 키값 -->
					<input type="hidden" name="no" value="${record.no}"/>
					<!-- 수정/삭제 판단용 -->
					<input type="hidden" name="mode"/>
					<!-- 현재 페이지 번호 -->
					<input type="hidden" name="nowPage" value="${param.nowPage}"/>
					<!-- 업로드된 파일명:삭제메뉴 클릭시 테이블 데이타 삭제후 업로드된 기존 파일 삭제하기 위함 -->
					<input type="hidden" name="orignalFileName" value="${record.attachFile }"/>
					<label>비밀번호</label> 
					<input type="password" name="password" class="form-control mx-2" placeholder="비밀번호를 입력하세요"/> 
					<input type="submit" class="btn btn-danger mx-2" value="확인" />
				</form>			
			</div>
		</div>
	</div>
</div>
<!-- 수정/삭제시 사용할 모달 끝 -->

<script>
  var mode = $('input[name=mode]');
  $('.password-update-delete').click(function(){    
	  console.log($(this).html());
	  if($(this).html()==='수정'){//수정버튼 클릭
		mode.val('UPDATE');
	  	$('.modal-title').html('수정용 비밀번호 입력창');
	  	console.log(mode.val());
	  	$('#passwordModal').modal({backdrop:'static'});
	  }
	  else{//삭제버튼 클릭
		  if(window.confirm("정말로 삭제 하시겠습니까?")){
		  	mode.val('DELETE');
		  	$('.modal-title').html('삭제용 비밀번호 입력창');
		  	$('#passwordModal').modal({backdrop:'static'});
		  }
	  }      
  }); 
  var td=document.querySelector("#down-count");
  document.querySelector(".down-file").onclick=function(){
	  var downCount = parseInt(td.innerHTML);
	  td.innerHTML = downCount+1;
  };
  
</script>

