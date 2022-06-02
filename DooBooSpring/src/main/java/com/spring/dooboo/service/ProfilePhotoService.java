package com.spring.dooboo.service;

import java.util.Map;

public interface ProfilePhotoService {
	
	int checkPhoto(String userId) throws Exception;
	
	int insertPhoto(Map map) throws Exception;
	
	int updatePhoto(Map map) throws Exception;
		
	int deletePhoto(String userId) throws Exception;

	String rtrvPhotoName(String userId) throws Exception;
}
