<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytag.tld" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ForEachExtend.jsp</title>
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
	      <h1>JSTL(JSP Standard Tag Library)</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">forEach 태그-확장 for문 형태</legend>
    		<!-- 
			 필수 속성 : items 및 var
			 -배열이나 컬렉션에서 값을 꺼내올때 사용	
			-varStatus에 지정한 LoopStatusTag객체의
			 index속성은 항상 0부터 시작	
		 	-->
		 	<%	String[] colors = {"red","green","blue","#9944a5"};	%>
    		<h3>자바코드로 배열 출력</h3>
    		<% for(String color:colors){ %>
    			<h4 style="color:<%=color%>">Java Server Page</h4>
    		<%} %>
    		<h3>EL 및 JSTL로 배열 출력</h3>
    		<c:set var="colors" value="<%=colors%>"/>
    		
    		<c:forEach var="color" items="${colors }">
    			<h4 style="color:${color}">Java Server Page</h4>	
    		</c:forEach>
    		<h3>varStatus 속성</h3>    		
     		<c:forEach var="color" items="${colors }" varStatus="loop">
     			<h5>${loop.count}번째 반복</h5>
     			<ul class="list-unstyled">
     				<li>\${loop.index } : ${loop.index }</li>
    				<li>\${loop.first } : ${loop.first }</li>
    				<li>\${loop.last } : ${loop.last }</li>
    				<li>\${loop.current } : ${loop.current }</li>
    		
    			</ul>
     		</c:forEach>
    		<h3>리스트 계열 컬렉션</h3>
    		<%
    			//데이타 준비]
    			List list= Arrays.asList(
    					new MemberDTO("KIM","1234","김길동","20"),
    					new MemberDTO("LEE","1234","이길동","30"),
    					new MemberDTO("PARK","1234","박길동","15")
    					);	
    		
    		%>
    		<c:set var="list" value="<%=list %>"/>
    		<h4>일반 for문 형태의 forEach태그로 출력</h4>
    		<c:forEach begin="0" end="${list.size()-1}" var="i">
    			아이디:${list[i].id },비번:${list[i].pwd }, 이름:${list[i].name}<br/>    		
    		</c:forEach>
    		<h4>확장 for문 형태의 forEach태그로 출력</h4>
    		<c:forEach var="item" items="${list}">
    			아이디:${item.id },비번:${item.pwd }, 이름:${item.name}<br/>    	    		
    		</c:forEach>
    		<h3>맵 계열 컬렉션</h3>
    		<%
    			//데이타 준비]
    			Map map = new HashMap();
    			map.put("first",list.get(0));
    			map.put("second",list.get(1));
    			map.put("third",list.get(2));
    		
    		%>
    		<c:set var="map" value="<%=map %>"/>
    		<h4>키값을 알때 :  el변수.키값 혹은 el변수['키값']</h4>   		
    		<ul class="list-unstyled">
    			<li>아이디:${map.first.id},비번:${map.first.pwd},이름:${map.first.name}</li>
    			<li>아이디:${map["second"].id},비번:${map["second"].pwd},이름:${map["second"].name}</li>
    			<li>아이디:${map["third"]["id"]},비번:${map["third"]["pwd"]},이름:${map["third"]["name"]}</li>
    		
    		</ul>
    		<h4>키값을 모를때 </h4>  
    		<!-- 
		      KEY값 얻기 : var속성에 지정한 \${el변수.key}
		      VALUE값 얻기: var속성에 지정한 \${el변수.value}
		    -->
		    <ul class="list-unstyled">
		    	<c:forEach var="item" items="${map }">
		    	<li>키값:${item.key},아이디:${item.value.id},비번:${item.value.pwd}, 이름:${item.value.name}</li>
		    	</c:forEach>
		    </ul>
		    <!-- 
		  	회원제 게시판(bbs테이블)에 저장된 글을 읽어와서
		 	목록으로 출력하여라(위에서 10개만:start=1,end=10).
		  	태그 라이브러에 목록을 반환하는 메소드를
		  	정의하여 그 메소드를 EL에서 사용하도록 하여라  
		  	단,EL과 JSTL만 사용하여라. 
		  --> 
		  <table class="table table-dark table-hover text-center">
	
		<thead>
			<tr>
				<th class="col-1">번호</th>
				<th>제목</th>
				<th class="col-2">작성자</th>
				<th class="col-1">조회수</th>
				<th class="col-2">작성일</th>
			</tr>
		</thead>
		<tbody class="table-sm">
			<c:forEach var="item" items="${my:selectList(pageContext.servletContext,1,10) }">
				<tr>
					<td>${item.no}</td>				
					<td class="text-left">${item.title}</td>
					<td>${item.name}</td>	
					<td>${item.hitCount}</td>	
					<td>${item.postDate}</td>	
				</tr>
			</c:forEach>
					
		</tbody>
		
		</table>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>