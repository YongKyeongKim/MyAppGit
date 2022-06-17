<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
	private String getFileExtenstion(String filename){
		return filename.substring(filename.lastIndexOf(".")+1);
	}//////////

%>
<%
	//1]한글처리	
	request.setCharacterEncoding("UTF-8");
	/*
	2]파일 업로드를 위한 MultipartRequest객체 생성
	 ※MultipartRequest객체 생성만으로 파일 업로드가 이루어짐
	
	MultipartRequest(
	 javax.servlet.http.HttpServletRequest request,
	 java.lang.String saveDirectory,
	 int maxPostSize,
	 java.lang.String encoding,
	 FileRenamePolicy policy) 
	 
	 ※MultipartRequest 객체 생성시,최대 업로드 용량 초과시에는 예외 발생
	  파일을 업로드 하지 않은 경우 MultipartRequest객체는 정상적으로 생성되나
	  mr.getFile("파라미터명")이 null이다
	*/
	//3]MultipartRequest생성자의 인자 설정
    //3-1]업로드할 서버의 물리적 디렉토리 설정
	String saveDirectory=application.getRealPath("/Upload");
	//3-2]업로드 최대 파일 용량 설정(바이트 단위)
	//파일을 여러개 업로드시에는 각각의 용량을 합친 크기가 최대 용량이다.
	int maxPostSize = 1024 * 500;//500KB
	//3-3]인코딩 타입 설정
	String encoding="UTF-8";
	//3-4]파일명이 중복된 경우 파일명을 재정의하도록
    //    FileRenamePolicy객체 얻기(인덱스가 자동으로 부여됨)
	FileRenamePolicy policy=new DefaultFileRenamePolicy();
	
	//4]MultipartRequest객체 생성
	MultipartRequest mr =null;
	String name=null;
	String title=null;
	String inter=null;
	File file1=null,file2=null;
	try{
		mr=new MultipartRequest(request,saveDirectory,maxPostSize,encoding,policy);
		//5]기타 폼의 하위 요소(파라 미터) 받기 MultipartRequest객체로 받는다.
		name=mr.getParameter("name");
		title=mr.getParameter("title");
		inter = Arrays.toString(mr.getParameterValues("inter"));
		file1 = mr.getFile("attachFile1");
		file2 = mr.getFile("attachFile2");
	}
	catch(IOException e){//파일 용량 초과 에러
		//에러내용을 리퀘스트  영역에 저장
		request.setAttribute("maxUploadError", "최대 파일용량(500KB)를 초과 했어요");
		request.getRequestDispatcher("Upload.jsp").forward(request, response);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>UploadComplete.jsp</title>
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
	      <h1>파일 업로드/다운로드</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">파일 업로드 결과</legend>
    		<a href="UploadList.jsp" class="btn btn-success">파일목록</a>
    		<h3>type="file" 요소를 제외한 폼 요소드</h3>
    		<ul class="list-unstyled">
    			<li>올린이 :<%=name %> </li>
    			<li>제목 : <%=title %></li>
    			<li>관심사항 : <%=inter %></li>    		
    		</ul>
    		<h3>업로드한 파일 정보</h3>
    		<kbd class="lead">첫번째 파일</kbd>
    		<ul class="list-unstyled">
    			<li>원본 파일명 : <%=mr.getOriginalFileName("attachFile1") %></li>
    			<li>실제 파일시스템에 저장된 파일명 : <%=mr.getFilesystemName("attachFile1") %></li>
    			<li>컨텐츠 타입 : <%=mr.getContentType("attachFile1") %></li>   
    			<li>파일 크기 : <%=(int)Math.ceil(file1.length()/1024.0) %>KB</li> 
    			<!-- 이미지 파일인경우 img태그로 표시 -->
    			<%
    				String filename=file1.getName();
    				String ext=getFileExtenstion(filename);
    				if(ext.equalsIgnoreCase("JPG") || ext.equalsIgnoreCase("PNG")){
    			%>
    			<li><img src="<c:url value="/Upload/"/><%=filename %>" alt="이미지" style="width:200px;height:200px"/></li> 	
    			<%} %>	
    		</ul>
    		<kbd class="lead">두번째 파일</kbd>
    		<ul class="list-unstyled">
    			<li>원본 파일명 : <%=mr.getOriginalFileName("attachFile2") %></li>
    			<li>실제 파일시스템에 저장된 파일명 : <%=mr.getFilesystemName("attachFile2") %></li>
    			<li>컨텐츠 타입 : <%=mr.getContentType("attachFile2") %></li>   
    			<li>파일 크기 : <%=(int)Math.ceil(file2.length()/1024.0) %>KB</li> 
    			<!-- 이미지 파일인경우 img태그로 표시 -->
    			<%
    				filename=file2.getName();
    				ext=getFileExtenstion(filename);
    				if(ext.equalsIgnoreCase("JPG") || ext.equalsIgnoreCase("PNG")){
    			%>
    			<li><img src="<c:url value="/Upload/"/><%=filename %>" alt="이미지" style="width:200px;height:200px"/></li> 	
    			<%} %>	
    		</ul>
    		
    	</fieldset>
  	</div><!-- container -->
</body>
</html>