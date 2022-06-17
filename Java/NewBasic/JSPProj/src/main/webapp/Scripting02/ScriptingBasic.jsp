<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	//[선언부(Declaration)]
	/*
	선언부에 작성한 자바코드는 서블릿으로 변환시	Class안에 생성됨.
	즉 멤버 변수 나 멤버 메소드 혹은 상수등을 선언부에서 선언함.
	*/
	//[멤버 상수]
	public static final int INT_MAX = Integer.MAX_VALUE;
    //[멤버 변수]
    private String mVariable="<h3>선언부에서 선언한 변수</h3>";
  	//[멤버 메소드]
	private int getMaxNumber(int num1,int num2){
  		
  		return num1 > num2 ? num1 : num2;
  	}/////////////getMaxNumber
	//[선언부에서 내장객체 사용하는 방법]
	//방법1]
	//멤버변수 선언]
	private JspWriter out;
	private void showMessage(String message){
		try{
			out.println(message);
		}
		catch(IOException e){e.printStackTrace();}
	}//////////////////
	//방법2]매개변수로 전달 받는다.
	private void showMessage(String message,JspWriter out){
		try{
			out.println(message);
		}
		catch(IOException e){e.printStackTrace();}		
	}///////////////

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ScriptingBasic.jsp</title>
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
	      <h1>스크립팅 요소 기초</h1>      
	    </div><!--container-fluid-->
  	</div><!--jumbotron-fluid--> 
  	<div class="container">    
    	<fieldset class="form-group border p-3">
    		<legend class="w-auto p-3">스크립팅 요소</legend>
    		<%
	    		//[스크립틀릿(Scriptlet)]
				/*
		  		스크립틀릿안에 작성한 자바코드는 서블릿으로 변환시	_jspService()메소드 안에 생성됨
		  		고로 스크립트릿 안에서는 메소드 정의 불가.		  		
		  		※JSP에서 제공하는 내장객체는 _jspService()메소드 안에 선언된 변수(지역변수)로 고로 
		  		 선언부에서는 사용 불가.(중요)
		  		*/
		  		//void method(){}//[x]메소드 정의 불가
		  		String localVariable="<h4>스크립틀릿 안에서 선언한 변수(지역변수)</h4>";
		  		out.println("<h1 class='display-4'>스크립틀릿으로 출력</h1>");
		  		out.println(INT_MAX);
		  		out.println(mVariable);
		  		out.println(localVariable);
		  		out.println("최대값:"+getMaxNumber(10, 100));
		  		//클래스의 멤버변수(this.out) = 지역변수(out)
				//선언부에서 선언된 out에  _jspService()메소드에서 선언된 out대입 
				this.out=out;
		  		showMessage("<h4>this.out=out방식으로 선언부에 선언한 내장객체 전달</h4>");
		  		//두번째 인자는 _jspService()메소드에서 선언된 내장객체]
		  		showMessage("<h4>매개변수에 내장객체 전달</h4>",out);
    		
    		%>
    		<h1 class="display-4">표현식으로 출력</h1>
    		<!-- 
			예]<%--="EXPRESSION"  --%>
		
			표현식은 _jspService()메소드 안에서 out.print("EXPRESSION");로 변환 됨
			고로 표현식 안에서 ;을 붙이면 에러
			out.print("EXPRESSION";);와 같이 변환됨으로 에러	
		 	-->
		 	<%=INT_MAX %><!--  out.print(INT_MAX);변환됨 -->
    		<%=mVariable %>
    		<%=localVariable %>
    		<%="최대값:"+getMaxNumber(10, 100) %>
    	</fieldset>
  	</div><!-- container -->
</body>
</html>