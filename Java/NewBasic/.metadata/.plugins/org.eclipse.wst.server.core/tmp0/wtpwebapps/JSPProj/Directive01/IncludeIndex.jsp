<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>IncludeIndex.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- CDN -->
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    /*점보트론 세로폭 줄이기*/
    .jumbotron {
      padding-top: 1rem;
      padding-bottom: 1rem;
    }
   /*
    <body> 의 상단에 padding 을 주지 않으면, 네비게이션 바는 다른 콘텐츠를 
    덮어버립니다. 당신만의 값을 시도해 보거나 하단의 값을 이용하세요. 
    팁: 기본적으로, 네비게이션 바는 50px 보다 큽니다.
    */   
   
    body { padding-top: 65px; }
   
  </style>
</head>
<body>

<!-- 상단 고정-->
<nav class="navbar navbar-expand-sm bg-secondary navbar-dark fixed-top">
  
  <a class="navbar-brand" href="#">
    <i class="material-icons" style="font-size:2rem">home</i>
  </a>

    
     <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-link">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse justify-content-end" id="navbar-link">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="#">Link 1</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link 2</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link 3</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
          Link4
        </a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="#">Link 1</a>
          <a class="dropdown-item" href="#">Link 2</a>
          <a class="dropdown-item" href="#">Link 3</a>
        </div>
      </li>
      <li class="nav-item">
        <form class="form-inline" action="#">
          <input class="form-control mr-sm-2 mt-1" type="text" placeholder="검색어 입력">
          <button class="btn btn-success mt-1" type="submit">확인</button>
          
        </form>
      </li>
    </ul>
  </div>
</nav>

  <div class="jumbotron jumbotron-fluid bg-warning">
    <div class="container-fluid">
      <h2>include지시어</h2>    
    </div><!--jumbotron-->  
  </div><!--container-->
  <%@ include file="IncludePage.jsp" %>
  <div class="container">
  	<h2>오늘은 <%=getDate("yyyy-MM-dd")%>일 입니다.</h2>
  	현재 페이지명은 <%=currentPageName%> 입니다.
  </div>

</body>
</html>