package controller.basic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SECONDController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//FirstController로 포워드(JSP페이지가 아닌)
	    //뷰(jsp페이지) 뿐만 아니라 컨트롤러(서블릿)로 요청을 보내는 URL도 지정가능
		req.setAttribute("WHERE", "두번째 컨트롤러");
		req.getRequestDispatcher("/Basic/first.kosmo").forward(req, resp);
	}
}
