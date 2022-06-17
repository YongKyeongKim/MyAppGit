package model;

import java.sql.Date;

/*
 * DTO(Data Tranfer Object):데이타를 전송하는 객체로
 *                          테이블의 레코드 하나를 저장할 수 
 *                          있는 자료구조
 * 
 * 
 */
public class BBSDto {
	
	private String no;
	private String id;
	private String title;
	private String content;
	private String hitCount;
	private java.sql.Date postDate;
	private String name;//이름 저장용
	
	//생성자]
	public BBSDto() {}	
	public BBSDto(String no, String id, String title, String content, String hitCount, Date postDate, String name) {
		
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.hitCount = hitCount;
		this.postDate = postDate;
		this.name = name;
	}

	//게터/세터]
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHitCount() {
		return hitCount;
	}
	public void setHitCount(String hitCount) {
		this.hitCount = hitCount;
	}
	public java.sql.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}
	
	
}
