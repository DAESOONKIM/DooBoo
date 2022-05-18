package com.spring.dooboo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.dooboo.dao.DB_BoardDAO;
import com.spring.dooboo.dao.DB_Board_CommentDAO;
import com.spring.dooboo.domain.DB_Board_CommentDTO;

@Service
public class DB_Board_CommentServiceImpl implements DB_Board_CommentService {

	
	DB_BoardDAO boardDao;
	DB_Board_CommentDAO commentDao;
	
	
	@Autowired
	public DB_Board_CommentServiceImpl(DB_BoardDAO boardDao, DB_Board_CommentDAO commentDao) {
		this.boardDao = boardDao;
		this.commentDao = commentDao;
	}



	@Override
	@Transactional(rollbackFor = Exception.class) //예외발생시 롤백
	public int wrtieComment(DB_Board_CommentDTO commentDto) throws Exception {
		boardDao.updateCommentCnt(commentDto.getBno(), 1);
		
		return commentDao.writeComment(commentDto);
		
	}

	@Override
	public List<DB_Board_CommentDTO> retrieveAllComment(Integer bno, Integer startRow, Integer endRow) throws Exception {
		return commentDao.retrieveAllComment(bno,startRow,endRow);
	}



	@Override
	@Transactional(rollbackFor = Exception.class) //예외발생시 롤백
	public int removeComment(Integer cno, Integer bno) throws Exception {
		boardDao.updateCommentCnt(bno,-1);
		
		return commentDao.removeComment(cno);
	}



	@Override
	public int updateComment(DB_Board_CommentDTO commentDto) throws Exception {
		return commentDao.updateComment(commentDto);
	}



	@Override
	public int countComment(Integer bno) throws Exception {
		return commentDao.countComment(bno);
	}

}
