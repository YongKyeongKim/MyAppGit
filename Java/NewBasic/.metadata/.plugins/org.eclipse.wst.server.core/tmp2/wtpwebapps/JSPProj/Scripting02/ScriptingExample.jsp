<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	//[멤버변수]	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private JspWriter out;
	
	//[메소드]
	private void connect(ServletContext application){
		try{
			//드라이버 로딩]
			//Class.forName("oracle.jdbc.OracleDriver");
			Class.forName(application.getInitParameter("ORACLE-DRIVER"));
			//데이타 베이스 연결]
			//conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott", "scott");
			conn= DriverManager.getConnection(application.getInitParameter("ORACLE-URL"),"scott", "scott");
		}
		catch(ClassNotFoundException e){
			try{
				out.println("<h2>드라이버 로딩 실패</h2>");
			}
			catch(IOException e1){e1.printStackTrace();}
		}
		catch(SQLException e){
			try{
				out.println("<h2>데이타베이스 연결 실패</h2>");
			}
			catch(IOException e1){e1.printStackTrace();}
		}
	}///////////////////connect()
	private void close(){
		try{
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			if(conn !=null) conn.close();
		}
		catch(SQLException e){e.printStackTrace();}
	}//////////////////close()
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ScriptingExample.jsp</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
			<h1>스크립팅 요소 연습하기</h1>
		</div>
		<!--container-fluid-->
	</div>
	<!--jumbotron-fluid-->
	<div class="container">
		<fieldset class="form-group border p-3">
			<legend class="w-auto p-3">표현식으로 출력</legend>
			<table class="table table-bordered text-center">
				<thead class="thead-dark">
					<tr>
						<th class="col-1">사번</th>
						<th class="col-2">이름</th>
						<th class="col-2">직책</th>
						<th>입사일</th>
						<th class="col-1">연봉</th>
						<th class="col-1">보너스</th>
						<th class="col-1">부서코드</th>
					</tr>
				</thead>
				<tbody class="table-sm">
					<!-- 아래 tr을 반복 -->
					<%
						this.out= out;
						//데이타 베이스 연결]
						connect(application);
						//퀴리문 준비]
						String sql="SELECT * FROM emp ORDER BY sal DESC";
						//쿼리 실행용 객체 얻기]
						psmt = conn.prepareStatement(
								sql, 
								ResultSet.TYPE_SCROLL_INSENSITIVE, 
								ResultSet.CONCUR_READ_ONLY);
						//쿼리 실행]
						rs = psmt.executeQuery();
						while(rs.next()){
					%>					
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getDate(5) %></td>
						<td><%=rs.getString(6) %></td>
						<td><%=rs.getString(7)==null ? "":rs.getString(7) %></td>
						<td><%=rs.getString(8) %></td>
					</tr>
					<% } %>
				</tbody>
			</table>
		</fieldset>
		<fieldset class="form-group border p-3">
			<legend class="w-auto p-3">out내장객체로 출력</legend>
			<table class="table table-bordered text-center">
				<thead class="thead-dark">
					<tr>
						<th class="col-1">사번</th>
						<th class="col-2">이름</th>
						<th class="col-2">직책</th>
						<th>입사일</th>
						<th class="col-1">연봉</th>
						<th class="col-1">보너스</th>
						<th class="col-1">부서코드</th>
					</tr>
				</thead>
				<tbody class="table-sm">
					<%
					while(rs.previous()){ 
						out.println("<tr>");
						out.println("<td>"+rs.getString(1)+"</td>");
						out.println("<td>"+rs.getString(2)+"</td>");
						out.println("<td>"+rs.getString(3)+"</td>");
						out.println("<td>"+rs.getDate(5)+"</td>");
						out.println("<td>"+rs.getString(6)+"</td>");
						out.println("<td>"+(rs.getString(7)==null ? "":rs.getString(7))+"</td>");
						out.println("<td>"+rs.getString(8)+"</td>");
						out.println("</tr>");
					}
					//자원반납
					close();
					%>
				</tbody>
			</table>
		</fieldset>
	</div>
	<!-- container -->
</body>
</html>