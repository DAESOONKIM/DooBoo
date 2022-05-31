package com.spring.dooboo.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;




@Controller
public class ProfilePhotoController {
	
 private String uploadFolder = "C:\\Users\\user\\git\\DooBoo\\DooBooSpring\\src\\main\\webapp\\resources\\img";
	
 @GetMapping("/upload")
	public String uploadForm() {
		return "uploadTest";
	}
	@PostMapping("/upload")
	public String uploadTest(@RequestParam("profilePhoto") MultipartFile profilePhoto, HttpSession session) throws Exception {
		
		String id = (String) session.getAttribute("id");
		
		String fileName = profilePhoto.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드
		long fileSize = profilePhoto.getSize();
		
		System.out.println("파일명 : " + fileName);
		System.out.println("파일사이즈 : " + fileSize);
	
		
		//서버에 지정할 파일 이름 fileextenson으로 .jsp이런식의 확장자 명을 구함
		String fileExtension = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		
		String png = ".png";
		String jpg = ".jpg";
		
		if(fileExtension.equals(png)) { //이미지 파일이 아닐 시 exception 처리
			System.out.println("이미지 OK");
		}else if(fileExtension.equals(jpg)){
			System.out.println("이미지 OK");
		}else {
			System.out.println("이미지가 아님");
			throw new Exception("이미지 파일이 아닙니다.");
		}
		
		
		
		/*
		  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
		  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
		  고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
		 */
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열 : "+ uniqueName);
		System.out.println("확장자명 : " + fileExtension);
		System.out.println("저장될 파일명 : "+ uniqueName + fileExtension);
		
		
		File savaFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);
		//savaFile.delete(); 파일삭제
		try {
			profilePhoto.transferTo(savaFile);
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		
		return "redirect:/";
		
	}
	
}
