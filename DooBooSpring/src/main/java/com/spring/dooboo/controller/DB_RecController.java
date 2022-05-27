package com.spring.dooboo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.dooboo.domain.DB_RecDTO;
import com.spring.dooboo.service.DB_PhotoService;
import com.spring.dooboo.service.DB_RecService;


@RestController
public class DB_RecController {
	
	 DB_RecService service;
	 DB_PhotoService photoService;	
	
	@Autowired
	public DB_RecController(DB_RecService service, DB_PhotoService photoService) {
		this.service = service;
		this.photoService = photoService;
	}

			
	
	//처음 추천을 할 경우의 메서드
	@PostMapping("/rec")
	public ResponseEntity<Integer>insertRec(@RequestBody DB_RecDTO dto, HttpSession session){
	    String recommender =(String)session.getAttribute("id");
		dto.setRecommender(recommender);
	    try {
	    	int count = 0;
	    	if(count == service.retrieveCount(dto)) {  //추천 이력이 없다면 
	    		dto.setRecyn(1);
	    		int insResult = service.insertRec(dto);
	    		int insRec_Cnt = photoService.updateAllRecPlus(dto.getPhotonum());
	    		if(insResult != 1 && insRec_Cnt != 1)
					throw new Exception("Recommend Failed");
	    	}else {
	    	
		    	int result = service.retrieveRecYn(dto);
		    	if(1 == result) {
		    		dto.setRecyn(0);
		    		int upRec_Cont = service.updateRec(dto);
		    		int insRec_Cnt = photoService.updateAllRecMinus(dto.getPhotonum());
		    		if(upRec_Cont != 1 && insRec_Cnt != 1) {
		    			throw new Exception("추천 카운트 감소 에러 발생");
		    		}
		    	}else{
		    		dto.setRecyn(1);
		    		int upRec_Cont = service.updateRec(dto);
		    		int insRec_Cnt = photoService.updateAllRecPlus(dto.getPhotonum());
		    		if(upRec_Cont != 1 && insRec_Cnt != 1) {
		    			throw new Exception("추천 카운트 증가 에러 발생");
		    		}
		    	}
	    	}
	    	
			return new ResponseEntity<>(dto.getRecyn(), HttpStatus.OK); 	
		} catch (Exception e) {
			e.printStackTrace();
			e.getMessage();
			return new ResponseEntity<>(dto.getRecyn(), HttpStatus.BAD_REQUEST);
		
		}
		
	}
	
}
