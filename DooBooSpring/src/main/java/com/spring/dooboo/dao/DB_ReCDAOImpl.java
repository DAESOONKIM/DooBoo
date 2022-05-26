package com.spring.dooboo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dooboo.domain.DB_RecDTO;

@Repository
public class DB_ReCDAOImpl implements DB_RecDAO {

	@Autowired
	private SqlSession session;
	private static String namespace = "com.spring.dooboo.dao.dbRecMapper.";
	
	@Override
	public int insertRec(DB_RecDTO dto) throws Exception {
		return session.insert(namespace+"insertRec",dto);
	}

	@Override
	public int updateRec(DB_RecDTO dto) throws Exception {
		return session.update(namespace+"updateRec", dto);
	}

	@Override
	public int retrieveRecYn(DB_RecDTO dto) throws Exception {
		return session.selectOne(namespace+"retrieveRecYn", dto);
	}

	@Override
	public int retrieveCount(DB_RecDTO dto) throws Exception {
		return session.selectOne(namespace+"retrieveCount", dto);
	}

}
