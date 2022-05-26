package com.spring.dooboo.domain;

public class DB_RecDTO {
	
	private int photonum; 
	private String recommender;
	private int recyn;  //1 : 추천 0: 추천 X  
	
	
	
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

	
	
	
	
}
