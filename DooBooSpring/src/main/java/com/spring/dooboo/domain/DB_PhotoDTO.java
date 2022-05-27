package com.spring.dooboo.domain;

public class DB_PhotoDTO {
	
	private int no;
	private String photo;
	private String uploaddate;
	private int rec_count;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	public int getRec_count() {
		return rec_count;
	}
	public void setRec_count(int rec_count) {
		this.rec_count = rec_count;
	}


}
