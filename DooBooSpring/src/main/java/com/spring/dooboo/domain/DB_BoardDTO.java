package com.spring.dooboo.domain;

public class DB_BoardDTO {
	
	private int num;
	private String write;
	private String email;
	private String subject;
	private String password; 
	private String reg_date;
	private int readcount;
	private String content;
	private int commentcount;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWrite() {
		return write;
	}
	public void setWrite(String write) {
		this.write = write;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCommentcount() {
		return commentcount;
	}
	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}
	
	@Override
	public String toString() {
		return "DB_BoardDTO [num=" + num + ", write=" + write + ", email=" + email + ", subject=" + subject
				+ ", password=" + password + ", reg_date=" + reg_date + ", readcount=" + readcount + ", content="
				+ content + ", commentcount=" + commentcount + "]";
	}
	
	
	
}
