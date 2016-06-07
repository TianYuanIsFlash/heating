package com.ibmetp.entity;

import java.sql.Date;

public class Hot_user {
	
	
	private String user_name;
	private long id_num;
	private String sex;
	private long telephone_no;
	private String user_adress;
	private String room_code;
	private String user_code;
	private Date join_date;
	
	
	
	
	
	public long getId_num() {
		return id_num;
	}





	public void setId_num(long id_num) {
		this.id_num = id_num;
	}





	public long getTelephone_no() {
		return telephone_no;
	}





	public void setTelephone_no(long telephone_no) {
		this.telephone_no = telephone_no;
	}





	public Hot_user() {
		// TODO Auto-generated constructor stub
	}

	

	

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	

	

	public String getUser_adress() {
		return user_adress;
	}

	public void setUser_adress(String user_adress) {
		this.user_adress = user_adress;
	}

	public String getRoom_code() {
		return room_code;
	}

	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
}
