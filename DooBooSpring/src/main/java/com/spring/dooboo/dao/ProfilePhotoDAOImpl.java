package com.spring.dooboo.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ProfilePhotoDAOImpl implements ProfilePhotoDAO {

	@Autowired
	private SqlSession session;
	private static String namespace = "com.spring.dooboo.dao.profilePhotoMapper.";
	
	@Override
	public int checkPhoto(String userId) throws Exception {
		return session.selectOne(namespace+"checkPhoto", userId);
	}

	@Override
	public int insertPhoto(Map map) throws Exception {
		return session.insert(namespace+"insertPhoto", map);
	}

	@Override
	public int updatePhoto(Map map) throws Exception {
		return session.update(namespace+"updatePhoto", map);
	}

	@Override
	public int deletePhoto(String userId) throws Exception {
		return session.delete(namespace+"deletePhoto", userId);
	}

	@Override
	public String rtrvPhotoName(String userId) throws Exception {
		return session.selectOne(namespace+"retvPhotoName", userId);
	}

}
