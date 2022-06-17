package controller.basic;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1.HttpServelt상속
public class GetController extends HttpServlet {

	@Override
	public void init() throws ServletException {
		System.out.println("서블릿의 init()");
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.service(req, resp);//주석처리시 doGet/doPost 호출 안됨
		System.out.println("서블릿의 service()");
	}
	@Override
	public void destroy() {
		System.out.println("서블릿의 destroy()");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("POST방식");
	}
	//2.GET방식으로 요청이 들어옴:doGet오버라이딩
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GET방식");
		//3.리퀘스트 영역에 데이타 저장
		req.setAttribute("GET","GET방식 요청입니다");
		//4.뷰로(JSP페이지)로 포워딩
		//4-1.뷰 선택
		RequestDispatcher dispatcher= req.getRequestDispatcher("/Servlet13/ServletBasic.jsp");
		//4-2.뷰로 포워딩
		dispatcher.forward(req, resp);
	}
	
	
	

}
