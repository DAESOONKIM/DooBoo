package com.spring.dooboo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dooboo.domain.DB_MemberDTO;

@Repository
public class DB_MemberDAOImpl implements DB_MemberDAO {
	
	@Autowired
	DataSource ds;

	@Override
	public int insertMember(DB_MemberDTO dto) throws Exception {
		String sql = "insert into DB_MEMBER(id,email,password,name,phone,address,zonecode,addressdetail) VALUES(?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			 Connection conn = ds.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	         
	       
	         
	        pstmt.setString(1, dto.getId());
	 		pstmt.setString(2, dto.getEmail());
	 		pstmt.setString(3, dto.getPassword());
	 		pstmt.setString(4, dto.getName());
	 		pstmt.setString(5, dto.getPhone());
	 		pstmt.setString(6,dto.getAddress());
	 		pstmt.setString(7,dto.getZonecode());
	 		pstmt.setString(8,dto.getAddressdetail());
	 		
	 		result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return result;
	}

	@Override
	public DB_MemberDTO LoginMember(String id) throws Exception {
		DB_MemberDTO member = new DB_MemberDTO();
		String sql = "select * from DB_MEMBER where id = ?";
		try {
			
			 Connection conn = ds.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
	        
	         pstmt.setString(1, id);
	         ResultSet rs = pstmt.executeQuery();	
	        
	         if(rs.next()) {
	        	 member.setId(rs.getString(1));
	        	 member.setEmail(rs.getString(2));
	        	 member.setPassword(rs.getString(3));
	        	 member.setName(rs.getString(4));
	        	 member.setPhone(rs.getString(5));
	        	 member.setAddress(rs.getString(6));
	        	 member.setZonecode(rs.getString(7));
	        	 member.setAddressdetail(rs.getString(8));

	         }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}

	@Override
	public int joinIdChk(String joinId) throws Exception {
		String sql = "select count(*) from DB_MEMBER where id = ?";
		int count = 0;
		try {
			 Connection conn = ds.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
			
	         pstmt.setString(1, joinId);
	         ResultSet rs = pstmt.executeQuery();	
	         
	         if(rs.next()) {
	 			count = rs.getInt(1);
	 			
	 		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return count;
	}

	@Override
	public int updatePassword(String id, String password) throws Exception {
		String sql = "update DB_MEMBER set password = ? where id = ?";
		int count = 0; 
		
		try {
			 Connection conn = ds.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(sql);
			
	         pstmt.setString(1, password);
	         pstmt.setString(2, id);
	         
	     	 count = pstmt.executeUpdate();
	         
		} catch (Exception e) {
			 e.printStackTrace();
		}
		
		return count;
	}
	

}
