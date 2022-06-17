<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BuiltInObjectOfParamExamIndex.jsp</title>
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
			<h1>Expression Language</h1>
		</div>
		<!--container-fluid-->
	</div>
	<!--jumbotron-fluid-->
	<div class="container">
		<fieldset class="form-group border p-3">
			<legend class="w-auto p-3">사용자 입력값 받기</legend>
			<form action="BuiltInObjectOfParamExamResult.jsp" method="post">
				<div class="form-group">
					<label><kbd class="lead">이름</kbd></label> <input type="text"
						class="form-control" name="name" placeholder="이름을 입력하세요">
				</div>				
				<div class="form-group">
					<label><kbd class="lead">성별</kbd></label>
					<div class="d-flex">
						<div class="custom-control custom-radio mr-2">
							<input type="radio" class="custom-control-input" name="gender"
								value="남자" id="male"> <label for="male"
								class="custom-control-label">남자</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" class="custom-control-input" name="gender"
								value="여자" id="female"> <label for="female"
								class="custom-control-label">여자</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label><kbd class="lead">관심사항</kbd></label>
					<div class="d-flex">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="inter"
								value="정치" id="POL"> <label
								class="custom-control-label" for="POL">정치</label>
						</div>
						<div class="custom-control custom-checkbox mx-2">
							<input type="checkbox" class="custom-control-input" name="inter"
								value="경제" id="ECO"> <label
								class="custom-control-label" for="ECO">경제</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input" name="inter"
								value="연예" id="ENT"> <label
								class="custom-control-label" for="ENT">연예</label>
						</div>
						<div class="custom-control custom-checkbox ml-2">
							<input type="checkbox" class="custom-control-input" name="inter"
								value="스포츠" id="SPO"> <label
								class="custom-control-label" for="SPO">스포츠</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label><kbd class="lead">학력사항</kbd></label> 
					<select name="grade"
						class="custom-select mt-3 custom-select-lg">
						<option value="">학력을 선택하세요</option>
						<option value="초등학교">초등학교</option>
						<option value="중학교">중학교</option>
						<option value="고등학교">고등학교</option>
						<option value="대학교">대학교</option>
					</select>
				</div>
				
				<button type="submit" class="btn btn-primary">확인</button>
			</form>
		</fieldset>
	</div>
	<!-- container -->
</body>
</html>