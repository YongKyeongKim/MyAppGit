<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>UseBeanFormIndex.jsp</title>
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
			<h1>폼의 하위 요소값 받기</h1>
		</div>
		<!--container-fluid-->
	</div>
	<!--jumbotron-fluid-->
	<div class="container">
		<fieldset class="form-group border p-3">
			<legend class="w-auto p-3">파라미터명과 자바빈의 속성이 불일치시</legend>
			<form action="UseBeanFormResult.jsp">
				<div class="form-group">
					<label for="username">아이디</label> <input type="text"
						class="form-control" placeholder="아이디를 입력하세요" id="username" name="username">
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label> <input type="password"
						class="form-control" placeholder="비밀번호를 입력하세요" id="password" name="password">
				</div>
				<div class="form-group">
					<label >이름</label> <input type="text"
						class="form-control" placeholder="이름를 입력하세요"  name="name">
				</div>				
				<button type="submit" class="btn btn-primary">확인</button>
			</form>
		</fieldset>
		<fieldset class="form-group border p-3">
			<legend class="w-auto p-3">파라미터명과 자바빈의 속성이 일치시</legend>
			<form action="UseBeanFormResult.jsp">
				<div class="form-group">
					<label for="username">아이디</label> <input type="text"
						class="form-control" placeholder="아이디를 입력하세요" id="username" name="id">
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label> <input type="password"
						class="form-control" placeholder="비밀번호를 입력하세요" id="password" name="pwd">
				</div>
				<div class="form-group">
					<label >이름</label> <input type="text"
						class="form-control" placeholder="이름를 입력하세요"  name="name">
				</div>				
				<button type="submit" class="btn btn-primary">확인</button>
			</form>
		</fieldset>
	</div>
	<!-- container -->
</body>
</html>