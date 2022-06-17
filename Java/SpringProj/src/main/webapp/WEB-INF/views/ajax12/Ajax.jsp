<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>제이쿼리 AJAX</h1>	  
	</div>
	<!-- 
	    ajax로 서버에 요청시에는 form태그가 의미 없다(
	    왜냐하면 자바스크립트 객체인 XMLHttpRequest가 서버에 요청하기 때문에).
	    단, 전송할 데이타가 많을시에는 form태그 추가시  유리함.
	    -->
	<form id="frm" >
		아이디 <input type="text" name="id" /> 
		비빌번호 <input type="password" name="pwd" />
	</form>
	<ul style="list-style-type: upper-roman;">
		<li><input type="button" id="btnNoAjax" value="회원여부(AJAX미사용)" /></li>
		<!-- 
			   Spring:반환타입을 void로 하거나
			          반환타입을 String으로하고 @ResponseBody어노테이션 사용
			-->
		<li><a href="#" id="btnAjaxText">회원여부(AJAX사용-TEXT로 응답받기)</a></li>
		<li><input type="button" id="btnAjaxJson" value="회원여부(AJAX사용-JSON으로 응답받기)" /></li>

	</ul>

	<hr />
	<span id="lblDisplay"
		style="color: red; font-size: 2em; font-weight: bold">${isLogin}</span>
	<h3>JSON형식(JSON배열타입)</h3>
	<button type="button" id="ajaxArray">목록가져오기</button><br /> 
	<span id="list"></span>
	<h3>Ajax폴링을 이용한 실시간 업데이트 웹 구현</h3>
	<button id="ajaxPolling">실시간 웹 업데이트</button><br/>
	<span id="polling"></span>
	<!-- 
		    문]
		    닷넷과정 선택시  커리큘럼에
		    <option value="d01">C#</option>
		    <option value="d02">ASP.NET</option>
		    <option value="d03">WPF4</option>
		   사물인터넷과정 선택시  커리큘럼에
		    <option value="i01">라즈베리 파이</option>
		    <option value="i02">파이썬</option>
		    이	 보이도록 AJAX로구현하여라, 단, 서버에서 데이타를 JSON타입으로
		    받아라.   
	     -->
	<h3>AJAX 실습하기</h3>
	과정 <select  id="course">
			<option value="java">자바과정</option>
			<option value="dotnet">닷넷과정</option>
			<option value="iot">사물인터넷과정</option>
		</select> 
	커리큘럼 <select  id="curriculum">
			<option value="j01">자바</option>
			<option value="j02">JSP</option>
			<option value="j03">스프링</option>
		</select>
	<h3>Jackson라이브러리 실습</h3>
	<h4>자바객체를 JSON으로 변환</h4>
	<h5>form태그로 요청</h5>
	<!-- key=value로 데이타 보내기 -->
	<form id="ajaxForm" action="<c:url value="/Ajax/form.do"/>"	method="post" enctype="application/x-www-form-urlencoded" >
		제목 <input type="text" name="title" /> 
		이름 <input type="text" name="name" /> <br /> 
		내용<br />
		<textarea rows="10" name="content"></textarea>
		<input type="submit" value="확인" />
	</form>

	<button type="button" id="btnAjaxDataKeyValue">AJAX로 요청(데이타는 KEY=VALUE로 전송)</button>
	<br />
	<button type="button" id="btnAjaxDataJson">AJAX로 요청(데이타는 JSON으로 전송)</button>
	<br />
	<button type="button" id="btnAjaxDataArray">JSON형태의 배열로 받기</button>
	<br />
	<h4>JSON을 자바객체로 변환</h4>
	<button type="button" id="btnJsonToJava">Map혹은 DTO으로 변환</button>
	<br />
	${formRequestResult}
	<h4>Flask RESTFul API서버로 데이터 요청</h4>
	<button type="button" id="btnCrawling">스타벅스서울전체매장</button>
	
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
<script>
	//1]AJAX 미사용
	$('#btnNoAjax').on('click',function(){
		//form태그의 action속성 및 method속성 설정
		$('#frm').prop({action:'<c:url value="/Ajax/NoAjax.do"/>',method:'post'});
		//폼객체의 submit()함수로 서버로 전송
		$('#frm').submit();
		
	});
	/*
	 2]AJAX사용-서버로 부터 응답은 TEXT로 받기 
	 
	   ※POST방식으로 전송시
	   type:"post" 그리고
	   
	   ※GET방식(디폴트)으로 전송시
	   type:"get"로
	   
	   contentType은 디폴트로 "application/x-www-form-urlencoded"
	   즉 key=value쌍으로 전송한다
	   
	   ※전송할 데이타가 여러개인 경우
	   <form>태그로 감싸주고
	   
	   $("form선택자").serialize()함수 사용
	   이름1=값1&이름2=값2&이름3=값3.....쿼리 스트링 형태(key=value쌍)로 반환
	*/
	
	$('#btnAjaxText').on('click',function(e){
		e.preventDefault();
		
		console.log('serialize()함수:',$('#frm').serialize());
		//ajax요청
		$.ajax({
			url:'<c:url value="/Ajax/AjaxText.do"/>',//요청할 서버의 URL주소
			method:'post',//데이타 전송방식(디폴트는 get방식) 
			dataType:'text',//서버로 부터 응답 받을 데이타의 형식 설정
			data:
				//1]쿼리스트링 문자열로 전송-데이타가 적을때
				//'id='+$(':input[name=id]').val()+'&pwd='+$(':input[name=pwd]').val(),
				//2]$("form선택자").serialize()함수 사용-데이타가 많을때
				//$('#frm').serialize(),
				//3]JSON데이타 형식으로 전달-데이타가 적을때
				{id:$(':input[name=id]').val(),pwd:$(':input[name=pwd]').val()},
			
		}).done(function(data){//서버로부터 정상적인 응답(200)을 받았을때 호출되는 콜백함수
			/*여기 콜백함수안에 받은 데이타를 표시해줄 코드 구현]
	     	  서버로부터 정상적으로 응답을 받을때 	자동으로 호출되는 콜백 메소드]
		 	  여기 안에서 서버로 부터 받은 데이타를	원하는 위치에 뿌려주면 된다.
		 	  ※서버로 부터 받은 데이타는 매개변수로 전달됨(data)*/
		 	  console.log('서버로부터 받은 데이타:',data);
		 	  console.log('서버로부터 받은 데이타 타입:',typeof data);
		 	  //서버에서 "Y" 혹은 "N"으로 응답할때
		 	  //$('#lblDisplay').html(data==='Y'?$(':input[name=id]').val()+'님 방가방가':'회원이 아니야');
			  //서버에서 일반 메시지로 응답할때
			  $('#lblDisplay').html(data);
		}).fail(function(error){//서버로부터 비정상적인 응답을 받았을때 호출되는 콜백함수
			console.log('%O',error);
			console.log('에러:',error.responseText);
		});
	});///////////////
	
	//3]AJAX사용-JSON데이타로 응답받기
	$('#btnAjaxJson').click(function(){
		$.ajax({
			"url":"<c:url value="/Ajax/AjaxJson.do"/>",
			data:$('#frm').serialize(),
			dataType:'text',	
			//dataType:'json',			
		}).done(successCallBack).fail(function(req,status,error){
			console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',
				req.status,
				req.responseText,
				error,status
			);			
		});
	});
	//4]AJAX사용 - 서버로 부터 응답은 JSON 배열로 받기  
	$('#ajaxArray').click(function(){
		$.ajax({
			"url":"<c:url value="/Ajax/AjaxJsonArray.do"/>",
			data:"start=1&end=10",
			dataType:'json',			
		}).done(function(data){
			successAjaxArray(data,"list");
		}).fail(function(req,status,error){
			console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',
					req.status,
					req.responseText,
					error,status
				);			
			});
	});
	//5]AJAX폴링 구현하기
	$('#ajaxPolling').one('click',function(){
		//요청을 특정시간 간격으로 서버에 보내자
		window.setInterval(function() {
			//0.5초 간격으로 서버에 ajax요청
				$.ajax({
					"url":"<c:url value="/Ajax/AjaxJsonArray.do"/>",
					data:"start=1&end=10",
					dataType:'json',			
				}).done(function(data){
					successAjaxArray(data,"polling");
				}).fail(function(req,status,error){
					console.log('응답코드:%s,에러메시지:%s,error:%s,status:%s',
							req.status,
							req.responseText,
							error,status
						);			
				});		
			
		},500);
	});
	
	//6]AJAX COURSE 문제
	$('#course').change(function(){
		//ajax로 요청
		$.ajax({
			"url":"<c:url value="/Ajax/AjaxCourse.do"/>",
			data:{course:$(this).val()},
			dataType:'json'
		}).done(function(data){
			console.log('커리큘럼 데이타:',data);
			var option="";
			$.each(data,function(key,value){;
				option+="<option value='"+key+"'>"+value+"</option>"
			});
			$('#curriculum').html(option);
		});
	});
	//7]AJAX로 요청(데이타는 KEY=VALUE로 전송)
	$('#btnAjaxDataKeyValue').click(function(){
		$.ajax({
			"url":"<c:url value="/Ajax/AjaxDataKeyValue.do"/>",
			data:$('#ajaxForm').serialize(),
			method:'post',
			contentType:'application/x-www-form-urlencoded',
			dataType:'json'			
		}).done(function(data){
			console.log(data);
		});
	});
	
	//8]AJAX로 요청(데이타는 JSON으로 전송)
	$('#btnAjaxDataJson').click(function(){
		var json={"title":$('input[name=title]').val(),"name":$('input[name=name]').val(),"content":$('textarea').val()};
		//console.log(json);
		$.ajax({
			"url":"<c:url value="/Ajax/AjaxDataJson.do"/>",
			data:JSON.stringify(json),
			method:'post',
			contentType:'application/json',
			dataType:'json'			
		}).done(function(data){
			console.log(data);
		});
	});
	//9]JSON형태의 배열로 받기
	$('#btnAjaxDataArray').click(function(){
		$.ajax({
			"url":"<c:url value="/Ajax/AjaxDataArray.do"/>",			
			method:'post',			
			dataType:'json'			
		}).done(function(data){
			console.log(data);
		});
	});
	//10]Map혹은 DTO으로 변환
	$('#btnJsonToJava').click(function(){
		$.ajax({
			"url":"<c:url value="/Ajax/JsonToJava.do"/>",			
			method:'post',			
			dataType:'json'			
		}).done(function(data){
			console.log(data);
		});
	});
	
	function successCallBack(data){
		/*
		data는 서버측에서 전송한 데이타(JSON형식)
		data는 dataType:"json"로 지정했기때문에
		JSON데이타 타입(object)임.
		만약 dataType:"text"로 설정하면 data는 string객체 타입임.
		string타입을 JSON타입으로 변환하려면
		JSON.parse(string객체)
		즉 data.키값 으로 value값을 꺼내온다.]
		{isLogin:"메시지"}형태로 서버에서 응답 
		data=JSON.parse(data);//dataType:"text"일때 
		
		※string JSON.stringify(JSON객체 즉 {}):
		 {}타입의 객체를 string*/
		console.log('서버로부터 받은 데이타:%O',data);
		console.log('서버로부터 받은 데이타:%s,타입:%s',data,typeof data);
		//$('#lblDisplay').html(data.isLogin+":아이디-"+data.id+",비번-"+data['pwd']);
		//dataType:'text'로 받을때
		data=JSON.parse(data);
		$('#lblDisplay').html(data.isLogin+":아이디-"+data.id+",비번-"+data['pwd']);
	}//////
	
	function successAjaxArray(data,elementId){
		console.log('서버로부터 받은 데이타:%O',data);
		console.log('서버로부터 받은 데이타:%s,타입:%s',data,typeof data);
		/*JSON배열을 출력할때는 $.each(data,function(index,index에 따른 요소값){}); 
		사용]
		data:서버로부터 전송받은 데이타(JSON배열타입)
		index:JSON배열의 인덱스(0부터 시작)	
		index에 따른 요소값:JSON배열에서 하나씩 꺼내온거를 담은 인자		
	    */
	    var list="";
	    $.each(data,function(index,item){
	    	var date = new Date(item['postDate']);
	    	var postDate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	    	list+="번호:"+item['no']+",제목:"+item['title']+',이름:'+item['name']+',작성일:'+postDate+'<br/>';
	    	
	    });
		$('#'+elementId).html(list);
	};
	
</script>
		