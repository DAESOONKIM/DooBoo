package com.spring.dooboo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dooboo.dao.DB_PhotoDAO;
import com.spring.dooboo.domain.DB_PhotoDTO;
import com.spring.dooboo.domain.DB_PhotoJoinRecDTO;
import com.spring.dooboo.domain.SearchCondition;

@Service
public class DB_PhotoServiceImpl implements DB_PhotoService {

	@Autowired
	DB_PhotoDAO dao;
	
	
	@Override
	public List<DB_PhotoDTO> selectAllPhoto(SearchCondition sc) throws Exception {
		return dao.selectAllPhoto(sc);
	}


	@Override
	public int count() throws Exception {
		return dao.count();
	}


	@Override
	public List<DB_PhotoJoinRecDTO> retrieveRecRslt(String id) throws Exception {
		return dao.retrieveRecRslt(id);
	}


	@Override
	public List<DB_PhotoJoinRecDTO> retrieveRecRsltN(String id) throws Exception {
		return dao.retrieveRecRsltN(id);
	}


	@Override
	public List<DB_PhotoDTO> retrieveNoRecPhotonum(String id) throws Exception {
		return dao.retrieveNoRecPhotonum(id);
	}

}
