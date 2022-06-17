<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CookieExamLoginProcess.jsp -->
<%
	//사용자 입력값 받기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String idSave = request.getParameter("id-save");
	//아뒤가 KIM이고 비번이 1234면 회원이라고 가정]	
	if("KIM".equals(id.trim()) && "1234".equals(pwd) ){//회원
		//1.로그인 처리]-세션영역에 속성(주로 식별자만(아이디만)) 저장
		session.setAttribute("USER_ID", id);
		session.setAttribute("USER_PWD", pwd);
		//아이디저장 체크 여부 판단
		if(idSave !=null){//체크 한 경우-아이디를 쿠키에 저장
			Cookie cookie = new Cookie("USER_ID",id);
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);			
		}
		else{//체크 안 한 경우-저장된 쿠키 삭제
			Cookie cookie = new Cookie("USER_ID","");
			cookie.setPath(request.getContextPath());
			cookie.setMaxAge(-1);
			response.addCookie(cookie);
		}
		//2.로그인 처리후 CookieExamIndex.jsp로 이동
		response.sendRedirect("CookieExamIndex.jsp");
	}
	else{//아이디 비번 불일치
		//리퀘스트 영역에 필요한 데이터 저장
		request.setAttribute("ERROR", "아이디/비번 불일치");
		//포워드로 이동
		request.getRequestDispatcher("CookieExamIndex.jsp").forward(request, response);
	}



%>