<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>유효성 검증${inter }</h1>	  
	</div>
	<form action="<c:url value="/Validation/Validation.do"/>" method="post">
		<div class="form-group">
			<label><kbd class="lead">이름</kbd></label> <input type="text"
				value="${param.name}"
				class="form-control" name="name" placeholder="이름를 입력하세요">
				<c:if test="${not empty nameError}"><kbd>${nameError }</kbd></c:if>
				<!-- 에러 메시지 표시 <접두어:errors path="커멘드객체명.속성명"/>단
				,커맨드 객체명은 소문자로 시작-->
				<form:errors path="formCommand.name"/> 
		</div>	
		<div class="form-group">
			<label><kbd class="lead">나이</kbd></label> <input type="text"
				value="${param.years}" 
				class="form-control" name="years" placeholder="나이를 입력하세요">
				<c:if test="${not empty yearsError}"><kbd>${yearsError }</kbd></c:if>
				<form:errors path="formCommand.years"/> 
		</div>			
		
		<div class="form-group">
			<label><kbd class="lead">성별</kbd></label>
			<div class="d-flex">
				<div class="custom-control custom-radio mr-2">
					<input type="radio" class="custom-control-input" name="gender"
						<c:if test="${param.gender=='남자'}">checked</c:if>
						value="남자" id="male1"> <label for="male1"
						class="custom-control-label">남자</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" class="custom-control-input" name="gender"
					    <c:if test="${param.gender=='여자'}">checked</c:if>
						value="여자" id="female1"> <label for="female1"
						class="custom-control-label">여자</label>
				</div>
				<c:if test="${not empty genderError}"><kbd>${genderError }</kbd></c:if>
				<form:errors path="formCommand.gender"/> 
			</div>
		</div>
		<div class="form-group">
			<label><kbd class="lead">관심사항</kbd></label>
			<div class="d-flex">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="inter"
					    <c:if test="${fn:contains(fn:join(inter,','),'정')}">checked</c:if>
						value="정치" id="POL1"> <label class="custom-control-label"
						for="POL1">정치</label>
				</div>
				<div class="custom-control custom-checkbox mx-2">
					<input type="checkbox" class="custom-control-input" name="inter"
					    <c:if test="${fn:contains(fn:join(inter,','),'경')}">checked</c:if>
						value="경제" id="ECO1"> <label class="custom-control-label"
						for="ECO1">경제</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="inter"
					<c:if test="${fn:contains(fn:join(inter,','),'연')}">checked</c:if>
						value="연예" id="ENT1"> <label class="custom-control-label"
						for="ENT1">연예</label>
				</div>
				<div class="custom-control custom-checkbox ml-2">
					<input type="checkbox" class="custom-control-input" name="inter"
					<c:if test="${fn:contains(fn:join(inter,','),'스')}">checked</c:if>
						value="스포츠" id="SPO1"> <label class="custom-control-label"
						for="SPO1">스포츠</label>
				</div>
				<c:if test="${not empty interError}"><kbd>${interError }</kbd></c:if>
				<form:errors path="formCommand.inter"/> 
			</div>
		</div>

		<div class="form-group">
			<label><kbd class="lead">학력사항</kbd></label> <select name="grade"
				class="custom-select mt-3 custom-select-lg">
				<option value="" >학력을 선택하세요</option>
				<option value="초등학교" <c:if test="${param.grade=='초등학교'}">selected</c:if>>초등학교</option>
				<option value="중학교" <c:if test="${param.grade=='중학교'}">selected</c:if>>중학교</option>
				<option value="고등학교" <c:if test="${param.grade=='고등학교'}">selected</c:if>>고등학교</option>
				<option value="대학교" <c:if test="${param.grade=='대학교'}">selected</c:if>>대학교</option>
			</select>
			<c:if test="${not empty gradeError}"><kbd>${gradeError }</kbd></c:if>
			<form:errors path="formCommand.grade"/> 
		</div>
		
		<button type="submit" class="btn btn-primary">확인</button>
	</form>
	
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		