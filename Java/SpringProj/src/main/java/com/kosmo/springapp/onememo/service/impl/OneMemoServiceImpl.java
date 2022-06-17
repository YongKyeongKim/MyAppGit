package com.kosmo.springapp.onememo.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionTemplate;

import com.kosmo.springapp.onememo.service.ListPagingData;
import com.kosmo.springapp.onememo.service.OneMemoDTO;
import com.kosmo.springapp.onememo.service.OneMemoService;
import com.kosmo.springapp.onememo.service.PagingUtil;

/*
 * 이름 미 지정시 ID값은 소문자로 시작하는 클래스명이됨
 * 예]OneMemoServiceImpl클래인 경우 ID값은 oneMemoServiceImpl
 * 지정도 가능 @Service(value="임의의ID값")
 */
@Service("memoService")
public class OneMemoServiceImpl implements OneMemoService<OneMemoDTO>{
	
	//OneMemoDAO주입]	
	@Autowired
	private OneMemoDAO dao;	
	
	@Override
	public boolean isLogin(Map map) {		
		return dao.isLogin(map);
	}
	//리소스파일(paging.properties)에서 읽어오기
	@Value("${pageSize}")
	private int pageSize;
	@Value("${blockPage}")
	private int blockPage;
	@Override
	public ListPagingData<OneMemoDTO> selectList(Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직 시작]
		//전체 레코드수	
		int totalCount=dao.getTotalRecordCount(map);
		map.put(PagingUtil.PAGE_SIZE, pageSize);
		map.put(PagingUtil.BLOCK_PAGE, blockPage);
		map.put(PagingUtil.TOTAL_COUNT, totalCount);
		//페이징과 관련된 값들 얻기를 위한 메소드 호출
		PagingUtil.setMapForPaging(map);
		//글 전체 목록 얻기
		List lists= dao.selectList(map);
		
		String pagingString = PagingUtil.pagingBootStrapStyle(
				Integer.parseInt(map.get(PagingUtil.TOTAL_COUNT).toString()), 
				Integer.parseInt(map.get(PagingUtil.PAGE_SIZE).toString()), 
				Integer.parseInt(map.get(PagingUtil.BLOCK_PAGE).toString()), 
				Integer.parseInt(map.get(PagingUtil.NOW_PAGE).toString()), 
				req.getContextPath()+"/onememo/bbs/List.do?");
		
		//Lombok라이브러리 미 사용시		
		/*
		ListPagingData<OneMemoDTO> listPagingData = new ListPagingData<>();
		listPagingData.setLists(lists);
		listPagingData.setMap(map);		
		listPagingData.setPagingString(pagingString);*/
		
		//Lombok라이브러리 사용시
		ListPagingData<OneMemoDTO> listPagingData =ListPagingData.builder().lists(lists).map(map).pagingString(pagingString).build();

		return listPagingData;
	}///////////////////////
	
	
	
	@Override
	public OneMemoDTO selectOne(Map map) {
		OneMemoDTO record=dao.selectOne(map);
		//줄바꿈 처리
		record.setContent(record.getContent().replace("\r\n","<br/>"));
		return record;
	}

	@Override
	public int insert(Map map) {
		
		return dao.insert(map);
	}
	/*
	 //https://mybatis.org/spring/transactions.html
	 [삭제 작업을 트랜잭션 처리하기]
	 1.빈 설정파일(root-context.xml)에 DataSourceTransactionManager 등록
	 2.빈 설정파일(root-context.xml)에 TransactionTemplate 등록
	 3.TransactionTemplate 주입받는다
	 4.TransactionTemplate객체의 execute()메소드로 트랜잭션 작업 실행
	   You can omit to call the commit and rollback method using the TransactionTemplate.
	 
	 ※트랜잭션 작업에서 런타임 오류시 롤백,정상 실행시 커밋된다
	  트랜잭션 처리는 @Service어노테이션이 붙은 클래스에서 하자
	 */
	
	@Autowired
	private TransactionTemplate transactionTemplate;
	
	//글번호에따른 댓글 삭제용 DAO주입 받기
	@Autowired
	private LineCommentDAO ldao;
	
	@Override
	public int delete(Map map) {	
		int affected =0;
		/*
		//1. 람다 함수 미 사용
		affected=transactionTemplate.execute(new TransactionCallback<Integer>() {
			//doInTransaction메소드 안에 트랜잭션으로 처리할 작업들 기술
			//You can omit to call the commit and rollback method using the TransactionTemplate.
			@Override
			public Integer doInTransaction(TransactionStatus status) {
				//삭제된 글의  댓글 수 반환
				//글번호에 따른 모든 댓글 삭제
				int deleteCommentCount=ldao.deleteByNo(map);
				//트랙잭션 테스트용 에러 코드 두줄 추가
				//String str=null;
				//str.length();
				//해당 글 삭제
				dao.delete(map);
				//반환값이 execute메소드의 반환값이다 
				return deleteCommentCount;
			}
			
		});
		*/
		//2.람다 함수 사용
		affected = transactionTemplate.execute(tx->{
			int deleteCommentCount=ldao.deleteByNo(map);
			dao.delete(map);
			return deleteCommentCount;
		});
		return affected;
	}

	@Override
	public int update(Map map) {		
		return dao.update(map);
	}
	@Override
	public String findNameByKey(Map map) {
		// TODO Auto-generated method stub
		return null;
	}


	
	

}
