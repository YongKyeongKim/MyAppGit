package com.kosmo.springapp.basic.resource;

public class UserCommand {
	
	//.proeprties파일의 키와 클래스의 속성을 일치 시키자(강제사항은 아님)
	
	
	private String name;
	private String username;
	private String password;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "[이름=" + name + ",아이디=" + username + ",비밀번호=" + password + "]";
	}
	
}
