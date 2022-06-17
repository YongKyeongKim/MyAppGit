<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 로그인 여부 판단 -->
<jsp:include page="/Common/IsMember.jsp" />

<jsp:include page="/Template/Top.jsp" />

<div class="jumbotron jumbotron-fluid bg-warning">
	<div class="container-fluid">
		<h1>
			게시판 작성<small>글을 등록 하세요</small>
		</h1>
	</div>
	<!--jumbotron-->
</div>
<!--container-->
<div class="container">
	<form method="post" action="WriteOk.jsp">      
      <div class="form-group">
        <label><kbd class="lead">제목</kbd></label>
        <input type="text" class="form-control" placeholder="제목을 입력하세요" name="title">
      </div>
      <div class="form-group">
		<label><kbd class="lead">내용</kbd></label>
		<textarea class="form-control" rows="5" name="content"></textarea>
	  </div>
      <button type="submit" class="btn btn-primary">등록</button>
    </form>	
</div>

<jsp:include page="/Template/Footer.jsp" />

