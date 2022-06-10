package com.spring.dooboo.domain;

import java.util.Objects;

public class DB_Board_CommentDTO {
	
	private Integer cno;
	private Integer bno;
	private Integer pcno;
	private String co_mment;
	private String commenter;
	private String reg_date;
	private String up_date;
	//프로필포토 컬럼
	private String profilephoto;
	
	public DB_Board_CommentDTO() {}
	
	public DB_Board_CommentDTO(Integer bno, Integer pcno, String co_mment, String commenter) {
		this.bno = bno;
		this.pcno = pcno;
		this.co_mment = co_mment;
		this.commenter = commenter;
	}

	public Integer getCno() {
		return cno;
	}

	public void setCno(Integer cno) {
		this.cno = cno;
	}

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public Integer getPcno() {
		return pcno;
	}

	public void setPcno(Integer pcno) {
		this.pcno = pcno;
	}

	public String getCo_mment() {
		return co_mment;
	}

	public void setCo_mment(String co_mment) {
		this.co_mment = co_mment;
	}

	public String getCommenter() {
		return commenter;
	}

	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getUp_date() {
		return up_date;
	}

	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}

	public String getProfilephoto() {
		return profilephoto;
	}

	public void setProfilephoto(String profilephoto) {
		this.profilephoto = profilephoto;
	}

	@Override
	public String toString() {
		return "CommentDto [cno=" + cno + ", bno=" + bno + ", pcno=" + pcno + ", comment=" + co_mment + ", commenter="
				+ commenter + ", reg_date=" + reg_date + ", up_date=" + up_date + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(bno, cno, co_mment, commenter, pcno);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DB_Board_CommentDTO other = (DB_Board_CommentDTO) obj;
		return Objects.equals(bno, other.bno) && Objects.equals(cno, other.cno)
				&& Objects.equals(co_mment, other.co_mment) && Objects.equals(commenter, other.commenter)
				&& Objects.equals(pcno, other.pcno);
	}
	
	
	
	
	
	
	
	
	
	

}
