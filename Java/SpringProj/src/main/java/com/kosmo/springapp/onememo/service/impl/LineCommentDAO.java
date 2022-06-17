package com.kosmo.springapp.onememo.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.springapp.onememo.service.LineCommentDTO;

@Repository
public class LineCommentDAO {
	//SqlSessionTemplate객체 주입
	@Autowired
	private SqlSessionTemplate template;
	
	public int insert(Map map) {
		//마이바티스의 insert는 무조건 영향받은 행의 수 반환
		template.insert("commentInsert",map);
		//인자로 전달하는 Map에 새로 입력된 행의 키(번호)를 담을 수 있다
		return Integer.parseInt(map.get("lno").toString());
	}

	public List<LineCommentDTO> selectList(Map map) {		
		return template.selectList("commentSelectList", map);
	}

	public String findNameByKey(Map map) {		
		return template.selectOne("commentFindNameByKey",map);
	}

	public int update(Map map) {		
		return template.update("commentUpdate",map);
	}

	public int delete(Map map) {
		return template.delete("commentDelete",map);
	}

	public int deleteByNo(Map map) {		
		return template.delete("commentDeleteByNo",map);
	}
	//마이바티스 동적 SQL 이메일 삭제용
	public void deletesByNo(int[] email) {
		template.delete("commentDeletesByNo",email);		
	}

}
