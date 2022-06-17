<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>파일업로드/다운로드</h1>
	  <p>${maxError}</p>	  
	</div>
	<a class="btn btn-info" href="<c:url value="/FileUpDown/FileList.do"/>">목록으로 가기</a>
	<hr/>
	<form action="<c:url value="/FileUpDown/FileUpload.do"/>"
		method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label><kbd class="lead">올린이</kbd></label> <input type="text"
				value="${param.writer}" class="form-control" name="writer"
				>
		</div>
		<div class="form-group">
			<label><kbd class="lead">제목</kbd></label> <input type="text"
				value="${param.title}" class="form-control" name="title"
				>
		</div>
		<div class="form-group">
			<label><kbd class="lead">첨부파일</kbd></label> <input type="file"
				class="form-control-file border" name="upload"
				>
		</div>
		<button type="submit" class="btn btn-primary">업로드</button>
	</form>
	
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		