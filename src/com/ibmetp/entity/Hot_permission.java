package com.ibmetp.entity;

public class Hot_permission {
	
	private String account;
	private String password;
	private String type;
	
	public Hot_permission() {
		// TODO Auto-generated constructor stub
	}
	
	public Hot_permission(String acc,String pwd,String type) {
		this.account = acc;
		this.password = pwd;
		this.type = type;
	}
	
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	

}
