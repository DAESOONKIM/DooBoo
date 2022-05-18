package com.spring.dooboo.domain;

public class Email {
	
	private String name;
	private String subject;
	private String content;
	private String receiver;
	private String number;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "Email [name=" + name + ", subject=" + subject + ", content=" + content + ", receiver=" + receiver
				+ ", number=" + number + "]";
	}

		

}
