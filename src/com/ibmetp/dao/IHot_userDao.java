package com.ibmetp.dao;

import java.util.List;
import java.util.Map;

import com.ibmetp.entity.Hot_cost;
import com.ibmetp.entity.Hot_permission;
import com.ibmetp.entity.Hot_user;
import com.ibmetp.entity.Hot_village;
import com.ibmetp.entity.Hot_village_detail;

public interface IHot_userDao {
	//apply.jsp注册的信息插入以下表中
	public void insertHot_user(Hot_user hot_user) throws Exception;
	public void insertHot_village(Hot_village hot_village) throws Exception;
	public void insertHot_village_detail(Hot_village_detail hot_village_detail) throws Exception;
	public void insertHot_cost(Hot_cost hot_cost) throws Exception;
	//messageChange.jsp根据身份证号码查询个人信息
	public List<Map> queryHot_user(long id) throws Exception;
	//messageChange.jsp根据查到的信息修改信息
	public void editHot_user(Hot_user hot_user) throws Exception;
	
	//charge.jsp根据身份证号码查询个人信息
	public List<Map> queryHot_cost(long id) throws Exception;
	
	//reportDetail.jsp查询小区
	public List<Map> queryHot_village() throws Exception;
	
	//reportDetail.jsp查询用户的详细信息
	public List<Map> queryHot_userAll() throws Exception;
	
	
	//reportDetail.jsp搜索小区的名字
	public List<Map> queryHot_village_sosuo(String vname) throws Exception;
	
	//reportDetail.jsp查询用户的详细信息
	public List<Map> queryHot_userAll_sosuo(String uname) throws Exception;
	
	//quit.jsp清除用户信息
	public void deleteAll(Hot_user u,Hot_cost c,Hot_village_detail hd) throws Exception;
	
	//costAll.jsp查询费用的所有信息
	public List<Map> queryHot_costAll();
	public List<Map> queryHot_costAll_name(String username);
	
	//createUser.jsp注册的信息插入以下表中
	public void insertHot_permission(Hot_permission p) throws Exception;
	
	//distribution.jsp显示更改注册的信息
	public List<Map> queryHot_permission() throws Exception;
	
	//reportDetail.jsp
	public List<Map> queryHot_village_state(String state) throws Exception;
	
	//costAll.jsp查询费用的所有信息
	public List<Map> queryHot_costAllBTN(double amount) throws Exception;
	
	//权限更改
	public void editHot_permission(Hot_permission p) throws Exception;
	
	//index.html登录验证
	public List<Map> queryHot_permission_login(String account) throws Exception;
	
	//人员管理-业务员
    public List<Map> queryHot_employee_emp() throws Exception;
    //人员管理-工程师
    public List<Map> queryHot_employee_engineer() throws Exception;
    
    
    //更新费用
    public void updateHot_cost(Hot_cost hot_cost) throws Exception;
    
    

}
