package com.spring.dooboo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.dooboo.domain.DB_Board_CommentDTO;
import com.spring.dooboo.service.DB_Board_CommentService;

@RestController
public class DB_Board_CommentController {
	
	@Autowired
	DB_Board_CommentService service;
	
	//댓글을 등록하는 메서드 
	@PostMapping("/comments")
	public ResponseEntity<String>writeComment(@RequestBody DB_Board_CommentDTO dto, Integer bno, HttpSession session){
		String commenter = (String) session.getAttribute("id");
		dto.setCommenter(commenter);
		dto.setBno(bno);
		
		try {
			if(service.wrtieComment(dto) != 1)
				throw new Exception("Write failed.");
			return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("WRT_ERR", HttpStatus.BAD_REQUEST);	
		}
		
	}
	//해당 게시글의 모든 댓글을 가져오는 메서드
	@GetMapping("/comments")
	public ResponseEntity<List<DB_Board_CommentDTO>> retrieveAllComments(Integer bno, Integer page){
		List<DB_Board_CommentDTO> list = null;
		
		int pageSize = 10;
		int startRow = (page-1)*pageSize + 1;
		int endRow = 10 * page;
		
		try {
			list = service.retrieveAllComment(bno,startRow,endRow);
			return new ResponseEntity<List<DB_Board_CommentDTO>>(list,HttpStatus.OK); //200
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<DB_Board_CommentDTO>>(HttpStatus.BAD_REQUEST); //400
			
		}
		
	}
	
	//댓글을 삭제하는 메서드 
	@DeleteMapping("/comments")
	public ResponseEntity<String>removeComment(Integer cno, Integer bno, HttpSession session){
		try {
			if(service.removeComment(cno, bno) != 1)
				throw new Exception("Delete Failed");

			return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	//댓글을 수정하는 메서드
	@PatchMapping("/comments")
	public ResponseEntity<String>updateCommt(@RequestBody DB_Board_CommentDTO dto){

		try {
			if(service.updateComment(dto) != 1)
				throw new Exception("Modify Failed");
			return new ResponseEntity<>("MOD_OK", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("MOD_ERR", HttpStatus.BAD_REQUEST);

		}
		
	}
	
	
}
