<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/Template/Top.jsp" />

<div class="jumbotron jumbotron-fluid bg-warning">
	<div class="container-fluid">
		<h1>
			자료실 수정<small>자료파일을 수정 하세요</small>
		</h1>
	</div>
	<!--jumbotron-->
</div>
<!--container-->
<div class="container">
	<form method="post" action="<c:url value="/DataRoom/Edit.kosmo"/>" enctype="multipart/form-data">      
      <input type="hidden" name="no" value="${record.no}"/>
      <input type="hidden" name="nowPage" value="${param.nowPage}"/>
      <input type="hidden" name="originalFileName" value="${record.attachFile}"/>
      <div class="form-group">
        <label><kbd class="lead">올린이</kbd></label>
        <input value="${record.name}" type="text" class="form-control" placeholder="이름을 입력하세요" name="name">
      </div>
      <div class="form-group">
        <label><kbd class="lead">제목</kbd></label>
        <input value="${record.title}" type="text" class="form-control" placeholder="제목을 입력하세요" name="title">
      </div>
      <div class="form-group">
        <label><kbd class="lead">자료파일</kbd></label>
       	<input type="file"   class="form-control-file" name="attachFile"> ${record.attachFile}    
      </div>
      <div class="form-group">
        <label><kbd class="lead">비밀번호</kbd></label>
        <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="password">
      </div>
      <div class="form-group">
		<label><kbd class="lead">내용</kbd></label>
		<textarea class="form-control" rows="5" name="content">${record.content}</textarea>
	  </div>
      <button type="submit" class="btn btn-primary">수정</button>
    </form>	
</div>
<jsp:include page="/Template/Footer.jsp" />
<script>
	//var form=document.querySelector("form[enctype='multipart/form-data'");
	//var file=document.querySelector("input[type=file]");
	/*    	
	//파일 사이즈(바이트):파일객체(자스 DOM).files[0].size
	//파일 명:파일객체(자스 DOM).files[0].name
	//파일 컨텐츠 타입:파일객체(자스 DOM).files[0].type
	*/
	/*
	form.onsubmit=function(e){
		//파일 용량이 초과 됬을때 체크
		console.log(file.files);
		if(file.files[0].size > 1024*500){
			alert("최대 업로드 용량(500KB)를 초과 했어요");
			return false;
		}
		
	};*/
</script>

