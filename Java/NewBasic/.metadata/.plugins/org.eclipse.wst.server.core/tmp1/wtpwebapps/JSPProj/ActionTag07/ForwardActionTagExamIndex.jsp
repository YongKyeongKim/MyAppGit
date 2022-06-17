<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ForwardActionTagExamIndex.jsp</title>
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
			<h1>forward액션태그 예제</h1>
		</div>
		<!--container-fluid-->
	</div>
	<!--jumbotron-fluid-->
	<div class="container">
		<form action="ForwardActionTagExamProcess.jsp" method="post">
			<div class="form-group">
				<label for="username">아이디</label> <input type="text"
					class="form-control" placeholder="아이디를 입력하세요" id="username" name="username">
			</div>
			<div class="form-group">
				<label for="password">비밀번호</label> <input type="password"
					class="form-control" placeholder="비밀번호를 입력하세요" id="password" name="password">
			</div>
			
			
			
			<div>
				
				<label>운동종목</label>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input"  name="sports" value="축구">축구
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="checkbox"
						class="form-check-input"  name="sports" value="야구">야구
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <!--반드시 disabled는 속성으로--> <input
						type="checkbox" class="form-check-input" name="sports" value="농구">농구
					</label>
				</div>
			</div>
			<div>
				<label>연령대</label>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="radio"
						class="form-check-input" name="ages" value="20대">20대
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <input type="radio"
						class="form-check-input" name="ages" value="30대">30대
					</label>
				</div>
				<div class="form-check-inline">
					<label class="form-check-label"> <!--반드시 disabled는 속성으로--> <input
						type="radio" class="form-check-input" name="ages" value="40대">40대						
					</label>
				</div>
			</div>	

			<button type="submit" class="btn btn-primary">확인</button>
		</form>
	</div>
	<!-- container -->
</body>
</html>