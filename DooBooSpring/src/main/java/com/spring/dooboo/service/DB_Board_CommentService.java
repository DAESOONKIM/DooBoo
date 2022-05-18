package com.spring.dooboo.service;

import java.util.List;

import com.spring.dooboo.domain.DB_Board_CommentDTO;

public interface DB_Board_CommentService {
	
	int wrtieComment(DB_Board_CommentDTO commentDto) throws Exception;
	
	List<DB_Board_CommentDTO>retrieveAllComment(Integer bno, Integer startRow, Integer endRow) throws Exception;  
	
	int removeComment(Integer cno, Integer bno) throws Exception;
	
	int updateComment(DB_Board_CommentDTO commentDto) throws Exception;
	
	int countComment(Integer bno) throws Exception;
}
