package com.spring.dooboo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.dooboo.domain.DB_RecDTO;
import com.spring.dooboo.service.DB_RecService;


@RestController
public class DB_RecController {
	
	@Autowired DB_RecService service;

	//처음 추천을 할 경우의 메서드
	@PostMapping("/rec")
	public ResponseEntity<Integer>insertRec(@RequestBody DB_RecDTO dto, HttpSession session){
	    String recommender =(String)session.getAttribute("id");
		dto.setRecommender(recommender);
	    try {
	    	int count = 0;
	    	if(count == service.retrieveCount(dto)) {
	    		dto.setRecyn(1);
	    		int insResult = service.insertRec(dto);
	    		if(insResult != 1)
					throw new Exception("Recommend Failed");
	    	}else {
	    	
		    	int result = service.retrieveRecYn(dto);
		    	if(1 == result) {
		    		dto.setRecyn(0);
		    		service.updateRec(dto);
		    	}else{
		    		dto.setRecyn(1);
		    		service.updateRec(dto);
		    	}
	    	}
	    	
			return new ResponseEntity<>(dto.getRecyn(), HttpStatus.OK); 	
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(dto.getRecyn(), HttpStatus.BAD_REQUEST);
		
		}
		
	}
	
}
