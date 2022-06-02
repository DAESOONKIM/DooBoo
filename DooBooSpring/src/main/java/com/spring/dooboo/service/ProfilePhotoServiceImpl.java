package com.spring.dooboo.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dooboo.dao.ProfilePhotoDAO;

@Service
public class ProfilePhotoServiceImpl implements ProfilePhotoService {

	@Autowired
	ProfilePhotoDAO dao;
	
	
	@Override
	public int checkPhoto(String userId) throws Exception {
		return dao.checkPhoto(userId);
	}

	@Override
	public int insertPhoto(Map map) throws Exception {
		return dao.insertPhoto(map);
	}

	@Override
	public int updatePhoto(Map map) throws Exception {
		return dao.updatePhoto(map);
	}

	@Override
	public int deletePhoto(String userId) throws Exception {
		return dao.deletePhoto(userId);
	}

	@Override
	public String rtrvPhotoName(String userId) throws Exception {
		return dao.rtrvPhotoName(userId);
	}

}
