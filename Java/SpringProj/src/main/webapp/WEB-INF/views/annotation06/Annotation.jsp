<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />

<div class="container">
	<div class="jumbotron">
		<h1>어노테이션</h1>
	</div>
	<h3>@RequestMapping / @PathVariable</h3>
	<h5>@RequestMapping("/요청URL") : GET/POST둘다 처리 가능</h5>
	<form class="form-inline"
		action="<c:url value="/Annotation/RequestMappingBoth.do"/>"
		method="GET">
		<label>아이디</label> <input type="text" name="id"
			class="form-control mx-2" /> <label>비밀번호</label> <input
			type="password" name="pwd" class="form-control mx-2" /> <input
			type="submit" class="btn btn-danger mx-2" value="로그인" />
	</form>
	<h5>@RequestMapping(value="/요청URL",method=RequestMethod.GET) :
		HTTP메소드중 하나만 처리 가능</h5>
	<form class="form-inline"
		action="<c:url value="/Annotation/RequestMappingOne.do"/>"
		method="POST">
		<label>아이디</label> <input type="text" name="id"
			class="form-control mx-2" /> <label>비밀번호</label> <input
			type="password" name="pwd" class="form-control mx-2" /> <input
			type="submit" class="btn btn-danger mx-2" value="로그인" />
	</form>
	<kbd>${loginInfo }</kbd>
	<hr />
	<h3>@RequestParam</h3>
	<!-- 
  	예]
	//컨트롤러 메소드]
  	public String 메소드(@RequestParam 자료형 매개변수){
  
  	}

    단, 파라미터명과  매개변수명이 일치하지 않은 경우
 	@RequestParam("파라미터명") 자료형 매개변수명
   
	- 해당 파라미터의 자료형으로 받을 수 있다 즉 형변환 불필요
	- 여개개 일때는 자료형을 Map으로   
	-->
	<span class="text-danger">${errorNumber}</span>
	<h5>파라미터명과 매개변수명 일치시</h5>
	<form class="form-inline"
		action="<c:url value="/Annotation/RequestParamEqual.do"/>"
		method="POST">
		<label>이름</label> <input type="text" name="name"
			class="form-control mx-2" /> <label>나이</label> <input type="text"
			name="age" class="form-control mx-2" /> <input type="submit"
			class="btn btn-danger mx-2" value="확인" />
	</form>
	<h5>파라미터명과 매개변수명 불 일치시</h5>
	<form class="form-inline"
		action="<c:url value="/Annotation/RequestParamDiff.do"/>"
		method="POST">
		<label>이름</label> <input type="text" name="nickname"
			class="form-control mx-2" /> <label>나이</label> <input type="text"
			name="years" class="form-control mx-2" /> <input type="submit"
			class="btn btn-danger mx-2" value="확인" />
	</form>
	<kbd>이름 : ${name},10년후 나이 : ${age }</kbd>
	<h5>맵으로 모든 파라미터 받기</h5>
	<form action="<c:url value="/Annotation/RequestParamMap.do"/>"
		method="post">
		<div class="form-group">
			<label><kbd class="lead">아이디</kbd></label> <input type="text"
				value="${param.id}" class="form-control" name="id"
				placeholder="아이디를 입력하세요">
		</div>

		<div class="form-group">
			<label><kbd class="lead">성별</kbd></label>
			<div class="d-flex">
				<div class="custom-control custom-radio mr-2">
					<input type="radio" class="custom-control-input" name="gender"
						value="man" id="male"
						<c:if test="${ gender=='man' }">checked</c:if> /> <label
						for="male" class="custom-control-label">남자</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" class="custom-control-input" name="gender"
						value="woman" id="female"
						<c:if test="${gender=='woman' }">checked</c:if>> <label
						for="female" class="custom-control-label">여자</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label><kbd class="lead">관심사항</kbd></label>
			<div class="d-flex">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="inter"
						value="POL" id="POL"> <label class="custom-control-label"
						for="POL">정치</label>
				</div>
				<div class="custom-control custom-checkbox mx-2">
					<input type="checkbox" class="custom-control-input" name="inter"
						value="ECO" id="ECO"> <label class="custom-control-label"
						for="ECO">경제</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="inter"
						value="ENT" id="ENT"> <label class="custom-control-label"
						for="ENT">연예</label>
				</div>
				<div class="custom-control custom-checkbox ml-2">
					<input type="checkbox" class="custom-control-input" name="inter"
						value="SPO" id="SPO"> <label class="custom-control-label"
						for="SPO">스포츠</label>
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">확인</button>
	</form>
	<kbd>아이디:${id},성별:${gender},관심사항:${inter}</kbd>
	<h3>@ModelAttribute</h3>
	<form action="<c:url value="/Annotation/ModelAttribute.do"/>" method="post">
		<div class="form-group">
			<label><kbd class="lead">이름</kbd></label> <input type="text"
				class="form-control" name="name" placeholder="이름를 입력하세요">
		</div>
		<div class="form-group">
			<label><kbd class="lead">아이디</kbd></label> <input type="text"
				class="form-control" name="id" placeholder="아이디를 입력하세요">
		</div>
		<div class="form-group">
			<label><kbd class="lead">비밀번호</kbd></label> <input type="password"
				class="form-control" name="pwd" placeholder="비밀번호를 입력하세요">
		</div>
		
		<div class="form-group">
			<label><kbd class="lead">성별</kbd></label>
			<div class="d-flex">
				<div class="custom-control custom-radio mr-2">
					<input type="radio" class="custom-control-input" name="gender"
						value="man" id="male1"> <label for="male1"
						class="custom-control-label">남자</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" class="custom-control-input" name="gender"
						value="woman" id="female1"> <label for="female1"
						class="custom-control-label">여자</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label><kbd class="lead">관심사항</kbd></label>
			<div class="d-flex">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="inter"
						value="POL" id="POL1"> <label class="custom-control-label"
						for="POL1">정치</label>
				</div>
				<div class="custom-control custom-checkbox mx-2">
					<input type="checkbox" class="custom-control-input" name="inter"
						value="ECO" id="ECO1"> <label class="custom-control-label"
						for="ECO1">경제</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="inter"
						value="ENT" id="ENT1"> <label class="custom-control-label"
						for="ENT1">연예</label>
				</div>
				<div class="custom-control custom-checkbox ml-2">
					<input type="checkbox" class="custom-control-input" name="inter"
						value="SPO" id="SPO1"> <label class="custom-control-label"
						for="SPO1">스포츠</label>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label><kbd class="lead">학력사항</kbd></label> <select name="grade"
				class="custom-select mt-3 custom-select-lg">
				<option value="">학력을 선택하세요</option>
				<option value="ELE">초등학교</option>
				<option value="MID">중학교</option>
				<option value="HIG">고등학교</option>
				<option value="UNI">대학교</option>
			</select>
		</div>
		<div class="form-group">
			<label><kbd class="lead">첨부파일</kbd>
				</kbd></label>
			<div class="custom-file">
				<input type="file" class="custom-file-input" name="file" id="file1">
				<label class="custom-file-label" for="file1">파일을 첨부하세요</label>
			</div>
		</div>
		<div class="form-group">
			<label><kbd class="lead">자기소개</kbd>
				</kbd></label>
			<textarea class="form-control" rows="5" name="self"></textarea>
		</div>
		<button type="submit" class="btn btn-primary">확인</button>
	</form>
	<h3>DI와 관련된 어노테이션들</h3>
	<ul class="list-unstyled">
		<li><a href="<c:url value="/Annotaiton/Autowired.do"/>">@Autowired</a></li>
		<li><a href="<c:url value="/Annotaiton/Resource.do"/>">@Resource</a></li>
	</ul>	
	<h3>@Lazy(지연로딩을 위한 어노테이션)</h3>
	<a href="<c:url value="/Lazyloading/Lazy.do"/>">@Lazy</a>
	<h3>@Configuration</h3>
	<a href="<c:url value="/Configuration/Configuration.do"/>">@Configuration</a>
	<kbd>${message}</kbd>
	<h3>기타 어노테이션들</h3>
	<h4>@SessionAttribute</h4>
	<%--
	<c:if test="${empty sessionScope.id}" var="isNotLogin">
	--%>
	<c:if test="${empty sessionScope.loginCommand}" var="isNotLogin">
		<h5>로그인 전</h5>
		<form class="form-inline"
			action="<c:url value="/Annotation/SessionAttributeLogin.do"/>"
			method="GET">
			<label>아이디</label> <input type="text" name="id"
				class="form-control mx-2" /> <label>비밀번호</label> <input
				type="password" name="pwd" class="form-control mx-2" /> <input
				type="submit" class="btn btn-danger mx-2" value="로그인" />
		</form>
		<kbd>에러메시지 : ${errorMessage}</kbd>
	</c:if>	
	<hr/>
	<c:if test="${not isNotLogin }">
		<h5>로그인 후</h5>
		<!--@SessionAttribute 사용시 모델계열에 데이타저장하면 두 영역에 동시에 저장됨  -->
		<kbd>세션영역 : ${sessionScope.id}${sessionScope.loginCommand.id}</kbd><br/>
		<kbd>리퀘스트 영역 : ${requestScope.id}${requestScope.loginCommand.id}</kbd><br/>
		<kbd>${sessionScope.id }${sessionScope.loginCommand.id} 님 즐감하세요</kbd>
		<a href="<c:url value="/Annotation/SessionAttributeLogout.do"/>">로그아웃</a>
	</c:if>
	
	<hr/>
	<h5>로그인 여부 판단</h5>
	<a href="<c:url value="/Annotation/SessionAttributeIsLogin.do"/>">로그인여부 판단</a><br/>
	<kbd>서블릿 API(HttpSession 사용시) : ${isLoginMessageAPI}</kbd><br/>
	<kbd>@SessionAttribute 사용시 : ${isLoginMessage}</kbd>
	<h4>@ResponseBody</h4>
	<a href="<c:url value="/Annotation/ResponseBody.do"/>">@ResponseBody</a><br/>
	
	<h4>@RequestBody</h4>
	<h6>서버로 JSON데이타 보내기</h6>
	<a href="javascript:sendData()">JSON데이타</a>
	<h6>서버로 폼데이타 보내기</h6>
	<form class="form-inline" 
		action="<c:url value="/Annotation/RequestBody.do"/>"
		method="POST">
		<label>아이디</label> <input type="text" name="id"
			class="form-control mx-2" /> <label>비밀번호</label> <input
			type="password" name="pwd" class="form-control mx-2" /> <input
			type="submit" class="btn btn-danger mx-2" value="로그인" />
	</form>
	
	<h4>@RequestHeader</h4>
	<a href="<c:url value="/Annotation/RequestHeader.do"/>">@RequestHeader</a><br/>
	<kbd>${referer }</kbd>
	
</div>
<!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>  
  // Add the following code if you want the name of the file appear on select
  $(".custom-file-input").on("change", function() {
    var fileName = $(this).val().split("\\").pop();
    $(this).siblings(".custom-file-label").html(fileName);
  });

  //서버에 json포맷으로 데이타 보내기
  function sendData(){
	  
		//JSON객체 생성
		var data ={"id":"kosmo","pwd":"123456789"};
		//1.jQuery Ajax사용
		//https://api.jquery.com/jquery.ajax/
		/*
		$.ajax({
			url:'<c:url value="/Annotation/RequestBody.do"/>',
			method:"POST",
			data:JSON.stringify(data),//2.stringify(JSON객체)로 문자열처리 
			contentType:"application/json",
			dataType:"json"			
		}).done(function(data){
			console.log(data);
			console.log('아이디:%s,비번:%s',data.id,data.pwd);
		}).fail(function(){console.log('에러발생')});*/
		//2.axios 모듈 사용 - https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js모듈 임베딩 필요
		//https://axios-http.com/kr/docs/intro
		/*
		 axios.post('<c:url value="/Annotation/RequestBody.do"/>', data)
		  .then(function (response) {
		    //console.log(response);
		    console.log(response.data);
		    console.log('아이디:%s,비번:%s',response.data.id,response.data.pwd);
		  })
		  .catch(function (error) {
		    console.log(error);
		  });*/
		  //3. fetch 자바스크립트 함수 사용 - 모듈을 임포트할 필요 없다. 자바스크립트에서 제공하는 함수
		  //https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API
		  fetch('<c:url value="/Annotation/RequestBody.do"/>',{method:'POST',headers: {
			    "Content-Type": "application/json",
		  },body:JSON.stringify(data)})
		  .then(function (response) {
		    console.log(response);
		    return response.json();		   
		  })
		  .then(function(data){
			  console.log(data);
			  console.log('아이디:%s,비번:%s',data.id,data.pwd);
		  })
		  .catch(function (error) {
		    console.log(error);
		  });
		  
  }  
  </script>
