package com.spring.dooboo.dao;

import com.spring.dooboo.domain.DB_RecDTO;

public interface DB_RecDAO {
	
	int insertRec(DB_RecDTO dto) throws Exception;
	
	int updateRec(DB_RecDTO dto) throws Exception;
	
	int retrieveRecYn(DB_RecDTO dto) throws Exception;
	
	int retrieveCount(DB_RecDTO dto) throws Exception;

}
