package controller.basic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FIRSTController extends HttpServlet {
	
	//405에러 피하려면 servcie()메소드 오버라이딩하자
	/*
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//입력폼으로 포워드
		req.getRequestDispatcher("/Servlet13/Form.jsp").forward(req, resp);
	}////////////*/
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//입력폼으로 포워드
		req.getRequestDispatcher("/Servlet13/Form.jsp").forward(req, resp);
	}
}
