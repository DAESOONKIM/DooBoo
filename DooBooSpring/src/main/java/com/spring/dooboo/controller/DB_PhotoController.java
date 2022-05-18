package com.spring.dooboo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.dooboo.domain.DB_PhotoDTO;
import com.spring.dooboo.domain.PageHandler;
import com.spring.dooboo.domain.SearchCondition;
import com.spring.dooboo.service.DB_PhotoService;


@Controller
@RequestMapping("/photo")
public class DB_PhotoController {

	@Autowired
	DB_PhotoService service;
	
	@GetMapping("/photo")
	public String dbPhoto(Model m, SearchCondition sc) {
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

		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg","LIST_ERR");
			m.addAttribute("totalCnt", 0);
		}
		
		 
				
		return "photo";
		
	}
	
	
	
}
