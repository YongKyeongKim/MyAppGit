package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//리퀘스트 영역에 저장
		req.setAttribute("INDEX", "누구나 자료를 올릴수 있습니다");
		//index.jsp로 포워드
		req.getRequestDispatcher("/DataRoom14/index.jsp").forward(req, resp);
	}
}
