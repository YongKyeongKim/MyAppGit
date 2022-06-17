package com.kosmo.springapp.basic.dynamicsql;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.kosmo.springapp.onememo.service.impl.LineCommentDAO;

/* 컨트롤러에서 바로 DAO주입 받아서 호출하자*/
@Repository
public class DynamicSqlDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	public List if1(Map map) {		
		return template.selectList("findWithTitleLike",map);
	}

	public List if2(Map map) {
		return template.selectList("findWithLike",map);
	}

	public List choose(Map map) {
		
		return template.selectList("findWithLikeChoose",map);
	}

	public List where(Map map) {
		return template.selectList("findWithLikeWhere",map);
	}

	public List trim1(Map map) {
		return template.selectList("findWithLikeTrim",map);
	}

	public int trim2(Map map) {		
		return template.update("updateWithLikeTrim",map);
	}

	public int set(Map map) {		
		return template.update("updateWithSet",map);
	}
	//리스트일때
	/*
	public List foreach(List list) {
		return template.selectList("findForeach",list);
	}
	*/
	public List foreach(Map map) {
		return template.selectList("findForeach",map);
	}
	@Autowired
	private TransactionTemplate transactionTemplate;
	@Autowired
	private LineCommentDAO dao;
	
	public int foreachExam(int[] email) {		
		int deleteCount =transactionTemplate.execute(status->{			
			dao.deletesByNo(email);			
			int affected=template.delete("deleteEmail",email);
			return affected;
		});
		return deleteCount;
	}
	
}
