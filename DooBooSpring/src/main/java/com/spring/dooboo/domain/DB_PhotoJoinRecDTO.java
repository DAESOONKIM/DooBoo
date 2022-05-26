package com.spring.dooboo.domain;


public class DB_PhotoJoinRecDTO {
	
	private int no;
	private int photonum;
	private String recommender;
	private int recyn;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPhotonum() {
		return photonum;
	}
	public void setPhotonum(int photonum) {
		this.photonum = photonum;
	}
	public String getRecommender() {
		return recommender;
	}
	public void setRecommender(String recommender) {
		this.recommender = recommender;
	}
	public int getRecyn() {
		return recyn;
	}
	public void setRecyn(int recyn) {
		this.recyn = recyn;
	}
	@Override
	public String toString() {
		return "DB_PhotoJoinRecDTO [no=" + no + ", photonum=" + photonum + ", recommender=" + recommender + ", recyn="
				+ recyn + "]";
	}
	
	
	
}
