package com.ibmetp.service;

import java.util.List;
import java.util.Map;

import com.ibmetp.entity.Hot_cost;
import com.ibmetp.entity.Hot_permission;
import com.ibmetp.entity.Hot_user;
import com.ibmetp.entity.Hot_village;
import com.ibmetp.entity.Hot_village_detail;

public interface IHot_userService {
	
	public void insertHot_user(Hot_user hot_user) throws Exception;
	public void insertHot_village(Hot_village hot_village) throws Exception;
	public void insertHot_village_detail(Hot_village_detail hot_village_detail) throws Exception;
	public void insertHot_cost(Hot_cost hot_cost) throws Exception;
	
	public Map queryHot_user(long id) throws Exception;
	
	public void editHot_user(Hot_user hot_user) throws Exception;
	
	public Map queryHot_cost(long id) throws Exception;
	
	
	public List<Map> queryHot_village() throws Exception;
	
	//reportDetail.jsp��ѯ�û�����ϸ��Ϣ
	public List<Map> queryHot_userAll() throws Exception;
	
	//reportDetail.jsp����С��������
    public List<Map> queryHot_village_sosuo(String vname) throws Exception;
    
    //reportDetail.jsp��ѯ�û�����ϸ��Ϣ
  	public List<Map> queryHot_userAll_sosuo(String uname) throws Exception;
  	
    //quit.jsp����û���Ϣ
  	public void deleteAll(Hot_user u,Hot_cost c,Hot_village_detail hd) throws Exception;
  	
    //costAll.jsp��ѯ���õ�������Ϣ
  	public List<Map> queryHot_costAll();
  	public List<Map> queryHot_costAll_name(String username);
  	
    //distribution.jspע�����Ϣ�������±���
  	public void insertHot_permission(Hot_permission p) throws Exception;
  	
    //distribution.jsp��ʾ����ע�����Ϣ
  	public List<Map> queryHot_permission() throws Exception;
  	
    //reportDetail.jsp
  	public List<Map> queryHot_village_state(String state) throws Exception;
  	
  	
    //costAll.jsp��ѯ���õ�������Ϣ
  	public List<Map> queryHot_costAllBTN(double amount)throws Exception;
  	
    //Ȩ�޸���
  	public void editHot_permission(Hot_permission p) throws Exception;
  	
    //index.html��¼��֤
  	public List<Map> queryHot_permission_login(String account) throws Exception;
  	
    //��Ա����-ҵ��Ա
    public List<Map> queryHot_employee_emp() throws Exception;
    //��Ա����-����ʦ
    public List<Map> queryHot_employee_engineer() throws Exception;
    
    //���·���
    public void updateHot_cost(Hot_cost hot_cost) throws Exception;

}
