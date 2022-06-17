<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>BuiltInObjectOfETC.jsp</title>
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
	      <h1>Expression Language</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">EL의 기타 내장 객체들</legend>  
    		<!-- 
			※EL에서는 값을 설정하거나 영역에 속성을 
			  저장(설정)하지는 못한다.
			  단지 저장된 값을 출력만 할 수 있다.
		 	-->
    		 
    		<h4>1. EL의 pageContext내장객체</h4> 
    		<!-- JSP의 pageContext내장객체와 같다.단,
		          자바빈 규칙으로 접근 가능한 메소드만 제공한다.
		    -->	
		    <h6>자바코드로 컨텍스트 루트 얻기</h6>
		    
    		<ul class="list-unstyled">
    			<li>방법1 : request내장객체 - <%=request.getContextPath() %></li>
    			<%
    				String context=((HttpServletRequest)pageContext.getRequest()).getContextPath();
    			%>
    			<li>방법2 : pageContext내장객체 - <%=context %></li>
    		</ul>  
    		<h6>EL로 컨텍스트 루트 얻기</h6>  
    		\${pageContext.request.contextPath}	:
    		${pageContext.request.contextPath}		
    		<h6>자바코드로 세션의 유효시간 얻기</h6>
    		<%=session.getMaxInactiveInterval() %>초<br/>
    		<%=request.getSession().getMaxInactiveInterval() %>초<br/>
    		<%=pageContext.getSession().getMaxInactiveInterval() %>초<br/>
    		<%=((HttpServletRequest)pageContext.getRequest()).getSession().getMaxInactiveInterval() %>초<br/>
    		<h6>EL로 세션의 유효시간 얻기</h6>
    		\${pageContext.session.maxInactiveInterval } : ${pageContext.session.maxInactiveInterval }초<br/>
    		\${pageContext.request.session.maxInactiveInterval } : ${pageContext.request.session.maxInactiveInterval }초
    		<h4>2. EL의 header내장객체</h4> 
    		<h6>자바코드로 요청헤더값 얻기</h6>
    		<%=request.getHeader("user-agent") %>
    		<h6>EL로 요청헤더값 얻기</h6>
    		<!-- 
	    	EL식으로 요청헤더명에 따른 
	   		헤더 값을 출력할때는
	    	header.요청헤더명이나
	    	혹은 header["요청헤더명"]
	                단,키값에 해당하는 요청헤더명에
	               특수 문자가 들어가 있는 경우에는 
	               무조건 []사용
	     	-->
	     	<!-- PropertyNotFoundException:pageContext.request의 header속성이 없다 
	     	     즉 요청헤더를 구할때는 무조건 header내장객체 사용
	     	-->
	     	\${pageContext.request.header["user-agent"]} : \${pageContext.request.header["user-agent"]}<br/>
    		\${header.user-agent} : ${header.user-agent}<br/>
    		\${header['user-agent']} : ${header['user-agent']}
    		<h4>3. EL의 cookie내장객체</h4> 
    		<%
    			//자바코드로 쿠키 설정
    			Cookie cookie = new Cookie("KOSMO","한소인");
    			cookie.setPath(request.getContextPath());
    			response.addCookie(cookie);	    		
    		%>
    		<h6>자바코드로 쿠키 얻기</h6>
    		<%
    			Cookie[] cookies = request.getCookies();
    			if(cookies !=null){
    				for(Cookie cook:cookies){
    					String name= cook.getName();
    					String value= cook.getValue();
    					out.println(name + " : "+value+"<br/>");
    				}
    			}    		
    		%>
    		<h6>EL로 쿠키 얻기</h6>
    		\${pageContext.request.cookies} : ${pageContext.request.cookies}<br/> 
    		<!-- cookie내장객체 미 사용 -->   		
    		<c:forEach items="${pageContext.request.cookies}" var="cook">
    			${cook.name} : ${cook.value} <br/>   		
    		</c:forEach>
    		<!-- 
		 	cookie.쿠키명.value로 쿠키명에 해당하는 쿠키값을 
		 	얻을 수 있다.		 
		    -->
		    <!-- cookie내장객체 사용 -->   		
		    \${cookie.KOSMO.value } : ${cookie.KOSMO.value }<br/>
		    \${cookie['KOSMO'].value } : ${cookie['KOSMO'].value }
		    
    		<h4>4. EL의 initParam내장객체</h4> 
    		<!-- 
		     	컨텍스트 초기화 파라미터를 얻어 올수 있는 내장 객체  
		   	-->
		   	<!-- 
		   [Context초기화 파라미터]
		   -Context초기화 파라미터는 ServletContext의
		    getInitParameter("파라미터명")메소드를 통해서 
		    얻는다.
		   -Context를 구성하는 모든 서블릿에서 공유할 수 있는 변수
		   [Servlet초기화 파라미터]
		   -Servlet초기화 파라미터는 ServletConfig의
		    getInitParameter("파라미터명")메소드를 통해서 얻는다
		   -해당 서블릿에서만 사용할 수 있는 변수		   
		      ※초기화 파라미터는 web.xml에 등록
		   -->
		   <h6>자바코드로 컨텍스트 초기화 파라미터 얻기</h6>
		   <ul class="list-unstyled">
		   	<li>ORACLE-URL : <%=application.getInitParameter("ORACLE-URL") %></li>
		   	<li>ORACLE-DRIVER : <%=application.getInitParameter("ORACLE-DRIVER") %></li>
		   	<li>PAGE-SIZE : <%=application.getInitParameter("PAGE-SIZE") %></li>
		   	<li>BLOCK-PAGE : <%=application.getInitParameter("BLOCK-PAGE") %></li>
		   </ul>
		   <h6>EL로 컨텍스트 초기화 파라미터 얻기</h6>
		   <ul class="list-unstyled">
		   	<li>ORACLE-URL : ${initParam['ORACLE-URL']}</li>
		   	<li>ORACLE-DRIVER : ${initParam['ORACLE-DRIVER']}</li>
		   	<li>PAGE-SIZE : ${initParam['PAGE-SIZE']}</li>
		   	<li>BLOCK-PAGE : ${initParam['BLOCK-PAGE']}</li>
		   </ul>
		   <h4>컬렉션에 저장된 객체를 EL로 출력</h4>
		   <%
		 	//데이타 준비
		   	MemberDTO first= new MemberDTO("KIM","1234","김길동","20");
		    MemberDTO second= new MemberDTO("LEE","1234","이길동","30");
		  	//리스트 계열 컬렉션에 객체 저장
		  	List<MemberDTO> list= Arrays.asList(first,second);
		  	
		  	
		  	
		  	//맵 계열 컬렉션에 객체 저장
		  	Map<String,MemberDTO> map = new HashMap<>();
		  	map.put("first", first);
		  	map.put("second", second); 
		   
		   %>
		   
		   <h4>자바코드로 출력</h4>
		   
		   <h5>리스트 계열 컬렉션</h5>
		   <h6>일반 for문으로 출력</h6>
		   <% for(int i=0; i < list.size();i++){ %>
		   	<%=list.get(i) %><br/>
		   <%} %>
		   <h6>확장 for문으로 출력</h6>
		   <% for(MemberDTO member:list){%>
		   	<%=member %><br/>
		   <%} %>
		   <h5>맵 계열 컬렉션</h5>
		   <%
		   	Set<String> keys= map.keySet();
		   	for(String key:keys){
		   %>
		   	<%=key %> : <%=map.get(key) %><br/>
		   <%} %>
		   <h4>EL로 출력</h4>
		   <c:set var="list" value="<%=list%>"/>
		   <c:set var="map" value="<%=map%>"/>
		   <h5>리스트 계열 컬렉션</h5>
		   <h6>JSTL 미 사용</h6>
		   \${list} : ${list}<br/>
		   <!-- list.get(0)와 같다 -->
		   \${list[0]} : ${list[0]}
		   <ul class="list-unstyled">
		   	<li>이름:${list[0].name},아이디:${list[0].id} ,비번:${list[0].pwd}</li>
		   	<li>${list[1]}</li>
		   	<!-- 출력만 안된다 \${list[100]}는 null이다-->
		   	<li>${list[100]}</li>
		   </ul>
		   <h6>JSTL 사용:즉 저장된 객체를 수를 모름</h6>
		   <ul class="list-unstyled">
		   <c:forEach items="${list}" var="member">
		   	  <li>이름:${member.name},아이디:${member["id"]} ,비번:${member.pwd}</li>	   
		   </c:forEach>
		   </ul>
		   <h5>맵 계열 컬렉션</h5>
		   <h6>JSTL 미 사용</h6>
		  	\${map} : ${map}<br/>
		  	<!-- map.get("first"):와 같다 -->
		  	\${map.first} : ${map.first}
		  	 <ul class="list-unstyled">
		  	 	<li>이름:${map.first.name},아이디:${map["first"]["id"]},비번:${map['first'].pwd }</li>
		  	 	<li>\${map.second} : ${map.second}</li>
		  	 	<li>\${map.third} : ${map.third}</li><!-- \${map.third}는 null이다 -->
		  	 </ul>
		  	<h6>JSTL 사용:즉 키를 모름</h6>
		  	<ul class="list-unstyled">
		  	    <!-- 
		 		JSTL의 forEach사용시
		 		var에 지정한 변수명.value는 밸류값
		 		변수명.key는 키값
				-->
		  		<c:forEach items="${map}" var="item">
		  			키은 ${item.key} 값은 ${item.value}<br/>
		  			이름:${item.value.name},아이디:${item.value.id},비번:${item.value.pwd}<br/>	  			
		  		</c:forEach>		  	
		  	</ul>
		  	<!-- \${}에서 자바객체의 메소드 호출 가능
		  	     단,객체의 값을 변화시키는 메소드는 호출불가(에러)
		  	     호출가능한 메소드는 읽기용류의 메소드들만 가능
		  	 -->
		  	<h4>컬렉션의 읽기용 메소드의 호출</h4>
		  	\${list.isEmpty() } : ${list.isEmpty() }<br/>
		  	\${list.size() } : ${list.size() }<br/>
		  	<% map.clear(); %>
		  	\${map.isEmpty() } : ${map.isEmpty() }<br/>
		  	\${map.size() } : ${map.size() }<br/>
		  	\${list.clear()} : \${list.clear()}<!-- UnsupportedOperationException:읽기용 메소드가 아님으로 -->
		   
    	</fieldset>
  	</div><!-- container -->
</body>
</html>