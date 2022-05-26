package com.spring.dooboo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dooboo.domain.DB_PhotoDTO;
import com.spring.dooboo.domain.DB_PhotoJoinRecDTO;
import com.spring.dooboo.domain.PageHandler;
import com.spring.dooboo.domain.SearchCondition;
import com.spring.dooboo.service.DB_PhotoService;
import com.spring.dooboo.service.DB_RecService;


@Controller
@RequestMapping("/photo")
public class DB_PhotoController {

	DB_PhotoService service;
	
	@Autowired
	public DB_PhotoController(DB_PhotoService service, DB_RecService recService) {
		this.service = service;
	}




	@GetMapping("/photo")
	public String dbPhoto(Model m, SearchCondition sc, HttpSession session) {
		String id = (String)session.getAttribute("id");
		sc.setStartRow(1);
		sc.setEndRow(4);
		sc.setPageSize(4);
		try {
			int totalCnt = service.count(); 
		
			m.addAttribute("totalCnt", totalCnt);
			System.out.println("sc = " + sc.toString());
			PageHandler pageHandler = new PageHandler(totalCnt,sc,2);

			List<DB_PhotoDTO> dto = service.selectAllPhoto(sc); 
			m.addAttribute("v",dto);
			m.addAttribute("ph", pageHandler);
			
			List<DB_PhotoJoinRecDTO> photoJoinRecDTOList = service.retrieveRecRslt(id); 
			m.addAttribute("rec",photoJoinRecDTOList);
			List<DB_PhotoJoinRecDTO> photoJoinRecDTOList2 = service.retrieveRecRsltN(id); 
			m.addAttribute("rec2",photoJoinRecDTOList2);
			List<DB_PhotoDTO> dto2 = service.retrieveNoRecPhotonum(id);
			m.addAttribute("photonum",dto2);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg","LIST_ERR");
			m.addAttribute("totalCnt", 0);
		}
		
		 
				
		return "photo";
		
	}
	
	
	
}
