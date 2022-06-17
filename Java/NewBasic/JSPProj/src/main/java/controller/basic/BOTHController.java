package controller.basic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BOTHController extends HttpServlet {
	
	//하나의 컨트롤러로 GET 및 POST요청 처리하기
	/*
	//방법1]-service오버라이딩
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("BOTH",req.getMethod()+"방식 요청");
		req.getRequestDispatcher("/Servlet13/ServletBasic.jsp").forward(req, resp);
		//super.service(req, resp);//우리가 재정의
	}///////////////*/
	//방법2]doGet과 doPost오버라이딩해서 한쪽으로 몰아주자(즉 둘 중의 한 메소드에서만 요청 처리 로직 작성)
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}/////////
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//요청 처리 로직 작성
		req.setAttribute("BOTH",req.getMethod()+"방식 요청");
		req.getRequestDispatcher("/Servlet13/ServletBasic.jsp").forward(req, resp);
	}////////////
}
