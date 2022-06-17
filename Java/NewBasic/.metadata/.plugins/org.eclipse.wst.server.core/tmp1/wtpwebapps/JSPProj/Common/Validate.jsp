<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	private boolean isValidate(JspWriter out, String param, String message) {
		if (param == null || param.trim().length() == 0) {
			try {
				out.println("<script>");
				out.println("alert('" + message + "');");
				out.println("history.back();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
		}
		return true;
	}/////////////isValidate

	private boolean isValidate(JspWriter out, String[] param,int count) {
		if (param == null) {
			try {
				out.println("<script>");
				out.println("alert('관심사항을 선택하세요');");
				out.println("history.back();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
		}
		if (param.length < count) {
			try {
				out.println("<script>");
				out.println("alert('관심사항은 "+count+"개 이상 선택하세요');");
				out.println("history.back();");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return false;
		}
		return true;
	}/////////////isValidate
%>