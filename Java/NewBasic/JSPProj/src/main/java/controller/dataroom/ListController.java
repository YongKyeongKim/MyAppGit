package controller.dataroom;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PagingUtil;
import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;

//1]사용자 요청을 받을 수 있도록 서블릿 클래스로 만들기(HttpServlet상속)즉 컨트롤러로 만들기
public class ListController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//가]사용자 요청을 받는다	
		//나]요청을 분석한다.
		//다]모델에서 필요한 로직 호출해서 결과값이 있으면 받기 
		DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
		Map map = new HashMap();
		
		//페이징 로직 호출-제너릭 인터페이스 사용시
		/*
		PagingUtil.setMapForPaging(map, dao, req);
		int totalRecordCount=Integer.parseInt(map.get("totalRecordCount").toString());
		int pageSize = Integer.parseInt(map.get("pageSize").toString());
		int blockPage=Integer.parseInt(map.get("blockPage").toString());
		int nowPage = Integer.parseInt(map.get("nowPage").toString());
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize,blockPage,nowPage,req.getContextPath()+"/DataRoom/List.kosmo?");
		*/
		//페이징 로직 호출-제너릭 인터페이스 사용전
		//페이징을 위한 로직 시작
		//전체 레코드수
		int totalRecordCount = dao.getTotalRecordCount(map);
		//페이지사이즈
		int pageSize = Integer.parseInt(req.getServletContext().getInitParameter("PAGE-SIZE"));
		//블락페이지
		int blockPage = Integer.parseInt(req.getServletContext().getInitParameter("BLOCK-PAGE"));
		//전체 페이지수
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		//현재 페이지 번호
		int nowPage=req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		//시작 및 끝 ROWNUM구하기
		int start=(nowPage-1)*pageSize+1;
		int end=nowPage*pageSize;	
		//페이징을 위한 로직 끝
		map.put("start",start);
		map.put("end",end);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount,pageSize,blockPage,nowPage,req.getContextPath()+"/DataRoom/List.kosmo?");
		map.put("totalRecordCount",totalRecordCount);	
		map.put("pageSize",pageSize);		
		map.put("nowPage",nowPage);			
		//CRUD로직 호출
		List<DataRoomDTO> records=dao.selectList(map);
		dao.close();
		//라]결과값이 있으면 리퀘스트 영역에 저장
		req.setAttribute("records", records);
		req.setAttribute("pagingString", pagingString);
		req.setAttribute("pagingMap", map);
		//마]결과값을 뿌려줄 뷰(JSP페이지) 선택후 포워딩 
		//뷰선택]
		RequestDispatcher dispatcher = req.getRequestDispatcher("/DataRoom14/List.jsp");
		//포워딩]
		dispatcher.forward(req, resp);
	}//////////
}//////////
