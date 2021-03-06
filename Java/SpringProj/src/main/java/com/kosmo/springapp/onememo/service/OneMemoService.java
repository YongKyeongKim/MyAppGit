package com.kosmo.springapp.onememo.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

//제너릭 인터페이스
public interface OneMemoService<T> {
	//로그인 용]
	boolean isLogin(Map map);
	//목록용]
	//HttpServletRequest :페이징 문자열 생성시 html태그 링크주소에 컨텍스트 루트 추가하기 위함
	ListPagingData<T> selectList(Map map,HttpServletRequest req,int nowPage);
	//상세보기용]
	T selectOne(Map map);
	//입력/수정/삭제용]	
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	//키로 이름 찾는 메소드
	String findNameByKey(Map map);
	
	
}
