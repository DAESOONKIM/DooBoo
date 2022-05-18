package com.spring.dooboo.dao;

import java.util.List;

import com.spring.dooboo.domain.DB_BoardDTO;
import com.spring.dooboo.domain.SearchCondition;

public interface DB_BoardDAO {
		
	DB_BoardDTO selectInfo(Integer num) throws Exception;
	
	List<DB_BoardDTO>selectAll(SearchCondition sc) throws Exception;
	 
	int count(SearchCondition sc) throws Exception;
	
	int writeBoard(DB_BoardDTO boardDto) throws Exception;
	
	int updateBoard(DB_BoardDTO boardDto) throws Exception;
	
	int deleteBoard(Integer num) throws Exception;
	
	int updateCommentCnt(Integer num, int cnt) throws Exception;
	
	void updateReadcount(Integer num) throws Exception;
	
}
