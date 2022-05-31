package com.spring.dooboo.domain;

import org.springframework.web.multipart.MultipartFile;

public class ProfilePhotoDTO {
	
	private String userId;
	private MultipartFile profilePhoto;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public MultipartFile getProfilePhoto() {
		return profilePhoto;
	}
	public void setProfilePhoto(MultipartFile profilePhoto) {
		this.profilePhoto = profilePhoto;
	}
	

	
	
}
