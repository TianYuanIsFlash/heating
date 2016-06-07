package com.ibmetp.action;

import java.util.List;
import java.util.Map;

import com.ibmetp.service.impl.Hot_userServiceImpl;
import com.pub.met.Pages;

public class PersonManagerAction {
	
    private Hot_userServiceImpl service;
    private List<Map> list;
    private Map mapPage=null;
    private int inputResult = -1;
    //调用页码设计类，放在这里保证是一个实例，可以不必初始化inputResult的结果，从而保证上下翻页的效果
    Pages empPage = new Pages();
 

	public int getInputResult() {
		return inputResult;
	}

	public void setInputResult(int inputResult) {
		this.inputResult = inputResult;
	}

	public Map getMapPage() {
		return mapPage;
	}

	public void setMapPage(Map mapPage) {
		this.mapPage = mapPage;
	}

	public List<Map> getList() {
		return list;
	}

	public void setList(List<Map> list) {
		this.list = list;
	}

	public Hot_userServiceImpl getService() {
		return service;
	}

	public void setService(Hot_userServiceImpl service) {
		this.service = service;
	}
	
	public String emp(){
		//list = new ArrayList();
		try {
			//list.clear();
			list = service.queryHot_employee_emp();			
			//调用设计好的分页效果
			list = empPage.getPage(list);
			//获得总页数属性
			mapPage = empPage.getMapPage();
			//获得当前页数属性
			inputResult = empPage.getInputResult();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return "error";
		}
		return "emp";
	}
	
	public String repair(){
		//list = new ArrayList();
		try {
			//list.clear();
			list = service.queryHot_employee_engineer();
			//调用设计好的分页效果
			list = empPage.getPage(list);
			//获得总页数属性
			mapPage = empPage.getMapPage();
			//获得当前页数属性
			inputResult = empPage.getInputResult();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return "error";
		}
		return "repair";
	}
}
