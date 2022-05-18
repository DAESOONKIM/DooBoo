package com.spring.dooboo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dooboo.domain.Email;
import com.spring.dooboo.service.EmailSender;

@Controller
public class EmailController {
	
	@Autowired
    private EmailSender emailSender;
    
	@GetMapping("/mail")
	public String sendEmailPage() {
		return "contact";
	}
	
	
	
    @PostMapping("/mail")
    public String sendEmailAction(Email emailDTO,RedirectAttributes rattr) throws Exception{
        
        System.out.println("Email Controller");
        
        Email email = new Email();
        try {
        	 email.setName(emailDTO.getName());
        	 email.setNumber(emailDTO.getNumber());
        	 email.setReceiver(emailDTO.getReceiver());
             email.setContent(emailDTO.getContent());
             email.setSubject(emailDTO.getSubject());
             rattr.addFlashAttribute("msg", "MAIL_SUCCESS");
            
             System.out.println("email information = " + email.toString());
             
             emailSender.SendEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
            rattr.addFlashAttribute("msg", "MAIL_FAIL");

		}
       
		return "redirect:/mail";
        
    }

}
