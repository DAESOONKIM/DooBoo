package com.spring.dooboo.dao;

import com.spring.dooboo.domain.DB_MemberDTO;

public interface DB_MemberDAO {
	
	
	int insertMember(DB_MemberDTO dto) throws Exception;
	
	DB_MemberDTO LoginMember(String id) throws Exception;
	
	int joinIdChk(String joinId) throws Exception;

	int updatePassword(String id, String password) throws Exception; 
}
