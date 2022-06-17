<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.stream.Stream"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!

	private String codeToValue(String code){
		switch(code.toUpperCase()){
			case "POL":return "정치";
			case "ECO":return "경제";
			case "SPO":return "스포츠";
			default:return "연예";
		}/////switch
	}/////////////codeToValue
%>
<%

	/*
	※getParameter계열 메소드가 null을 반환하거나 빈 문자열을 반환 하는 경우]
	
	1]parameter를 전달하지 않거나 파라미터명이 틀린 경우 null반환
	2]Text박스 계열인 경우 값을 입력 안하고 전송한 경우 - 빈 문자열("") 반환
	3]선택 계열인 radio박스나 checkbox등인 경우 미 선택시에는 null반환(왜냐하면 파라미터가 전달이 안되니까)
	
	※name이 같은 form의 하위요소의 값을 받을때는 getParameterValues()
	 단, type="radio"처럼 하나의 이름으로 하나의 값을 전달할때는 getParameter()로 받아도 된다.
	*/
	//파라미터 받기
	String name=request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] inter=request.getParameterValues("inter");
	
	String values="";
	if(name != null && 
	   name.trim().length() !=0 && 
	   gender !=null && inter !=null){
		
		values =String.format("이름:%s,성별:%s,관심사항:",name,gender);
		for(String code:inter) values+=codeToValue(code) + " ";
		
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>RequestForParameter.jsp</title>
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
			<h1>서버로 전송한 파라미터</h1>
		</div>
		<!--container-fluid-->
	</div>
	<!--jumbotron-fluid-->
	<div class="container">
		<h1 class="display-4">
			<code>form</code>
			태그를 이용한 값 전송
		</h1>
		<form>
			<div class="form-group">
				<label class="lead font-weight-bold">이름</label> 
				<input type="text" class="form-control"	name="name">
			</div>
			<div class="form-group">
				<label class="lead font-weight-bold">성별</label>
				<div class="form-check">
					<label class="form-check-label"> <input type="radio"
						class="form-check-input" name="gender" value="남자">남자
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> <input type="radio"
						class="form-check-input" name="gender" value="여자">여자
					</label>
				</div>
			</div>
			
			<div class="form-group">
				<label class="lead font-weight-bold">관심사항</label>
				<div class="form-check">
					<label class="form-check-label"> 
					<input type="checkbox"	class="form-check-input" name="inter" value="POL">정치
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> 
					<input type="checkbox"	class="form-check-input" name="inter" value="ECO">경제
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> 
					<input type="checkbox"	class="form-check-input" name="inter" value="ENT">연예
					</label>
				</div>
				<div class="form-check">
					<label class="form-check-label"> 
					<input type="checkbox"	class="form-check-input" name="inter" value="SPO">스포츠
					</label>
				</div>
			</div>			
			
			<button type="submit" class="btn btn-primary">확인</button>
		</form>
		<%=values %>
		<h1 class="display-4">
			<code>a</code> 태그를 이용한 값 전송			
		</h1>
		<a href="RequestForParameter.jsp?name=코스모&gender=남&inter=spo&inter=eco">GET</a>
		<h1 class="display-4">모든 파라미터 얻기</h1>
		<!--
			-request객체의 getParameterNames()메소드로 얻는다
			-파라미터명 존재 여부판단-->
		<ul class="list-unstyled">
			<%
				Enumeration<String> names= request.getParameterNames();
				while(names.hasMoreElements()){
					//파라미터명 얻기
					String paramName = names.nextElement();
					//파라미터값 얻기
					if(paramName.equals("inter")){
						String[] paramValues=request.getParameterValues(paramName);
						//코드로 출력
						//out.println("<li>"+String.format("%s : %s",paramName,Arrays.toString(paramValues))+"</li>");
						//코드를 변환해서 출력
						
						//방법1]
						//String vals="";
						//for(String code:paramValues) vals+=codeToValue(code)+" ";
						//out.println("<li>"+String.format("%s : %s",paramName,vals)+"</li>");						
						//방법2]스트림 사용해서 배열의 요소값들을 변환
						Stream<String> streams=Arrays.stream(paramValues);						
						out.println("<li>"+String.format("%s : %s",paramName,Arrays.toString(streams.map(x->codeToValue(x)).toArray()))+"</li>");
					}
					else{
						String paramValue=request.getParameter(paramName);
						out.println("<li>"+String.format("%s : %s",paramName,paramValue)+"</li>");
					}
				}
			
			%>		
		</ul>
		<h1 class="display-4">맵으로 모든 파라미터 얻기</h1>
		<ul class="list-unstyled">
			<%
				/*
				getParameterMap():많은 파라미터가 있을때 한꺼번에 받을때 유리
				key는 파라미터명이 되고 value는 사용자가 입력하거나 선택한 값이 된다
				*/
				Map<String,String[]> params=request.getParameterMap();
				//파라미터명 얻기
				Set<String> paramNames= params.keySet();
				for(String paramName:paramNames){
					String[] vals=params.get(paramName);
					if(vals.length !=1){
						
					%>
					<li><%=paramName%> : <%=Arrays.toString(vals) %></li>
					<%
					}
					else{%>
					<li><%=paramName%> : <%=vals[0]%></li>	
					<%	
					}
				%>
				
				<%	
				}			
			
			%>
			
		</ul>
		
	</div>
	<!-- container -->
</body>
</html>