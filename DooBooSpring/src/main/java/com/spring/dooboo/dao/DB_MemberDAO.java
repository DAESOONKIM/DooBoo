package com.spring.dooboo.dao;

import com.spring.dooboo.domain.DB_MemberDTO;

public interface DB_MemberDAO {
	
	
	int insertMember(DB_MemberDTO dto) throws Exception; //화원가입
	  
	DB_MemberDTO LoginMember(String id) throws Exception;  //회원정보 조회
	
	int joinIdChk(String joinId) throws Exception; //중복 ID Check

	int updatePassword(String id, String password) throws Exception;  //비밀번호 수정
	
	int updateMember(DB_MemberDTO dto) throws Exception; //회원정보 수정

}
