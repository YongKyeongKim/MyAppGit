package model.dataroom;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FileUtils {
	//파일 업로드 로직]
	public static MultipartRequest upload(HttpServletRequest req,String saveDirectory,int maxPostSize) {
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, saveDirectory,maxPostSize,"UTF-8",new DefaultFileRenamePolicy());
			System.out.println("mr:"+mr);
		}
		catch(Exception e) {e.printStackTrace();}		
		return mr;
	}///////////////upload
	//파일 삭제 로직]
	public static void deleteFile(HttpServletRequest req, String webPath, String filename) {
		
		//서버의 물리적 경로 얻기]
		String saveDirectory = req.getServletContext().getRealPath(webPath);
		//파일 객체 생성]
		File file = new File(saveDirectory+File.separator+filename);		
		//파일 존재 여부 판단후 삭제]
		if(file.exists()) {			
			file.delete();
		}
		
	}/////////////////deleteFile
	//파일 다운로드 로직]
	public static void download(String filename,String webPath,HttpServletRequest request,HttpServletResponse response) {
		try {
			String saveDirectory = request.getServletContext().getRealPath(webPath);
			File file = new File(saveDirectory+File.separator+filename);
			long length= file.length();
			
			response.setContentType("application/octet-stream");
			//4-2]다운로드시 프로그래스바를 표시하기 위한 컨텐츠 길이 설정
			response.setContentLengthLong(length);
			
			boolean isIe = request.getHeader("user-agent").toUpperCase().indexOf("MSIE") != -1 ||
					       request.getHeader("user-agent").indexOf("11.0") != -1 ||
					       request.getHeader("user-agent").toUpperCase().indexOf("EDGE") != -1;
			if(isIe){//인터넷 익스플로러 혹은 엣지
				filename = URLEncoder.encode(filename, "UTF-8");
			}
			else{//기타 브라우저
				
		 		filename = new String(filename.getBytes("UTF-8"),"8859_1");
				
			}
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			
			BufferedInputStream bis =
				new BufferedInputStream(new FileInputStream(file));
			
			
			//6]웹브라우저에 연결할 출력 스트림 생성
			BufferedOutputStream bos =
				new BufferedOutputStream(response.getOutputStream());
			//7]bis로 읽고 bos로 웹브라우저에 출력
			int data;
			while((data=bis.read()) !=-1){
				bos.write(data);
				bos.flush();
			}
			//8]스트림 닫기
			bis.close();
			bos.close();
		}
		catch(Exception e) {e.printStackTrace();}
		
	}///////////download
}
