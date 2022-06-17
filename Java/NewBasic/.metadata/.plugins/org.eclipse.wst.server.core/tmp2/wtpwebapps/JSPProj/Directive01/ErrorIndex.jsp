<%@ page language="java" contentType="text/html; charset=UTF-8"  
		 pageEncoding="UTF-8"
		 errorPage="ErrorInfo.jsp"
		 %>
<%
	//사용자가 입력한 값 받기]		
	String stringAge=request.getParameter("age");
	//out.println("stringAge:"+stringAge);
	
	int after10Years=-1;
	String errorMessage="";
	if(stringAge !=null){
		//방법1]try~ catch로 직접 에러처리
		/*
		try{
			after10Years=Integer.parseInt(stringAge)+10;
		}
		catch(NumberFormatException e){
			errorMessage="나이는 숫자만...";
		}*/
		//방법2]page지시어의 errorPage속성 사용:try~catch 불필요
		after10Years=Integer.parseInt(stringAge)+10;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ErrorIndex.jsp</title>
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
</style>
</head>
<body>
	<div class="jumbotron jumbotron-fluid bg-warning">
	    <div class="container-fluid">
	      <h1>errorPage 및 isErrorPage속성</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
			<legend class="w-auto px-3">에러가 발생할 페이지</legend>
			<form>
				<div class="form-group">
					<label for="age">나이를 입력하세요?</label>
					<input class="form-control" type="text" name="age" id="age"/>
				</div>
				<input class="btn btn-success" type="submit" value="확인"/>
			</form>
			<% if(after10Years !=-1){ %>		
				당신의 10년후 나이는 <%=after10Years %>살 이군요.
			<%} %>
			
			<% if(errorMessage.length()!=0){ %>
			<div class="alert alert-success mt-2">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
  				<strong>Not Number!</strong> <%=errorMessage %>.
			</div>
			<%} %>
			
		</fieldset>
  	</div><!-- container -->
</body>
</html>