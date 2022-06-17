<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:include page="/WEB-INF/views/template/Top.jsp"  />

<div class="container">    
 	<div class="jumbotron">
	  <h1>어노테이션</h1>	  
	</div>
	<h3>여러 파라미터 받기</h3>
	<div class="form-group">
			<label><kbd class="lead">이름</kbd></label> <input type="text"
				class="form-control" name="name" value="${name}${cmd.name}">
		</div>
		<div class="form-group">
			<label><kbd class="lead">아이디</kbd></label> <input type="text"
				class="form-control" name="id" value="${id}${cmd.id}">
		</div>
		<div class="form-group">
			<label><kbd class="lead">비밀번호</kbd></label> <input type="text"
				class="form-control" name="pwd" value="${pwd}${cmd.pwd}">
		</div>
		
		<div class="form-group">
			<label><kbd class="lead">성별</kbd></label>
			<div class="d-flex">
				<div class="custom-control custom-radio mr-2">
					<input type="radio" class="custom-control-input" name="gender"
						value="man" id="male"
						<c:if test="${gender=='man' or cmd.gender=='man'}">checked</c:if>
						> <label for="male"
						class="custom-control-label">남자</label>
				</div>
				<div class="custom-control custom-radio">
					<input type="radio" class="custom-control-input" name="gender"
						value="woman" id="female"
						<c:if test="${gender=='woman' or cmd.gender=='woman'}">checked</c:if>
						> <label for="female"
						class="custom-control-label">여자</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label><kbd class="lead">관심사항</kbd></label>
			<div class="d-flex">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="inter"
						value="POL" id="POL"
						<c:if test="${fn:contains(fn:toUpperCase(inter),'L') or fn:contains(fn:toUpperCase(cmd.inter),'L')}">checked</c:if>
						> <label class="custom-control-label"
						for="POL">정치</label>
				</div>
				<div class="custom-control custom-checkbox mx-2">
					<input type="checkbox" class="custom-control-input" name="inter"
					    <c:if test="${fn:contains(fn:toUpperCase(inter),'C') or fn:contains(fn:toUpperCase(cmd.inter),'C')}">checked</c:if>
						value="ECO" id="ECO"> <label class="custom-control-label"
						for="ECO">경제</label>
				</div>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" name="inter"
						<c:if test="${fn:contains(fn:toUpperCase(inter),'T') or fn:contains(fn:toUpperCase(cmd.inter),'T')}">checked</c:if>
						value="ENT" id="ENT"> <label class="custom-control-label"
						for="ENT">연예</label>
				</div>
				<div class="custom-control custom-checkbox ml-2">
					<input type="checkbox" class="custom-control-input" name="inter"
						<c:if test="${fn:contains(fn:toUpperCase(inter),'S') or fn:contains(fn:toUpperCase(cmd.inter),'S')}">checked</c:if>
						value="SPO" id="SPO"> <label class="custom-control-label"
						for="SPO">스포츠</label>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label><kbd class="lead">학력사항</kbd></label> <select name="grade"
				class="custom-select mt-3 custom-select-lg">				
				<option value="ELE" <c:if test="${cmd.grade=='ELE' or fn:indexOf(fn:toUpperCase(grade),'E') !=-1}">selected</c:if>>초등학교</option>
				<option value="MID" <c:if test="${cmd.grade=='MID' or fn:indexOf(fn:toUpperCase(grade),'M') !=-1}">selected</c:if>>중학교</option>
				<option value="HIG" <c:if test="${cmd.grade=='HIG' or fn:indexOf(fn:toUpperCase(grade),'H') !=-1}">selected</c:if>>고등학교</option>
				<option value="UNI" <c:if test="${cmd.grade=='UNI' or fn:indexOf(fn:toUpperCase(grade),'U') !=-1}">selected</c:if>>대학교</option>
			</select>
		</div>
		<div class="form-group">
			<label><kbd class="lead">첨부파일</kbd>
				</kbd></label>
			<div class="custom-file">
				<input  type="file" class="custom-file-input" name="file" id="file">
				<label class="custom-file-label" for="file">${file }${cmd.file }</label>
			</div>
		</div>
		<div class="form-group">
			<label><kbd class="lead">자기소개</kbd>
				</kbd></label>
			<textarea class="form-control" rows="5" name="self">${self}${cmd.self}</textarea>
		</div>
</div><!-- container -->

<jsp:include page="/WEB-INF/views/template/Footer.jsp"  />
		