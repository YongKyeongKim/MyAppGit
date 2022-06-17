package com.kosmo.springapp.basic.validation;

public class FormCommand {
	
	//폼의 파라미터명과 같게 속성(멤버변수) 정의]
	private String name;
	private String years;
	private String gender;
	private String[] inter;
	private String grade;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getYears() {
		return years;
	}
	public void setYears(String years) {
		this.years = years;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String[] getInter() {
		return inter;
	}
	public void setInter(String[] inter) {
		this.inter = inter;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
	
}
