<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DynamicPage.jsp</title>
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
	      <h1>include액션태그 예제</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">페이지를 선택해서 동적으로 삽입하기</legend>
    		<form>
    			<div class="form-group">			
					<select name="pageName" class="custom-select mt-3 custom-select-lg">
						<option value="">페이지를 선택하세요</option>
						<option value="DirectivePage.jsp">DirectivePage.jsp</option>
						<option value="ActiontagPage.jsp">ActiontagPage.jsp</option>					
					</select>
				</div>
    			<input type="submit" value="확인" class="btn btn-info"/>
    		</form>
    		<%
    			String pageName=request.getParameter("pageName");
    			if(pageName !=null && pageName.length()!=0){
    		%>
    		<jsp:include page="<%=pageName %>"/>
    		<%} %>
    		<h2>계절에 따른 페이지 변환</h2>
    		<%
    			String season;
    			Calendar cal = Calendar.getInstance();
    			switch(cal.get(Calendar.MONTH)+1){
	    			case 3:
	    			case 4:
	    			case 5:season="Spring.jsp";break;
	    			case 6:
	    			case 7:
	    			case 8:season="Summer.jsp";break;
	    			case 9:
	    			case 10:
	    			case 11:season="Autumn.jsp";break;
	    			default:season="Winter.jsp";
    			}
    		%>
    		<jsp:include page="<%=season %>"/>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>