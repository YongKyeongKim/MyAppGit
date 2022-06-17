package com.kosmo.springapp.onememo.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.springapp.onememo.service.LineCommentDTO;
import com.kosmo.springapp.onememo.service.ListPagingData;
import com.kosmo.springapp.onememo.service.OneMemoService;

@Service("commentService")
public class LineCommentServiceImpl implements OneMemoService<LineCommentDTO> {

	//LineCommentDAO주입
	@Autowired
	private LineCommentDAO dao;
	
	@Override
	public boolean isLogin(Map map) {return false;}

	@Override
	public ListPagingData<LineCommentDTO> selectList(Map map, HttpServletRequest req, int nowPage) {
		List comments=dao.selectList(map);
		return ListPagingData.builder().lists(comments).build();
	}

	@Override
	public LineCommentDTO selectOne(Map map) {return null;}

	@Override
	public int insert(Map map) {
		//영향받은 행의 수가 아니라 새로 입력된 레코드의 키값(lno)를 반환 받는다
		//마이바티스의 insert()는 무조건 영향받은 행의 수를 반환
		int newLno = dao.insert(map);
		System.out.println("새로 입력된 코멘트의 글번호:"+newLno);
		
		return newLno;
	}

	@Override
	public int delete(Map map) {		
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {		
		return dao.update(map);
	}
	//map에 lno키 넣기
	@Override
	public String findNameByKey(Map map) {		
		return dao.findNameByKey(map);
	}



	

	

}
