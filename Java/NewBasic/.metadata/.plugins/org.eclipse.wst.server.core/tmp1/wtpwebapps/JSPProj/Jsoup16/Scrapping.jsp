<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Scrapping.jsp</title>
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
	<!-- 1. https://jsoup.org/download에서 jsoup-1.15.1.jar다운로드
	     2. 다운로드한 jsoup-1.15.1.jar 파일을 WEB-INF/lib폴더에 추가
	 -->
	<div class="jumbotron jumbotron-fluid bg-warning">
	    <div class="container-fluid">
	      <h1>자바로 웹 스크래핑하기</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">https://jsoup.org</legend>
    		<%
    		Document doc = Jsoup.connect("https://en.wikipedia.org/").get();
    		out.println("<h3>"+doc.title()+"</h3>");
    		Elements newsHeadlines = doc.select("#mp-itn b a");
    		out.println("<ul class='list-unstyled'>");
    		for (Element headline : newsHeadlines) {
    			
    			out.println("<li><a href='"+headline.absUrl("href")+"'>"+headline.attr("title")+"</a></li>");
    		}
    		out.println("</ul>");
    		%>
    		
    	</fieldset>
    	
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">네이버 영화. 랭킹 스크랩하기(조회순)</legend>
    		<%
    			doc=Jsoup.connect("https://movie.naver.com/movie/sdb/rank/rmovie.naver?sel=cnt&date=20220515").get();
    			//System.out.println(doc.html());
    			//영화 제목 스크래핑
    			//CSS Selector
    			//Elements movieTitles= doc.select("#old_content > table > tbody > tr > td.title > div > a");
    			//XPATH
    			Elements movieTitles=doc.selectXpath("//*[@id=\"old_content\"]/table/tbody/tr/td[2]/div/a");
    			out.println("<h3>스크래핑한 영화 제목 수 : "+movieTitles.size()+"</h3>");
    			out.println("<ul class='list-unstyled'>");
    			int rank=1;
    			for(Element movieTitle : movieTitles){
    				//out.println(String.format("<li>%s</li>",movieTitle.attr("title")));
    				out.println(String.format("<li><span class=\"badge badge-danger\">%s</span> <a href='%s'>%s</a></li>",rank++,movieTitle.absUrl("href"),movieTitle.html()));
    			}    			
    			out.println("</ul>");
    		%>
    		
    	</fieldset>	
  	</div><!-- container -->
</body>
</html>