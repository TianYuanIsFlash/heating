package com.ibmetp.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ibmetp.dao.IHot_userDao;
import com.ibmetp.entity.Hot_cost;
import com.ibmetp.entity.Hot_permission;
import com.ibmetp.entity.Hot_user;
import com.ibmetp.entity.Hot_village;
import com.ibmetp.entity.Hot_village_detail;
import com.ibmetp.service.IHot_userService;

public class Hot_userServiceImpl implements IHot_userService {
	
	private IHot_userDao hot_userDao;
	
	

	public IHot_userDao getHot_userDao() {
		return hot_userDao;
	}



	public void setHot_userDao(IHot_userDao hot_userDao) {
		this.hot_userDao = hot_userDao;
	}



	@Override
	public void insertHot_user(Hot_user hot_user) throws Exception {
		//用日期生成一个不重复的用户编号
		Calendar calendar = Calendar.getInstance();
		String user_code = String.valueOf(calendar.get(Calendar.YEAR))+String.valueOf(calendar.get(Calendar.MONTH))+String.valueOf(calendar.get(Calendar.DATE))+String.valueOf(calendar.get(Calendar.SECOND))+String.valueOf(calendar.get(Calendar.MINUTE));
		hot_user.setUser_code(user_code);
		//用日期生成一个不重复的房间编号
		String code = String.valueOf(calendar.get(Calendar.DATE))+String.valueOf(calendar.get(Calendar.SECOND))+String.valueOf(calendar.get(Calendar.MINUTE))+String.valueOf(calendar.get(Calendar.YEAR))+String.valueOf(calendar.get(Calendar.MONTH));
		hot_user.setRoom_code(code);
		
		//获取当前时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String sdf = df.format(new Date());// new Date()为获取当前系统时间
		java.util.Date  date  =  new SimpleDateFormat("yyyy-MM-dd").parse(sdf);
		java.sql.Date  sqlDate  =  new java.sql.Date(date.getTime());
		hot_user.setJoin_date(sqlDate);
	    //设置性别
		String sex = hot_user.getSex();
		if(sex.equals("man")){
			hot_user.setSex("男");
		}
			
		if(sex.equals("woman")){
			hot_user.setSex("女");
		}
		hot_userDao.insertHot_user(hot_user);

	}



	@Override
	public void insertHot_village(Hot_village hot_village) throws Exception {
		//用日期生成一个不重复的小区编号
		Calendar calendar = Calendar.getInstance();
		String code = String.valueOf(calendar.get(Calendar.MINUTE))+String.valueOf(calendar.get(Calendar.YEAR))+String.valueOf(calendar.get(Calendar.MONTH))+String.valueOf(calendar.get(Calendar.DATE))+String.valueOf(calendar.get(Calendar.SECOND));
		hot_village.setCode(code);
		
		//用日期生成一个不重复的小区id
		String numId = String.valueOf(calendar.get(Calendar.SECOND))+String.valueOf(calendar.get(Calendar.MINUTE))+String.valueOf(calendar.get(Calendar.MONTH))+String.valueOf(calendar.get(Calendar.DATE));
		
		int id = Integer.parseInt(numId);
		hot_village.setId(id);
		
		//小区供暖情况
		hot_village.setState("P");
		
		hot_userDao.insertHot_village(hot_village);
		
	}



	@Override
	public void insertHot_village_detail(Hot_village_detail hot_village_detail)
			throws Exception {
		
		hot_village_detail.setState("办理中");
		hot_userDao.insertHot_village_detail(hot_village_detail);
		
	}



	@Override
	public void insertHot_cost(Hot_cost hot_cost) throws Exception {
		//用日期生成一个不重复的费用编号
		Calendar calendar = Calendar.getInstance();
		String code = String.valueOf(calendar.get(Calendar.MONTH)+1)+String.valueOf(calendar.get(Calendar.MINUTE))+String.valueOf(calendar.get(Calendar.YEAR))+String.valueOf(calendar.get(Calendar.DATE))+String.valueOf(calendar.get(Calendar.SECOND));
		hot_cost.setCost_code(code);
		
		//获取当前时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String sdf = df.format(new Date());// new Date()为获取当前系统时间
		java.util.Date  date  =  new SimpleDateFormat("yyyy-MM-dd").parse(sdf);
		java.sql.Date  sqlDate  =  new java.sql.Date(date.getTime());
		hot_cost.setUpdate_date(sqlDate);
		
		hot_userDao.insertHot_cost(hot_cost);
		
	}
	
	@Override
	public Map queryHot_user(long id) throws Exception {
		List<Map> list = hot_userDao.queryHot_user(id);
		Map user=null;
		if(list.size()>0){
			user = list.get(0);
		}		
		return user;
	}
	
	@Override
	public void editHot_user(Hot_user hot_user) throws Exception {
		hot_userDao.editHot_user(hot_user);
		
	}
	
	@Override
	public Map queryHot_cost(long id) throws Exception {
		List<Map> list = hot_userDao.queryHot_cost(id);
		Map cost=null;
		if(list.size()>0){
			cost = list.get(0);
		}		
		return cost;
	}
	
	
	@Override
	public List<Map> queryHot_village() throws Exception {
		List<Map> list = hot_userDao.queryHot_village();
		return list;
	}
	
	@Override
	public List<Map> queryHot_userAll() throws Exception {
		// TODO Auto-generated method stub
		return hot_userDao.queryHot_userAll();
	}
	
	@Override
	public List<Map> queryHot_village_sosuo(String vname) throws Exception {
		// TODO Auto-generated method stub
		return hot_userDao.queryHot_village_sosuo(vname);
	}
	
	@Override
	public List<Map> queryHot_userAll_sosuo(String uname) throws Exception {
		// TODO Auto-generated method stub
		return hot_userDao.queryHot_userAll_sosuo(uname);
	}
	
	@Override
	public void deleteAll(Hot_user u, Hot_cost c, Hot_village_detail hd) throws Exception {
		hot_userDao.deleteAll(u, c, hd);
		
	}
	
	@Override
	public List<Map> queryHot_costAll() {
		
		return hot_userDao.queryHot_costAll();
	}
	
	@Override
	public void insertHot_permission(Hot_permission p) throws Exception {
		hot_userDao.insertHot_permission(p);
		
	}
	
	@Override
	public List<Map> queryHot_permission() throws Exception{
		
		return hot_userDao.queryHot_permission();
	}
	
	@Override
	public List<Map> queryHot_village_state(String state) throws Exception {
		// TODO Auto-generated method stub
		return hot_userDao.queryHot_village_state(state);
	}
	
	
	@Override
	public List<Map> queryHot_costAllBTN(double amount) throws Exception{
		// TODO Auto-generated method stub
		return hot_userDao.queryHot_costAllBTN(amount);
	}
	
	
	@Override
	public void editHot_permission(Hot_permission p) throws Exception {
		hot_userDao.editHot_permission(p);
		
	}
	
	@Override
	public List<Map> queryHot_permission_login(String account) throws Exception {
		// TODO Auto-generated method stub
		return hot_userDao.queryHot_permission_login(account);
	}
	
	@Override
	public List<Map> queryHot_employee_emp() throws Exception {
		// TODO Auto-generated method stub
		return hot_userDao.queryHot_employee_emp();
	}
	
	@Override
	public List<Map> queryHot_employee_engineer() throws Exception {
		// TODO Auto-generated method stub
		return hot_userDao.queryHot_employee_engineer();
	}
	
	@Override
	public void updateHot_cost(Hot_cost hot_cost) throws Exception {
		hot_userDao.updateHot_cost(hot_cost);		
	}
	
	@Override
	public List<Map> queryHot_costAll_name(String username) {
		// TODO Auto-generated method stub
		return hot_userDao.queryHot_costAll_name(username);
	}
}
