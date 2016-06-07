package com.ibmetp.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.ibmetp.dao.IHot_userDao;
import com.ibmetp.entity.Hot_cost;
import com.ibmetp.entity.Hot_permission;
import com.ibmetp.entity.Hot_user;
import com.ibmetp.entity.Hot_village;
import com.ibmetp.entity.Hot_village_detail;

public class Hot_userDaoImpl extends HibernateDaoSupport implements IHot_userDao{

	@Override
	public void insertHot_user(Hot_user hot_user) throws Exception {
		getHibernateTemplate().save(hot_user);
		
	}

	@Override
	public void insertHot_village(Hot_village hot_village) throws Exception {
		getHibernateTemplate().save(hot_village);
		
	}

	@Override
	public void insertHot_village_detail(Hot_village_detail hot_village_detail)
			throws Exception {
		getHibernateTemplate().save(hot_village_detail);
		
	}

	@Override
	public void insertHot_cost(Hot_cost hot_cost) throws Exception {
		getHibernateTemplate().save(hot_cost);
		
	}
	
	@Override
	public List<Map> queryHot_user(long id) throws Exception {
		
		return getHibernateTemplate().findByNamedQuery("selectHot_user",id);
	}
	
	
	@Override
	public void editHot_user(Hot_user hot_user) throws Exception {
		getHibernateTemplate().update(hot_user);
		
	}
	
	
	@Override
	public List<Map> queryHot_cost(long id) throws Exception {
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedQuery("selectHot_cost",id);
	}
	
	@Override
	public List<Map> queryHot_village() throws Exception {
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedQuery("selectHot_village");
	}
	
	@Override
	public List<Map> queryHot_userAll() throws Exception {
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedQuery("selectHot_userAll");
	}
	
	
	@Override
	public List<Map> queryHot_village_sosuo(String vname) throws Exception {
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedQuery("selectHot_village_sosuo",vname);
	}
	
	@Override
	public List<Map> queryHot_userAll_sosuo(String uname) throws Exception {
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedQuery("selectHot_userAll_sosuo",uname);
	}
	
	@Override
	public void deleteAll(Hot_user u, Hot_cost c, Hot_village_detail hd) throws Exception {
		getHibernateTemplate().delete(u);
		getHibernateTemplate().delete(c);
		getHibernateTemplate().delete(hd);
		
	}
	
	@Override
	public List<Map> queryHot_costAll() {
		
		return getHibernateTemplate().findByNamedQuery("selectHot_costAll");
	}
	
	@Override
	public void insertHot_permission(Hot_permission p) throws Exception {
		getHibernateTemplate().save(p);
		
	}
	
	@Override
	public List<Map> queryHot_permission() throws Exception{
		
		return getHibernateTemplate().findByNamedQuery("selectHot_permission");
	}
	
	
	@Override
	public List<Map> queryHot_village_state(String state) throws Exception {
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedQuery("selectHot_userAll_state",state);
	}
	
	@Override
	public List<Map> queryHot_costAllBTN(double amount) throws Exception{
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedQuery("selectHot_costAllBTN",amount);
	}
	
	
	@Override
	public void editHot_permission(Hot_permission p) throws Exception {
		getHibernateTemplate().update(p);
		
	}
	
	@Override
	public List<Map> queryHot_permission_login(String account) throws Exception {
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedQuery("selectHot_permission_login",account);
	}
	
	@Override
	public List<Map> queryHot_employee_emp() throws Exception {
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedQuery("selectHot_employee_emp");
	}
	
	@Override
	public List<Map> queryHot_employee_engineer() throws Exception {
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedQuery("selectHot_employee_engineer");
	}
	
	
	
	
	@Override
	public void updateHot_cost(Hot_cost hot_cost) throws Exception {
		getHibernateTemplate().update(hot_cost);
		
	}
	
	@Override
	public List<Map> queryHot_costAll_name(String username) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().findByNamedQuery("selectHot_costAllUsername",username);
	}

}
