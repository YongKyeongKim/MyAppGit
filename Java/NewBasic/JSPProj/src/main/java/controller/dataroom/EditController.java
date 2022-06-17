package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.BBSDao;
import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;
import model.dataroom.FileUtils;

public class EditController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * 모두 POST요청임으로
		 * 수정폼으로 이동 및 수정처리는 
		 * 전달된 파라미터로 구분하거나 이전 URL로 구분하여 분기처리
		 */
		String mode = req.getParameter("mode");
		System.out.println("모드:"+mode+",이전 URL:"+req.getHeader("referer"));
		if(mode !=null) {//수정 폼으로 이동		
			//파라미터 받기]
			String no = req.getParameter("no");
			//모델 호출 및 결과 값 받기]
			DataRoomDAO dao = new DataRoomDAO(getServletContext());
			DataRoomDTO record=dao.selectOne(no);
			dao.close();
			//리퀘스트 영역에 저장]
			req.setAttribute("record", record);
			//포워드]
			req.getRequestDispatcher("/DataRoom14/Edit.jsp").forward(req, resp);
			return;
		}
		//수정 처리
		//한글처리]
		req.setCharacterEncoding("UTF-8");
		//파일 업로드와 관련된 모델(비지니스 로직) 호출
		MultipartRequest mr= FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"),1024*500);
		int successOrFail;//DB입력 성공시에는 1,실패시 0, 파일용량 초과시에는 -1 저장
		if(mr !=null) {//파일을 첨부 안했거나 혹은 첨부했다면 500KB이하
			String no=mr.getParameter("no");
			//※MultipartRequest가 파라미터를 
			//가로 챔으로 포워드 하더라도 파라미터가 전달되지 않는다
			//그래서 리퀘스트 영역에 저장
			//키값을 리퀘스트 영역에 저장]수정 완료후 View.kosmo로 이동하기 위함
			req.setAttribute("no", no);
			req.setAttribute("nowPage", mr.getParameter("nowPage"));
			String originalFileName = mr.getParameter("originalFileName");
			
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String attachFile = mr.getFilesystemName("attachFile");
			String password = mr.getParameter("password");
			String content = mr.getParameter("content");
			if(attachFile== null) {//파일 미 첨부 즉 수정시 기존 파일을 새로운 파일로 미 교체
				attachFile=originalFileName;
			}
			//데이타베이스 CRUD작업과 관련된 모델 호출]
			DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
			DataRoomDTO dto = new DataRoomDTO();
			dto.setAttachFile(attachFile);
			dto.setContent(content);
			dto.setName(name);
			dto.setPassword(password);
			dto.setTitle(title);
			dto.setNo(no);
			successOrFail=dao.update(dto);
			dao.close();
			//DB업데이트 성공하고 파일 교체시에만 파일 삭제
			if(mr.getFile("attachFile")!=null && successOrFail==1) {				
				//파일 삭제 로직 호출]
				FileUtils.deleteFile(req,"/Upload",originalFileName);
			}			
		}//if
		else {//파일 용량 초과시
			successOrFail=-1;
		}
		req.setAttribute("SUCCFAIL", successOrFail);		
		req.setAttribute("WHERE", "EDT");
		req.getRequestDispatcher("/DataRoom14/Message.jsp").forward(req, resp);
	}///doGet
}	
