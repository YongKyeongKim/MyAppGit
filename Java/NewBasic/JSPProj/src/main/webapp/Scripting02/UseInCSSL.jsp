<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//사용자 선택값 받기
	String color=request.getParameter("color");
	String font=request.getParameter("font");
	//out.println(String.format("색상:%s,글꼴:%s",color,font));
	if(color ==null || color.length()==0 ) color="black";
	if(font ==null || font.equals("")) font="Helvetica Neue";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>UseInCSSL.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
  /*점보트론 세로폭 줄이기*/
  .jumbotron {
    padding-top: 1rem;
    padding-bottom: 1rem;
  }
  span{
  	color:<%=color%>;
  	font-family:<%=font%>;
  
  }
</style>
</head>
<body>
	<div class="jumbotron jumbotron-fluid bg-warning">
	    <div class="container-fluid">
	      <h1>스크립팅 요소를 CSSL안에서 사용하기</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">HTML안에서 사용하기</legend>
    		<% for(int i=1;i<=6;i++){ %>
    			<h<%=i %>>h<%=i %> Bootstrap heading</h1>
    		<%} %>
    		<form>
    			<input type="text" class="form-control mb-3" name="counter"/>
    			<input type="submit" class="btn btn-danger" value="이미지 카우터"/>
    		</form>
    		<%
    			String counter=request.getParameter("counter");
    			if(counter !=null){
    				char[] ch=counter.toCharArray();
    				for(char num : ch){
    		%>
    			<img src="<%=request.getContextPath() %>/images/num_<%=num %>.gif" alt="<%=num %>번 이미지"/>
    		<% 
    				}//for
    			}//if %>
    		
    	</fieldset>
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">CSS안에서 사용하기</legend>
    		<span class="lead">CSS를 적용한 텍스트</span>
			<form method="post">
				<label>글자색</label>
				<select name="color" class="form-control">
					<option value="">색상 선태요망</option>
					<option value="Red">빨강</option>
					<option value="Green">그린</option>
					<option value="Blue">블루</option>
				</select> 
				<label>글꼴</label> 
				<select name="font" class="form-control">
					<option value="">글꼴 선태요망</option>
					<option value="굴림체">굴림체</option>
					<option value="바탕체">바탕체</option>
					<option value="휴먼옛체">휴먼옛체</option>
				</select> 
				<input class="btn btn-info mt-2" type="submit" value="글꼴 및 색상 변경" />
			</form>
    	</fieldset>
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">자바스크립트안에서 사용하기</legend>
    		<form class="form-inline">
			<label>아이디</label> <input class="form-control mx-2 mt-2" type="text" name="id" /> 
			<label>비밀번호</label> <input class="form-control mx-2 mt-2" type="password" name="pwd" /> 
			<input class="btn btn-info ml-2 mt-2" type="submit" value="로그인" />
		</form>
    	</fieldset>
    	<%
    		//사용자 입력값 받기
    		String id=request.getParameter("id");
    		String pwd=request.getParameter("pwd");
    	%>
    	<script>
    		//파라미터 미 전달시 true
    		//파라미터 전달시 is not defined 에러
    		//console.log(<%=id%>==null);
    		//아래는 파라미터를 전달하든 안하든 에러는 안나지만 항상 false
    		//console.log("<%=id%>"==null);
    		//반드시 아래처럼 자스에서는 null체크 해야 한다
    		console.log("<%=id%>"=="null");
    		//방법1]자스로 null비교
    		/*
    		if("<%=id%>"!="null"){
    			if("<%=id%>"==="KIM" && "1234" ==="<%=pwd%>"){
    					alert("<%=id%>님 즐감하세요");
    			}
    			else{
    				alert('회원가입후 이용하세요');
    			}
    		}
    		*/
    		//방법2]스크립팅 요소안에서 자바로  null비교
    		<%
    			if(id !=null){
    				if("KIM".equals(id) && "1234".equals(pwd)){	
    					out.println("alert('"+id+"님 즐감....');");
    				}
    				else{
    					out.println("alert(\"가입후 이용바람...\");");
    				}
    			}
    		
    		%>    		
    	</script>
  	</div><!-- container -->
</body>
</html>