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
    //����ҳ������࣬�������ﱣ֤��һ��ʵ�������Բ��س�ʼ��inputResult�Ľ�����Ӷ���֤���·�ҳ��Ч��
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
			//������ƺõķ�ҳЧ��
			list = empPage.getPage(list);
			//�����ҳ������
			mapPage = empPage.getMapPage();
			//��õ�ǰҳ������
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
			//������ƺõķ�ҳЧ��
			list = empPage.getPage(list);
			//�����ҳ������
			mapPage = empPage.getMapPage();
			//��õ�ǰҳ������
			inputResult = empPage.getInputResult();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return "error";
		}
		return "repair";
	}
}
