<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	/*
	-application영역에 저장된 속성은 모든 JSP페이지(서블릿)에서 공유한다.
	-링크로 페이지 이동하든 리다이렉트나 포워드로 자동 이동하든 모든 JSP페이지는
	 하나의 application영역안에 있기때문에.....
	*/
	//[어플리케이션 영역에 속성 저장]
	//저장할 객체 생성
	MemberDTO first = new MemberDTO("KIM","1234","가길동","20");
	MemberDTO second = new MemberDTO("LEE","5678","이길동","10");
	MemberDTO third = new MemberDTO("PARK","9999","박길동","30");
	//리스트 계열 컬렉션에 객체 저장
	List<MemberDTO> list = Arrays.asList(first,second,third);
	//맵계열 컬렉션에 객체 저장
	Map<String,MemberDTO> map = new HashMap();
	map.put("first",first);
	map.put("second",second);
	map.put("third",third);
	//application영역에 컬렉션들 저장
	application.setAttribute("list", list);
	application.setAttribute("map", map);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ApplicationScopeIndex.jsp</title>
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
	      <h1>application영역</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<h2>사용자 클릭으로 페이지 이동</h2>
    	<a href="ApplicationScopeResult.jsp">클릭하세요</a>
    	<h2>포워드로 페이지 자동 이동</h2>
    	<%
    	/*절대 경로로 지정시]			
		 ※ 포워드방식:컨텍스트 루트 제외
		   리다이렉트 방식:컨텍스트 루트 반드시 포함
		   단,server.xml에서 Context태그의 path속성을 빈문자열로
		   지정시에는 신경 안써도 된다.
		*/
		//request.getRequestDispatcher("/BuiltInObjectScope04/ApplicationScopeResult.jsp").forward(request, response);
    	
    	%>
    	<h2>리다이렉트로 페이지 자동 이동</h2>
    	<%
    		response.sendRedirect(request.getContextPath()+"/BuiltInObjectScope04/ApplicationScopeResult.jsp");
    	%>
  	</div><!-- container -->
</body>
</html>