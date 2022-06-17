<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/Top.jsp" />

<div class="container">
	<div class="jumbotron">
		<h1>마이바티스 동적 SQL</h1>
		<p>${message }</p>
	</div>
	<h3>if 태그</h3>
	<ul class="list-unstyled">
		<li><a href="<c:url value="/Mybatis/If1.do?title=자바"/>">WHERE절
				일부에 사용 첫번째</a></li>
		<li><a
			href="<c:url value="/Mybatis/If2.do?title=자바&name=김길동&content=안드로이드"/>">WHERE절
				일부에 사용 두번째</a></li>
	</ul>
	<h3>choose~when~otherwise 태그</h3>
	<a
		href="<c:url value="/Mybatis/choose.do?title=자바&name=김길동&content=안드로이드"/>">WHERE절
		일부에 사용</a>
	<h3>where 태그</h3>
	<a
		href="<c:url value="/Mybatis/where.do?title=자바&name=김길동&content=안드로이드"/>">where태그로
		where절 구성</a>
	<h3>trim 태그</h3>
	<ul class="list-unstyled">
		<li><a
			href="<c:url value="/Mybatis/trim1.do?title=자바&name=김길동&content=안드로이드"/>">검색문</a></li>
		<li><a
			href="<c:url value="/Mybatis/trim2.do?no=12&title=자바&content=안드로이드"/>">수정문</a></li>
	</ul>
	<!-- update 하고자 하는 칼럼을 동적으로 포함시키기 위해 사용 -->
	<h3>set 태그</h3>
	<a href="<c:url value="/Mybatis/set.do?no=12&title=안녕&content=인사"/>">수정문</a>
	<h3>foreach 태그</h3>
	<a href="<c:url value="/Mybatis/foreach.do"/>">foreach태그</a>
	<h3>이메일 삭제</h3>
	<form method="post" action="<c:url value="/Mybatis/foreachExam.do"/>">
		<div class="form-check">
			<label class="form-check-label">
			<input type="checkbox"	class="form-check-input" value="1" name="email">메일 1
			</label>
		</div>
		<div class="form-check">
			<label class="form-check-label">
			<input type="checkbox"	class="form-check-input" value="3" name="email">메일 3
			</label>
		</div>
		<div class="form-check">
			<label class="form-check-label">
			<input type="checkbox"	class="form-check-input" value="4" name="email">메일 4
			</label>
		</div>
		<div class="form-check">
			<label class="form-check-label">
			<input type="checkbox"	class="form-check-input" value="5" name="email">메일 5
			</label>
		</div>
		<div class="form-check">
			<label class="form-check-label">
			<input type="checkbox"	class="form-check-input" value="6" name="email">메일 6
			</label>
		</div>
		<div class="form-check">
			<label class="form-check-label">
			<input type="checkbox"	class="form-check-input" value="8" name="email">메일 8
			</label>
		</div>
		<div class="form-check">
			<label class="form-check-label">
			<input type="checkbox"	class="form-check-input" value="11" name="email">메일 11
			</label>
		</div>
		<div class="form-check">
			<label class="form-check-label">
			<input type="checkbox"	class="form-check-input" value="12" name="email">메일 12
			</label>
		</div>
		
		<input type="submit" value="삭제" class="btn btn-danger"/>

	</form>
</div>
<!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp" />
