package com.spring.dooboo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UpdateProfilePhotoController {

	@GetMapping("/updateProfilePhoto")
	public String updateProfilePhoto() {

		return "updateProfilePhoto";
		
		
	}
	

}
