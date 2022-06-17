package service;

import java.util.List;
import java.util.Map;

import model.BBSDto;

//제너릭 인터페이스
public interface DAOService<T> {
	
	void close();
	List selectList(Map map);
	int getTotalRecordCount(Map map);
	int insert(T dto);
	T selectOne(String ... one);
	int update(T dto);
	int delete(String no);
}
