<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/Template/Top.jsp"/>

	<div class="jumbotron jumbotron-fluid bg-warning">
		<div class="container-fluid">
			<h1>한국소프트웨어 인재개발원</h1>
			<p>https://www.ikosmo.co.kr/</p>
		</div>
		<!--jumbotron-->
	</div>
	<!--jumbotron-fluid-->
	<div class="container">
		<form action="RequestForParameterComplete.jsp" method="post">
			<div class="form-group">
				<label><kbd class="lead">아이디</kbd></label> 
				<input type="text" class="form-control" name="id" placeholder="아이디를 입력하세요">
			</div>
			<div class="form-group">
				<label><kbd class="lead">비밀번호</kbd></label> 
				<input type="password" class="form-control" name="pwd" placeholder="비밀번호를 입력하세요">
			</div>
			<div class="form-group">
				<label><kbd class="lead">비밀번호 확인</kbd></label> 
				<input type="password" class="form-control" name="pwd2"	placeholder="비밀번호 다시한번 입력하세요">
			</div>
			<div class="form-group">
				<label><kbd class="lead">성별</kbd></label>
				<div class="d-flex">
					<div class="custom-control custom-radio mr-2">
						<input type="radio" class="custom-control-input" name="gender" value="man" id="male"> 
						<label for="male" class="custom-control-label">남자</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" class="custom-control-input" name="gender" value="woman" id="female"> 
						<label for="female"	class="custom-control-label">여자</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label><kbd class="lead">관심사항</kbd></label>
				<div class="d-flex">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" name="inter" value="POL" id="POL">
						<label class="custom-control-label" for="POL">정치</label>
					</div>
					<div class="custom-control custom-checkbox mx-2">
						<input type="checkbox" class="custom-control-input" name="inter" value="ECO" id="ECO">
						<label class="custom-control-label" for="ECO">경제</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" name="inter" value="ENT" id="ENT">
						<label class="custom-control-label" for="ENT">연예</label>
					</div>
					<div class="custom-control custom-checkbox ml-2">
						<input type="checkbox" class="custom-control-input" name="inter" value="SPO" id="SPO">
						<label class="custom-control-label" for="SPO">스포츠</label>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label><kbd class="lead">학력사항</kbd></label> 
				<select name="grade" class="custom-select mt-3 custom-select-lg">
					<option value="">학력을 선택하세요</option>
					<option value="ELE">초등학교</option>
					<option value="MID">중학교</option>
					<option value="HIG">고등학교</option>
					<option value="UNI">대학교</option>
				</select>
			</div>
			<div class="form-group">
				<label><kbd class="lead">첨부파일</kbd></kbd></label>
				<div class="custom-file">
					<input type="file" class="custom-file-input" name="file" id="file"> 
					<label	class="custom-file-label" for="file">파일을 첨부하세요</label>
				</div>
			</div>
			<div class="form-group">
				<label><kbd class="lead">자기소개</kbd></kbd></label>
				<textarea class="form-control" rows="5" name="self"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">확인</button>
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
   
<jsp:include page="/Template/Footer.jsp"/>