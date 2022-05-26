package com.spring.dooboo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dooboo.domain.DB_PhotoDTO;
import com.spring.dooboo.domain.DB_PhotoJoinRecDTO;
import com.spring.dooboo.domain.SearchCondition; 

@Repository
public class DB_PhotoDAOImpl implements DB_PhotoDAO {
	
	@Autowired 
	private SqlSession session;
	private static String namespace = "com.spring.dooboo.dao.dbPhotoMapper.";
	
	@Override
	public List<DB_PhotoDTO> selectAllPhoto(SearchCondition sc) throws Exception {
		return session.selectList(namespace+"selectAllPhoto",sc) ;
	}

	@Override
	public int count() throws Exception {
		return session.selectOne(namespace+"count");
	}

	@Override
	public List<DB_PhotoJoinRecDTO> retrieveRecRslt(String id) throws Exception {
		return session.selectList(namespace+"retrieveRecRslt", id);
	}

	@Override
	public List<DB_PhotoJoinRecDTO> retrieveRecRsltN(String id) throws Exception {
		return session.selectList(namespace+"retrieveRecRsltN", id);
	}

	@Override
	public List<DB_PhotoDTO> retrieveNoRecPhotonum(String id) throws Exception {
		return session.selectList(namespace+"retrieveNoRecPhotonum", id);
	}

}
