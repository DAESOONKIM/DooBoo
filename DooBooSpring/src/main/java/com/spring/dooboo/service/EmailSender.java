package com.spring.dooboo.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.InternetAddress; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.spring.dooboo.domain.Email;

@Service
public class EmailSender {
	
	@Autowired
    protected JavaMailSender mailSender;
    public void SendEmail(Email email) throws Exception{
        
        MimeMessage msg = mailSender.createMimeMessage();
        try{
            msg.setSubject(email.getSubject());
            msg.setText("내용 : " + email.getContent()+System.lineSeparator()+
            			"이름 : " + email.getName()+System.lineSeparator()+
            			"연락처 : " + email.getNumber());
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
            
        }catch(MessagingException e){  
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        
        try{
            mailSender.send(msg);
        }catch(MailException e){
            System.out.println("MailException 발생");
            e.printStackTrace();
        }
        
    }

}
