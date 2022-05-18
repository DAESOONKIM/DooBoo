package com.spring.dooboo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dooboo.domain.DB_BoardDTO;
import com.spring.dooboo.domain.SearchCondition;

@Repository
public class DB_BoardDAOImpl implements DB_BoardDAO {
	
	@Autowired
	private SqlSession session;
	private static String namespace ="com.spring.dooboo.dao.dbBoardMapper."; 
	
	
	@Override
	public List<DB_BoardDTO> selectAll(SearchCondition sc) throws Exception {
		return session.selectList(namespace+"selectAllPage", sc);
	}

	@Override
	public int count(SearchCondition sc) throws Exception{
		return session.selectOne(namespace+"count",sc);
	}

	@Override
	public int writeBoard(DB_BoardDTO boardDto) throws Exception {
		return session.insert(namespace+"insertBoard", boardDto);
	}

	@Override
	public DB_BoardDTO selectInfo(Integer num) throws Exception {
		return session.selectOne(namespace+"selectInfo", num);
	}

	@Override
	public int updateBoard(DB_BoardDTO boardDto) throws Exception {
		return session.update(namespace+"updateBoard", boardDto);
	}

	@Override
	public int deleteBoard(Integer num) throws Exception {
		return session.delete(namespace+"deleteBoard",num);
	}

	@Override
	public int updateCommentCnt(Integer num, int cnt) throws Exception {
		Map map = new HashMap();
		map.put("cnt", cnt);
		map.put("num", num); 
		return session.update(namespace+"updateCommentCnt", map);
	}

	@Override
	public void updateReadcount(Integer num) throws Exception {
		 session.update(namespace+"updateReadcount", num);
	}

}
