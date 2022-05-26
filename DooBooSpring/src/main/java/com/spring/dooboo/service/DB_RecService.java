package com.spring.dooboo.service;

import com.spring.dooboo.domain.DB_RecDTO;

public interface DB_RecService {
	
	int insertRec(DB_RecDTO dto) throws Exception;
	
	int updateRec(DB_RecDTO dto) throws Exception;
	
	int retrieveRecYn(DB_RecDTO dto) throws Exception;
	
	int retrieveCount(DB_RecDTO dto) throws Exception;
	
		

}
