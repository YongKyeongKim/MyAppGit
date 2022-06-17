<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />
<!-- 
선수 조건:
POM.XML에 spring-jdbC라이브러리 추가하거나
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-jdbc</artifactId>
    <version>${org.springframework-version}</version>
</dependency>
WEB-INF폴더 밑에 lib폴더 생성후 ojdbc6.jar를 넣는다

Hikari 커넥션 풀
https://github.com/brettwooldridge/HikariCP
Java 11+ maven artifact:

<dependency>
   <groupId>com.zaxxer</groupId>
   <artifactId>HikariCP</artifactId>
   <version>5.0.1</version>
</dependency>
 -->
<div class="container">    
 	<div class="jumbotron">
	  <h1>데이타베이스 연결하기</h1>
	  <p>${message}${param.method}</p>	  
	</div>	
	<ul class="list-unstyled">
		<li><a href="<c:url value="/Database/JDBCConnection.do?method=JDBC"/>" >스프링 JDBC API사용</a></li>
		<li><a href="<c:url value="/Database/JNDIConnection.do?method=JNDI"/>" >스프링 JNDI CP(Connection Pool)사용</a></li>
		<li><a href="<c:url value="/Database/HikariConnection.do?method=HIKARI"/>" >Hikari CP(Connection Pool)사용</a></li>
	</ul>
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		