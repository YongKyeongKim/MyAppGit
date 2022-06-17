package com.kosmo.springapp.basic.annotation;

public class LoginCommand {
	//폼의 파라미터명과 일치 시키자
	//※속성(멤버변수)는 소문자로 시작해야한다.
	private String id;
	private String pwd;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}
