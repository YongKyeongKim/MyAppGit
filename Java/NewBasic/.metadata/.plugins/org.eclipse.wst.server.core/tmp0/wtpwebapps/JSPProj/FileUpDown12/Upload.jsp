<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Upload.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
/*점보트론 세로폭 줄이기*/
.jumbotron {
	padding-top: 1rem;
	padding-bottom: 1rem;
}
</style>
</head>
<body>
	<div class="jumbotron jumbotron-fluid bg-warning">
		<div class="container-fluid">
			<h1>파일 업로드/다운로드</h1>
		</div>
		<!--container-fluid-->
	</div>
	<!--jumbotron-fluid-->
	<div class="container">
		<c:if test="${! empty maxUploadError  }">
			<div class="alert alert-success">
			  <strong>${maxUploadError}</strong>
			</div>
		</c:if>
		<div class="d-flex justify-content-end">
			<a href="UploadList.jsp" class="btn btn-success">파일목록</a>
		</div>
		<form action="UploadComplete.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label><kbd class="lead">올린이</kbd></label> <input type="text"
					class="form-control" name="name" placeholder="올린이를 입력하세요">
			</div>
			<div class="form-group">
				<label><kbd class="lead">제목</kbd></label> <input type="text"
					class="form-control" name="title" placeholder="제목을 입력하세요">
			</div>			
			<div class="form-group">
				<label><kbd class="lead">관심사항</kbd></label>
				<div class="d-flex">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" name="inter"
							value="정치" id="POL"> <label class="custom-control-label"
							for="POL">정치</label>
					</div>
					<div class="custom-control custom-checkbox mx-2">
						<input type="checkbox" class="custom-control-input" name="inter"
							value="경제" id="ECO"> <label class="custom-control-label"
							for="ECO">경제</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" name="inter"
							value="연예" id="ENT"> <label class="custom-control-label"
							for="ENT">연예</label>
					</div>
					<div class="custom-control custom-checkbox ml-2">
						<input type="checkbox" class="custom-control-input" name="inter"
							value="스포츠" id="SPO"> <label class="custom-control-label"
							for="SPO">스포츠</label>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label><kbd class="lead">첨부파일1</kbd>
					</kbd></label>
				<div class="custom-file">
					<input type="file" class="custom-file-input" name="attachFile1" id="file1">
					<label class="custom-file-label" for="file1">파일1을 첨부하세요</label>
				</div>
			</div>
			<div class="form-group">
				<label><kbd class="lead">첨부파일2</kbd>
					</kbd></label>
				<div class="custom-file">
					<input type="file" class="custom-file-input" name="attachFile2" id="file2">
					<label class="custom-file-label" for="file2">파일2을 첨부하세요</label>
				</div>
			</div>
			
			<button type="submit" class="btn btn-primary">파일 업로드</button>
		</form>
	</div>
	<!-- container -->
	<script>  
	  // Add the following code if you want the name of the file appear on select
	  $(".custom-file-input").on("change", function() {
	    var fileName = $(this).val().split("\\").pop();
	    $(this).siblings(".custom-file-label").html(fileName);
	  });
   </script>
   
</body>
</html>