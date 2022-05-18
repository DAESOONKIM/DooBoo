package com.spring.dooboo.service;

import java.util.List;

import com.spring.dooboo.domain.DB_BoardDTO;
import com.spring.dooboo.domain.SearchCondition;

public interface DB_BoardService {
	  
	
	List<DB_BoardDTO> boardList(SearchCondition sc) throws Exception; 
	

	int count(SearchCondition sc) throws Exception;
	
	int writeBoard(DB_BoardDTO boardDto) throws Exception;
	
	DB_BoardDTO selectInfo(Integer num) throws Exception;
	
	int updateBoard(DB_BoardDTO boardDto) throws Exception;
	
	int deleteBoard(Integer num) throws Exception;
	
	void updateReadcount(Integer num) throws Exception;
}
