package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;
import model.dataroom.FileUtils;

//1]HttpServlet상속-컨트롤러가 됨 즉 서블릿이 됨
public class WriteController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//2]요청분석- 입력폼 요청
		//3]모델호출 및 결과값 받기
		//4]결과값이 있으면 ,리퀘스트 영역에 저장
		//5]뷰 선택
		req.getRequestDispatcher("/DataRoom14/Write.jsp").forward(req, resp);
	}///doGet
	//[입력 처리 즉 파일 업로드 및 데이타베이스 입력]
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//한글처리]
		req.setCharacterEncoding("UTF-8");
		//2]요청분석- 입력처리 요청
		//3]모델호출 및 결과값 받기
		//파일 업로드와 관련된 모델(비지니스 로직) 호출
		MultipartRequest mr= FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"),1024*500);
		
		int successOrFail;//DB입력 성공시에는 1,실패시 0, 파일용량 초과시에는 -1 저장
		if(mr !=null && mr.getFile("attachFile") !=null ) {//파일 업로드 성공일때 DB 입력처리
			
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String attachFile = mr.getFilesystemName("attachFile");
			String password = mr.getParameter("password");
			String content = mr.getParameter("content");
			//데이타베이스 CRUD작업과 관련된 모델 호출]
			DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
			DataRoomDTO dto = new DataRoomDTO();
			dto.setAttachFile(attachFile);
			dto.setContent(content);
			dto.setName(name);
			dto.setPassword(password);
			dto.setTitle(title);
			successOrFail=dao.insert(dto);
			dao.close();
			if(successOrFail==0) {//데이터 입력 실패시 업로드 된 파일 삭제
				//파일 삭제 로직 호출
				FileUtils.deleteFile(req,"/Upload",attachFile);
			}
			
		}
		else {//파일 용량 초과시
			successOrFail = -1;
		}
		//5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
		req.setAttribute("SUCCFAIL", successOrFail);
		//5-2]컨트롤러 구분용-입력:INS,수정:EDT,삭제:DEL
		req.setAttribute("WHERE", "INS");
		//[이동방법1]-바로 목록으로 이동:반드시 List.jsp가 아닌 List.kosmo로
		//req.getRequestDispatcher("/DataRoom/List.kosmo").forward(req, resp);
		//[이동방법2]-메시지 뿌려주는 jsp페이지(successOrFail값 사용)로 이동후 목록으로 이동
		req.getRequestDispatcher("/DataRoom14/Message.jsp").forward(req, resp);
	}/////////////doPost
}
