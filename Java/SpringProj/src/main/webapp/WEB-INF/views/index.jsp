<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
1. HTML태그에 URL패턴을 생성(A태그 혹은 FORM의 ACTION속성)
2. 컨트롤러 생성
 -->
<jsp:include page="/WEB-INF/views/template/Top.jsp"  />
<link rel="stylesheet" href="<c:url value="/styles/style.css"/>"/>
<div class="container">    
 	<fieldset class="form-group border p-3">
 		<legend class="w-auto p-3">스프링 프레임 워크</legend>
 		<p>현재 시간 :${ requestScope.serverTime }</p>
 		<h2>1. static resource(정적자원) 표시방법 <small>이미지,동영상,.css,.js파일등</small></h2>
 		<h4>servlet-context.xml파일에 설정된 resource태그 사용</h4>
 		<img class="img-thumbnail" src="<c:url value="/resources/images/sumnail.png"/>" alt="mapping=/resources/**"/>
 		<h4>servlet-context.xml파일에 설정된 resource태그 사용-mapping속성값 static으로 변경</h4>
 		<img class="img-thumbnail" src="<c:url value="/static/images/sumnail.png"/>" alt="mapping=/static/**"/>
 		<h4>servlet-context.xml파일에 설정된 resource태그 사용-임의로 변경</h4>
 		<img class="img-thumbnail" src="<c:url value="/images/sumnail.png"/>" alt="mapping=/images/**"/>
 	
 		<h2>2. DispatcherServlet <small><a href="<c:url value="/dispatcher.kosmo"/>">디스패처서블릿</a>${dispatcher}</small></h2>
 		<h2>3. HandlerMapping <small><a href="<c:url value="/handlerMapping.do"/>">핸들러 매핑</a></small></h2>
 		<h2>4. Controller <small><a href="<c:url value="/controller.do"/>">컨트롤러</a></small></h2>
 		<h2>5. ViewResolver <small><a href="<c:url value="/viewResolver.do"/>">뷰리졸버</a></small></h2>
 		<h2>6. Controller Method <small><a href="<c:url value="/returntype.do"/>">반환타입</a></small></h2>
 		<h2>7. Dependency Injection <small><a href="<c:url value="/injection.do"/>">의존성 주입</a></small></h2>
 		<h2>8. Annotation <small><a href="<c:url value="/annotation.do"/>">어노테이션</a></small></h2>
 		<h2>9. Database <small><a href="<c:url value="/database.do"/>">데이타베이스 연동</a></small></h2>
 		<h2>10. Resource <small><a href="<c:url value="/resource.do"/>">자원(리소스파일:키=값의 쌍의 문자열 데이타)</a></small></h2>
 		<h2>11. Validation <small><a href="<c:url value="/validation.do"/>">유효성 검증</a></small></h2>
 		<h2>12. MyBatis Dynamic SQL <small><a href="<c:url value="/dynamicsql.do"/>">마이바티스 동적  SQL</a></small></h2>
 		<h2>13. jQuery AJAX <small><a href="<c:url value="/ajax.do"/>">제이쿼리 에이작스</a></small></h2>
 		<h2>14. Exception <small><a href="<c:url value="/exception.do"/>">예외처리</a></small></h2>
 		<h2>15. File Upload/Download <small><a href="<c:url value="/fileupdown.do"/>">파일 업로드/다운로드</a></small></h2>
 		<h2>16. AOP(Aspect Oriented Programming) <small><a href="<c:url value="/aop.do"/>">관점지향프로그래밍</a></small></h2>
 		<h2>17. WebSocket <small><a href="<c:url value="/websocket.do"/>">웹소켓</a></small></h2>
 		<h2>17. Spring Tiles <small><a href="<c:url value="/tiles.do"/>">타일즈</a></small></h2>
 	</fieldset>
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
 		