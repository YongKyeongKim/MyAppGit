package com.kosmo.springapp.basic.annotation;

//[스프링에서는 DTO계열 클래스를 커맨드 객체라 한다.]
public class Command {
	
	/*※
	폼의 파라미터명과 속성(멤버변수)을 일치시켜야한다.
    체크박스 같은 경우는 타입을 String[]해도 무방
	String으로 받는 경우 ,(콤마)구분해서 선택된 모든 값들이 저장된다.
	 */
	//속성들]
	private String name;
	private String id;
	private String pwd;
	private String gender;
	private String inter;//혹은 private String[] inter
	private String grade;
	private String file;
	private String self;
	
	//게터/세터]	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getInter() {
		return inter;
	}
	public void setInter(String inter) {
		this.inter = inter;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getSelf() {
		return self;
	}
	public void setSelf(String self) {
		this.self = self;
	}
	/*
	@Override
	public String toString() {
		return "[이름:" + name + ",아이디:" + id + ",비밀번호:" + pwd + ",성별:" + gender + ",관심사항:" + inter
				+ ",학력:" + grade + ",파일:" + file + ",자기소개:" + self + "]";
	}*/
	
}
