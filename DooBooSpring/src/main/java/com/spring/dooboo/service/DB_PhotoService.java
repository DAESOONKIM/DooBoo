package com.spring.dooboo.service;

import java.util.List;

import com.spring.dooboo.domain.DB_PhotoDTO;
import com.spring.dooboo.domain.SearchCondition;

public interface DB_PhotoService {
	
	List<DB_PhotoDTO> selectAllPhoto(SearchCondition sc)throws Exception;
		
	int count() throws Exception;

}
