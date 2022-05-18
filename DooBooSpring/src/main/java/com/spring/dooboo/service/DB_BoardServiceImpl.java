package com.spring.dooboo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dooboo.dao.DB_BoardDAO;
import com.spring.dooboo.domain.DB_BoardDTO;
import com.spring.dooboo.domain.SearchCondition;

@Service
public class DB_BoardServiceImpl implements DB_BoardService {
	
	@Autowired
	DB_BoardDAO dao;
	
	@Override
	public List<DB_BoardDTO> boardList(SearchCondition sc) throws Exception {
		return dao.selectAll(sc); 
	}

	@Override
	public int count(SearchCondition sc) throws Exception {
		return dao.count(sc);
	}

	@Override
	public int writeBoard(DB_BoardDTO boardDto) throws Exception {
		return dao.writeBoard(boardDto);
	}

	@Override
	public DB_BoardDTO selectInfo(Integer num) throws Exception {
		return dao.selectInfo(num);
	}

	@Override
	public int updateBoard(DB_BoardDTO boardDto) throws Exception {
		return dao.updateBoard(boardDto);
	}

	@Override
	public int deleteBoard(Integer num) throws Exception {
		return dao.deleteBoard(num);
	}

	@Override
	public void updateReadcount(Integer num) throws Exception {
		 dao.updateReadcount(num);
	}

}
