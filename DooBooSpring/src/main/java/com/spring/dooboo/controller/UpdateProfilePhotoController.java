package com.spring.dooboo.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.dooboo.service.ProfilePhotoService;




@Controller
public class UpdateProfilePhotoController {

	@Autowired
	ProfilePhotoService service;
	
	private String uploadFolder = "C:\\Users\\user\\git\\DooBoo\\DooBooSpring\\src\\main\\webapp\\resources\\img";	

	@GetMapping("/updateProfilePhoto")
	public String updateProfilePhotoForm(HttpSession session, Model m) {

		String id = (String) session.getAttribute("id");

		String profilePhoto;
		try {
			profilePhoto = service.rtrvPhotoName(id);
			m.addAttribute("profilePhoto", profilePhoto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
		return "updateProfilePhoto";
		
		
	}
	
	@PostMapping("/deleteProfilePhoto")
	public String deleteProfilePhoto(HttpSession session, Model m)  {  //프로필파일 삭제시
		
		String id = (String) session.getAttribute("id");
		
		try {
		
			String deleteFileName = service.rtrvPhotoName(id);
			File deleteFile = new File(uploadFolder+"\\"+deleteFileName);
			deleteFile.delete(); //이미지 삭제
			int result = service.deletePhoto(id);
			if(result == 0){
				throw new Exception("이미지 파일 삭제시 첫번째 오류 발생");
			}
			
			Map<String, String> map = new HashMap<>();
			map.put("userId", id); 
			map.put("profilePhoto", "noProfile.jpg"); //저장되는 파일명
			int result2 = service.insertPhoto(map);
			if(result2 == 0){
				throw new Exception("이미지 파일 삭제시 두번째 오류 발생");
			}
			
			String profilePhoto = service.rtrvPhotoName(id);
			m.addAttribute("profilePhoto", profilePhoto);
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
	
	
		return "main";
		
	}
	
	
	
	@PostMapping("/updateProfilePhoto")
	public String updateProfilePhoto(@RequestParam("profilePhoto") MultipartFile profilePhoto, HttpSession session, Model m) throws Exception {
	
		String id = (String) session.getAttribute("id");
		String path = session.getServletContext().getRealPath("/");
		System.out.println("path ::::: " + path);
		if(service.checkPhoto(id) == 0) {  //로그인 되어진 아이디의 사진이 없는 경우를 쿼리로 먼저 확인 후 사진 등록 후 DB insert 작업
			
		
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
			System.out.println("saveFile : "+savaFile);
			try {
				profilePhoto.transferTo(savaFile);  //이미지 저장
				Map<String, String> map = new HashMap<>();
				map.put("userId", id); 
				map.put("profilePhoto", uniqueName + fileExtension); //저장되는 파일명
				int result = service.insertPhoto(map);
				if(result == 0) {
					throw new Exception("이미지 업로드 에러 발생!!");
				}
				
				String insertPhoto = service.rtrvPhotoName(id);
				m.addAttribute("profilePhoto", insertPhoto);
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
			}
		
			return "main";
		}else { //사진이 있는 경우 사진을 삭제 후 새로 등록  사진 정보에 대한 DB는 업데이트
			
			String deleteFileName = service.rtrvPhotoName(id);
			File deleteFile = new File(uploadFolder+"\\"+deleteFileName);
			deleteFile.delete(); //이미지 삭제
			
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
			System.out.println("saveFile : "+savaFile);
			try {
				profilePhoto.transferTo(savaFile);  //이미지 저장
				
				Map<String, String> map = new HashMap<>();
				map.put("profilePhoto", uniqueName + fileExtension); //저장되는 파일명
				map.put("userId", id); 
				service.updatePhoto(map);

				String updatePhoto = service.rtrvPhotoName(id);
				m.addAttribute("profilePhoto", updatePhoto);
				
			} catch (Exception e) {
				e.printStackTrace();
				e.getMessage();
			}
		
			return "main";
			
			
		}
		
		
	}

}
