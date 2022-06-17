<%@page import="java.util.Arrays"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	/*
	//서버단에서도 유효성 체크
	private boolean isValidate(JspWriter out,String param,String message){
		if(param==null || param.trim().length()==0){
			try{
				out.println("<script>");
				out.println("alert('"+message+"');");
				out.println("history.back();");
				out.println("</script>");
			}
			catch(IOException e){e.printStackTrace();}
			return false;
		}
		return true;
	}/////////////isValidate
	private boolean isValidate(JspWriter out,String[] param){
		if(param==null){
			try{
				out.println("<script>");
				out.println("alert('관심사항을 선택하세요');");
				out.println("history.back();");
				out.println("</script>");
			}
			catch(IOException e){e.printStackTrace();}
			return false;
		}
		if(param.length < 3){
			try{
				out.println("<script>");
				out.println("alert('관심사항은 3개 이상 선택하세요');");
				out.println("history.back();");
				out.println("</script>");
			}
			catch(IOException e){e.printStackTrace();}
			return false;
		}
		return true;
	}/////////////isValidate
	*/
%>
<%@ include file="/Common/Validate.jsp" %>
<%
	//POST방식일때 한글 처리
	request.setCharacterEncoding("UTF-8");

	if(!"POST".equals(request.getMethod())){
		out.println("<script>");
		out.println("alert('잘못된 접근입니다');");				
		out.println("history.back();");
		out.println("</script>");
		return;//void _jspService()메소드 빠져 나가기	
	}/////////
	
	//파라미터 받기
	String id=request.getParameter("id");
	if(!isValidate(out, id,"아이디를 입력하세요")) return;
	String pwd=request.getParameter("pwd");
	if(!isValidate(out, pwd,"비밀번호를 입력하세요")) return;
	String gender=request.getParameter("gender");
	if(!isValidate(out, gender,"성별을 선택하세요")) return;
	String[] inter=request.getParameterValues("inter");
	if(!isValidate(out,inter,3)) return;
	String grade=request.getParameter("grade");
	if(!isValidate(out, grade,"학력사항을 선택하세요")) return;
	String file=request.getParameter("file");
	if(!isValidate(out, file,"파일을 첨부하세요")) return;
	String self=request.getParameter("self");
	if(!isValidate(out, self,"자기소개를 입력하세요")) return;
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RequestForParameterComplete.jsp</title>
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
			<h1>회원가입 완료</h1>
		</div>
		<!--container-fluid-->
	</div>
	<!--jumbotron-fluid-->
	<div class="container">
		<form action="RequestForParameterComplete.jsp">
			<div class="form-group">
				<label><kbd class="lead">아이디</kbd></label> 
				<input type="text" class="form-control" name="id" placeholder="아이디를 입력하세요" value="<%=id %>">
			</div>
			<div class="form-group">
				<label><kbd class="lead">비밀번호</kbd></label> 
				<input type="text" class="form-control" name="pwd" placeholder="비밀번호를 입력하세요" value="<%=pwd %>">
			</div>			
			<div class="form-group">
				<label><kbd class="lead">성별</kbd></label>
				<div class="d-flex">
					<div class="custom-control custom-radio mr-2">
						<input type="radio" class="custom-control-input" name="gender" value="man" id="male" <%if("MAN".equals(gender.toUpperCase())){ %>checked<%} %>> 
						<label for="male" class="custom-control-label">남자</label>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" class="custom-control-input" name="gender" value="woman" id="female" <%if("WOMAN".equals(gender.toUpperCase())){ %>checked<%} %>> 
						<label for="female"	class="custom-control-label">여자</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label><kbd class="lead">관심사항</kbd></label>
				<div class="d-flex">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" name="inter" value="POL" id="POL" <%if(Arrays.toString(inter).indexOf("POL")!=-1){%>checked<%}%>>
						<label class="custom-control-label" for="POL">정치</label>
					</div>
					<div class="custom-control custom-checkbox mx-2">
						<input type="checkbox" class="custom-control-input" name="inter" value="ECO" id="ECO" <%if(Arrays.toString(inter).indexOf("ECO")!=-1){%>checked<%}%>>
						<label class="custom-control-label" for="ECO">경제</label>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" name="inter" value="ENT" id="ENT" <%if(Arrays.toString(inter).indexOf("ENT")!=-1){%>checked<%}%>>
						<label class="custom-control-label" for="ENT">연예</label>
					</div>
					<div class="custom-control custom-checkbox ml-2">
						<input type="checkbox" class="custom-control-input" name="inter" value="SPO" id="SPO" <%if(Arrays.toString(inter).indexOf("SPO")!=-1){%>checked<%}%>>
						<label class="custom-control-label" for="SPO">스포츠</label>
					</div>
				</div>
			</div>

			<div class="form-group">
				<label><kbd class="lead">학력사항</kbd></label> 
				<select name="grade" class="custom-select mt-3 custom-select-lg">					
					<option value="ELE" <%if(grade.startsWith("E")){ %>selected<%} %>>초등학교</option>
					<option value="MID" <%if(grade.startsWith("M")){ %>selected<%} %>>중학교</option>
					<option value="HIG" <%if(grade.startsWith("H")){ %>selected<%} %>>고등학교</option>
					<option value="UNI" <%if(grade.startsWith("U")){ %>selected<%} %>>대학교</option>
				</select>
			</div>
			<div class="form-group">
				<label><kbd class="lead">첨부파일</kbd></kbd></label>
				<div class="custom-file">
					<input type="file" class="custom-file-input" name="file" id="file"> 
					<label	class="custom-file-label" for="file"><%=file %></label>
				</div>
			</div>
			<div class="form-group">
				<label><kbd class="lead">자기소개</kbd></kbd></label>
				<textarea class="form-control" rows="5" name="self"><%=self %></textarea>
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
</body>
</html>