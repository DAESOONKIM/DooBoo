package com.spring.dooboo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dooboo.dao.DB_RecDAO;
import com.spring.dooboo.domain.DB_RecDTO;

@Service
public class DB_RecServiceImpl implements DB_RecService {

	@Autowired
	DB_RecDAO recDao;
	
	@Override
	public int insertRec(DB_RecDTO dto) throws Exception {
		return recDao.insertRec(dto);
	}

	@Override
	public int updateRec(DB_RecDTO dto) throws Exception {
		return recDao.updateRec(dto);
	}

	@Override
	public int retrieveRecYn(DB_RecDTO dto) throws Exception {
		return recDao.retrieveRecYn(dto);
	}

	@Override
	public int retrieveCount(DB_RecDTO dto) throws Exception {
		return recDao.retrieveCount(dto);
	}

}
