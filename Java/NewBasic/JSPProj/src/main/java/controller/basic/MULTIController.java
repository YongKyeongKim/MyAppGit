package controller.basic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MULTIController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String crud = req.getParameter("crud");
		String message;
		switch(crud.toUpperCase()) {
			case "CREATE":message="입력처리 요청입니다";break;
			case "READ":message="조회처리 요청입니다";break;
			case "UPDATE":message="수정처리 요청입니다";break;
			default:message="삭제처리 요청입니다";		
		}////
		req.setAttribute("MULTI",message);
		req.getRequestDispatcher("/Servlet13/ServletBasic.jsp").forward(req, resp);
	}//////////////
}
