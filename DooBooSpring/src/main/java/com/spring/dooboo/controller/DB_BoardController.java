package com.spring.dooboo.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dooboo.dao.DB_MemberDAO;
import com.spring.dooboo.domain.DB_BoardDTO;
import com.spring.dooboo.domain.DB_MemberDTO;
import com.spring.dooboo.domain.PageHandler;
import com.spring.dooboo.domain.SearchCondition;
import com.spring.dooboo.service.DB_BoardService;
import com.spring.dooboo.service.DB_Board_CommentService;


@Controller
@RequestMapping("/board")
public class DB_BoardController {
	
	@Autowired
	DB_BoardService service;
	@Autowired 
	DB_MemberDAO mdao;
	@Autowired
	DB_Board_CommentService comment_Service;
	
	@GetMapping("/home")
	public String goHome() {
		
		
		return "main";
	}
	@PostMapping("/delete")
	public String deleteBoard(Model m, Integer num, String password, HttpServletRequest request, RedirectAttributes rattr ) {
	
		
		try {
			DB_BoardDTO board = service.selectInfo(num);
			
			if(!password.equals(board.getPassword())) {
				 rattr.addFlashAttribute("msg","PASS_ERR");
				 String referer = request.getHeader("Referer");
				  return "redirect:"+ referer;
			}
			int result = service.deleteBoard(num);
			if(result != 1) {
				throw new Exception("Modify failed");
			}
			 rattr.addFlashAttribute("msg","DEL_OK");

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/board/list";
		
	}
	
	
	
	@GetMapping("/delete")
	public String deleteBoardForm(Model m, Integer num, String writer, HttpSession session,HttpServletRequest request, RedirectAttributes rattr) {
		String id = (String)session.getAttribute("id");
		if(!writer.equals(id) ) {
			 rattr.addFlashAttribute("msg","DEL_ONLY");
			 String referer = request.getHeader("Referer");
			  return "redirect:"+ referer;
		}
		
		m.addAttribute("num",num);
		return "freeBoardDeleteForm";
		
	}
	
	
	@GetMapping("/modify")
	public String modifyBoardForm(Integer num,Model m, SearchCondition sc, String writer,HttpServletRequest request, HttpSession session, 
								RedirectAttributes rattr) {
		String id = (String)session.getAttribute("id");
		if(!writer.equals(id) ) {
			 rattr.addFlashAttribute("msg","WRT_ONLY");
			 String referer = request.getHeader("Referer");
			  return "redirect:"+ referer;
		}

		m.addAttribute("mode", "modify");
		m.addAttribute("sc",sc);
		m.addAttribute("num",num);
		return "freeBoardUpdateForm";
	}
	@PostMapping("modify")
	public String modifyBoard(Model m, DB_BoardDTO dto, SearchCondition sc, RedirectAttributes rattr, HttpServletRequest request) {
		rattr.addFlashAttribute("msg","MOD_OK");

		try {
			DB_BoardDTO board = service.selectInfo(dto.getNum());
			System.out.println("passoword = " + board.getPassword());
			if(!dto.getPassword().equals(board.getPassword())) {
				rattr.addFlashAttribute("msg","PASS_ERR");
				 String referer = request.getHeader("Referer");
				  return "redirect:"+ referer;
			}

			m.addAttribute("board",board);

			
			int result = service.updateBoard(dto);
			if(result != 1) {
				throw new Exception("Modify failed");
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		return "redirect:/board/list" + sc.getQueryString(); 
	}
	
	
	
	
	
	@GetMapping("/read")
	public String infoBoard(SearchCondition sc, Integer num, Model m , HttpSession session, HttpServletResponse response, HttpServletRequest request) {
		String id = (String)session.getAttribute("id");
		m.addAttribute("mode","read");
		try {
		
			
			//<------ 조회수 증가 중복 방지 위한 쿠키 셋팅	
			 Cookie[] cookies = request.getCookies();
			 int visitor = 0;
			 
			 for(Cookie cookie : cookies) {
				 System.out.println(cookie.getName());	 
				 if(cookie.getName().equals(String.valueOf(num))) {
					 
					 visitor = 1;
					
					 if(!cookie.getValue().contains(id)) {
						 
						 cookie.setValue(cookie.getValue()+"_"+ id);
						 cookie.setMaxAge(60);   //60초 후 쿠키 삭제	 
						 response.addCookie(cookie);
						 service.updateReadcount(num);  // 조회수 증가 쿼리
					 }
				 }
			 }
			 if(visitor == 0) {
				 Cookie cookie = new Cookie(String.valueOf(num),id);
				 cookie.setMaxAge(60);  //60초 후 쿠키 삭제
				 response.addCookie(cookie);
				 service.updateReadcount(num);  // 조회수 증가 쿼리
			 }
			 //--------------->
			
			int totalCnt = comment_Service.countComment(num); // 해당 게시글 총 댓글 갯수
			System.out.println("해당 게시글의 댓글 수 = " + totalCnt);
			m.addAttribute("totalCnt", totalCnt);

			DB_BoardDTO board = service.selectInfo(num);
			m.addAttribute("board",board);
			m.addAttribute("sc", sc);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "freeBoardInfo";
	}
	
	@PostMapping("/write")
	public String writeBoard(DB_BoardDTO dto,String password_chk ,Model m, HttpSession session, RedirectAttributes rattr){
		String writer = (String)session.getAttribute("id");
		m.addAttribute("mode", "write");
		if(!dto.getPassword().equals(password_chk)) {
			rattr.addFlashAttribute("msg","PASS_ERR");
			return "redirect:/board/write";
		}
		
		DB_MemberDTO member = new DB_MemberDTO();
		
		try {
			
			member = mdao.LoginMember(writer);
			dto.setWrite(member.getId());
			dto.setEmail(member.getEmail());
			
			int result = service.writeBoard(dto);
			if(result != 1) {
				throw new Exception("Write failed");
			}
			rattr.addFlashAttribute("msg","WRT_OK"); //1회성 저장
			return "redirect:/board/list";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("dto",dto);
			m.addAttribute("msg","WRT_ERR");
		}
		
		return "freeBoardList";
	}	
	@GetMapping("/write")
	public String writeForm(Model m) {
		m.addAttribute("mode", "write");
		return "freeBoardForm";
	}
	@GetMapping("/list")
	public String boardList(Model m,SearchCondition sc) {
		
		sc.setStartRow(1);
		sc.setEndRow(10);
		sc.setPageSize(10);
		System.out.println(sc.toString());
		try {
			int totalCnt = service.count(sc);
			m.addAttribute("totalCnt", totalCnt);
			PageHandler pageHandler = new PageHandler(totalCnt,sc, 5);
			
			List<DB_BoardDTO> dto = service.boardList(sc);
			m.addAttribute("dto", dto);
			m.addAttribute("ph", pageHandler);
		
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("msg","LIST_ERR");
			m.addAttribute("totalCnt", 0);
			
		}
		return "freeBoardList";
	}
	
}
