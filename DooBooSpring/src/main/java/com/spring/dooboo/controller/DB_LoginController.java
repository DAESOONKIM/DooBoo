package com.spring.dooboo.controller;



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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dooboo.dao.DB_MemberDAO;
import com.spring.dooboo.domain.DB_MemberDTO;



 

@Controller
@RequestMapping("/login")
public class DB_LoginController {

	@Autowired 
	DB_MemberDAO dao;
	
	
	@GetMapping("/passwordChangeForm")
	@ResponseBody
	public String passwordChangeForm() {
		
		return "OK";
		
	}
	
	@PostMapping("/passwordUpdate")
	public String passwordChage(HttpSession session, String password, String password_ck, HttpServletRequest request,RedirectAttributes rattr) {
		String id = (String)session.getAttribute("id");
		DB_MemberDTO member = new DB_MemberDTO();
		int count = 1;
		if(password.equals(password_ck)) {	
			try {
				member = dao.LoginMember(id);
				if(password.equals(member.getPassword())) {
					 rattr.addFlashAttribute("passMsg","PASS_SAME");
					 String referer = request.getHeader("Referer");
					 return "redirect:"+ referer;
				}
		
				int result = dao.updatePassword(id, password); 
				if(count == result) {
					rattr.addFlashAttribute("passMsg", "PASS_CHANGE_OK");
					// 1. 세션을 종료
			        session.invalidate(); 
			       
				}else {
					throw new Exception("Password Change failed");
				}
			}catch (Exception e) {
				e.printStackTrace();
			
			}
			// 2. 홈으로 이동
	        return "redirect:/login/login";
		}else {
		 rattr.addFlashAttribute("passMsg","PASS_CHANGE_ERR");
		 String referer = request.getHeader("Referer");
		 return "redirect:"+ referer;
		}
	
	}
	
	
	
	@GetMapping("/passwordUpdate")
	public String passwordModForm(Model m ,HttpSession session) {
		String id = (String)session.getAttribute("id");
		DB_MemberDTO member = new DB_MemberDTO();
		
		try {
			member = dao.LoginMember(id);
			m.addAttribute("member",member);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "passwordUpdateForm";
	}
	
	@PostMapping("/profileForm")
	public String myProfileUpdate(DB_MemberDTO dto ,RedirectAttributes rattr) {
		
		int count = 1;
		
		try {
			
			int result = dao.updateMember(dto);
			if(count == result) {
				rattr.addFlashAttribute("validateMsg","success");
				return "redirect:/login/profile";
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		 rattr.addFlashAttribute("validateMsg","fail");
		 return "redirect:/login/profile";
		
	}
	
	
	
	
	
	@GetMapping("/profileForm")
	public String myProfileUpdateForm(Model m, HttpSession session) {
		String id = (String) session.getAttribute("id");
		DB_MemberDTO member = new DB_MemberDTO();
		m.addAttribute("mode","modify");
		
		try {
			member = dao.LoginMember(id);
			m.addAttribute("member", member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "myProfile" ;
	}
	
	
	//My profile로 이동
	@GetMapping("/profile")
	public String myProfile(Model m, HttpSession session ) {
		String id = (String)session.getAttribute("id");
		DB_MemberDTO member = new DB_MemberDTO();
		try {
			
			member = dao.LoginMember(id);
			String address = member.getZonecode();
			 	   address += " "+ member.getAddress();
			 	   address += " "+ member.getAddressdetail();
			member.setAddress(address);
			
			
			m.addAttribute("member",member);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "myProfile" ;
	}
	
	
	
	@PostMapping("/joinIdChk")
	@ResponseBody
	public String joinIdChk(String joinId) {
		
		System.out.println("중복 CHK 아이디 : " +joinId );
		try {
			int result = dao.joinIdChk(joinId);
			if(result != 0) {
				return "fail"; //중복아이디 존재
			}
			
		} catch (Exception e) {
			 e.printStackTrace(); 
		}
		
		return "success" ;
		
	}	
	
	
	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}
	@GetMapping("/logout")
	  public String logout(HttpSession session) {
        // 1. 세션을 종료
        session.invalidate();
        // 2. 홈으로 이동
        return "redirect:/";
    }
	@PostMapping("login")
	public String login(String id, String password,Model m, String toURL, boolean rememberId,  HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1. id와 password를 확인
		if(!loginCheck(id,password)) {
			  m.addAttribute("msg", "id 또는 pwd가 일치하지 않습니다.");
			  return "login";
		}
		//2. id와 password가 일치하면
		 //  세션 객체를 얻어오기
        HttpSession session = request.getSession();
        //  세션 객체에 id를 저장
        session.setAttribute("id", id);
		
        if(rememberId) {
            //     1. 쿠키를 생성
            Cookie cookie = new Cookie("id", id); // ctrl+shift+o 자동 import
//		       2. 응답에 저장
            response.addCookie(cookie);
        } else {
            // 1. 쿠키를 삭제
            Cookie cookie = new Cookie("id", id); // ctrl+shift+o 자동 import
            cookie.setMaxAge(0); // 쿠키를 삭제
//		       2. 응답에 저장
            response.addCookie(cookie);
        }
//		       3. 홈으로 이동
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;
        return "redirect:"+toURL;
	
	
	}
	private boolean loginCheck(String id, String password) {
		DB_MemberDTO member = null;
		
		try {
			member = dao.LoginMember(id);
			if(!id.equals(member.getId())) {
				return false;
			}
		} catch (Exception e) {
			 e.printStackTrace(); 
	         return false;
		}
		return member != null && member.getPassword().equals(password); 
	}
	
	@GetMapping("/join")
	public String joinForm() {
		return "join";
	}
	@PostMapping("/join")
	public String join(DB_MemberDTO dto,HttpServletRequest request,Model m) {
		int result = 1;

		String email = "";
		
		if(dto.getSel_email() == "etc") {
			email = dto.getEmail();
			dto.setEmail(email);
		}else {
			email += dto.getEmail() + dto.getSel_email();
			dto.setEmail(email);
		}	
		
		try {
			if(result == dao.insertMember(dto)) {
				
				m.addAttribute("joinMsg","success");
			}else {
				m.addAttribute("joinMsg","fail");
				return "join";
			}

			
		} catch (Exception e) {
			 e.printStackTrace(); 
		}
		return "login";
		
	}
	
	
}