<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ForwardActionTagExamProcess.jsp -->
<%@ include file="/Common/Validate.jsp" %>
<%
	/*
	1.서버측 유효성 체크를 추가하여라.
	  단,체크박스는 2개이상 선택하도록하여라
	2.모든 파라미터를 받아서  맵 컬렉션에 저장하고 다시 맵 컬렉션을 리퀘스트 영역에 저장하여라
	
	3. 액션태그를 이용해서 ForwardActionTagExamResult.jsp로 이동하여라
	
	4. ForwardActionTagExamProcess.jsp페이지에서는 파라미터와 영역에서 값을 읽어와 출력하여라
	*/
	Map<String,String[]> map= request.getParameterMap();
	if(!isValidate(out, map.get("username")[0],"아이디를 입력하세요")) return;
	if(!isValidate(out, map.get("password")[0],"비밀번호를 입력하세요")) return;
	if(!isValidate(out, map.get("sports"),2)) return;	
	if(!isValidate(out, map.get("ages")==null ? null : map.get("ages")[0],"연령대를 선택하세요")) return;
	
	request.setAttribute("map", map);	
	
%>

<jsp:forward page="ForwardActionTagExamResult.jsp"/>
