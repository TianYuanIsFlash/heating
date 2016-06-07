package com.ibmetp.entity;

import java.sql.Date;

public class Hot_cost {
	
	private String cost_code;
	private String room_code;
	private double amount;
	private double u_flow;
	private Date update_date;
	private double u_area;
	private double c_equipment;
	private double c_man;
	private double c_other;
	private String heating_cost_type;
	
	public Hot_cost() {
		// TODO Auto-generated constructor stub
	}
	
	public Hot_cost(String cost_code,String room_code,double amount,double u_flow,Date update_date,double u_area,double c_equipment,double c_man,double c_other,String heating_cost_type) {
		this.amount = amount;
		this.c_equipment = c_equipment;
		this.c_man = c_man;
		this.c_other = c_other;
		this.cost_code = cost_code;
		this.heating_cost_type = heating_cost_type;
		this.room_code = room_code;
		this.u_area = u_area;
		this.u_flow = u_flow;
		this.update_date = update_date;
		
	}
	
	public String getCost_code() {
		return cost_code;
	}
	public void setCost_code(String cost_code) {
		this.cost_code = cost_code;
	}
	public String getRoom_code() {
		return room_code;
	}
	public void setRoom_code(String room_code) {
		this.room_code = room_code;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getU_flow() {
		return u_flow;
	}
	public void setU_flow(double u_flow) {
		this.u_flow = u_flow;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public double getU_area() {
		return u_area;
	}
	public void setU_area(double u_area) {
		this.u_area = u_area;
	}
	public double getC_equipment() {
		return c_equipment;
	}
	public void setC_equipment(double c_equipment) {
		this.c_equipment = c_equipment;
	}
	public double getC_man() {
		return c_man;
	}
	public void setC_man(double c_man) {
		this.c_man = c_man;
	}
	public double getC_other() {
		return c_other;
	}
	public void setC_other(double c_other) {
		this.c_other = c_other;
	}
	public String getHeating_cost_type() {
		return heating_cost_type;
	}
	public void setHeating_cost_type(String heating_cost_type) {
		this.heating_cost_type = heating_cost_type;
	}
	
	

}
