package com.spring.dooboo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dooboo.domain.DB_Board_CommentDTO;
@Repository
public class DB_Board_CommentDAOImpl implements DB_Board_CommentDAO {

	@Autowired
	private SqlSession session;
	private static String namespace ="com.spring.dooboo.dao.dbBoardCommentMapper."; 
	
	
	@Override
	public int writeComment(DB_Board_CommentDTO commentDto) throws Exception {
		return session.insert(namespace+"insert", commentDto);
	}
  

	@Override
	public List<DB_Board_CommentDTO> retrieveAllComment(Integer bno, Integer startRow, Integer endRow) throws Exception {
		Map map = new HashMap();
		map.put("bno", bno);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return session.selectList(namespace+"selectAll", map);
	}


	@Override
	public int removeComment(Integer cno) throws Exception {
		Map map = new HashMap();
		map.put("cno", cno);
		return session.delete(namespace+"delete", map);
	}


	@Override
	public int updateComment(DB_Board_CommentDTO commentDto) throws Exception {
		return session.update(namespace+"update",commentDto);
	}


	@Override
	public int countComment(Integer bno) throws Exception {
		return session.selectOne(namespace+"count", bno);
	}

}
