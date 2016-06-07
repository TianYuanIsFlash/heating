package com.ibmetp.action;

import java.awt.Font;
import java.awt.RenderingHints;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.DefaultCategoryDataset;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.ibmetp.entity.Hot_cost;
import com.ibmetp.entity.Hot_permission;
import com.ibmetp.entity.Hot_user;
import com.ibmetp.entity.Hot_village;
import com.ibmetp.entity.Hot_village_detail;
import com.ibmetp.service.IHot_userService;
import com.pub.met.Pages;

public class ApplyAction {

	private IHot_userService hot_userService;
	private Hot_user hot_user;
	private Hot_user hot_user_quit;
	private Hot_village hot_village;
	private Hot_village_detail hot_village_detail;
	private Hot_cost hot_cost;
	private Map user=null;
	private List<Map>  list;
	private Map mapPage=null;
	private List<Map>  listUserAll;
	private Map cost=null;
	
	//调用页码设计类，放在这里保证是一个实例，可以不必初始化inputResult的结果，从而保证上下翻页的效果
    Pages empPage = new Pages();
	
    
	public Map getCost() {
		return cost;
	}
	public void setCost(Map cost) {
		this.cost = cost;
	}
	public Map getMapPage() {
		return mapPage;
	}
	public void setMapPage(Map mapPage) {
		this.mapPage = mapPage;
	}
	public List<Map> getListUserAll() {
		return listUserAll;
	}
	public void setListUserAll(List<Map> listUserAll) {
		this.listUserAll = listUserAll;
	}
	public List<Map> getList() {
		return list;
	}
	public void setList(List<Map> list) {
		this.list = list;
	}
	public Hot_user getHot_user_quit() {
		return hot_user_quit;
	}
	public void setHot_user_quit(Hot_user hot_user_quit) {
		this.hot_user_quit = hot_user_quit;
	}
	public Map getUser() {
		return user;
	}
	public void setUser(Map user) {
		this.user = user;
	}
	public Hot_village getHot_village() {
		return hot_village;
	}
	public void setHot_village(Hot_village hot_village) {
		this.hot_village = hot_village;
	}
	public Hot_village_detail getHot_village_detail() {
		return hot_village_detail;
	}
	public void setHot_village_detail(Hot_village_detail hot_village_detail) {
		this.hot_village_detail = hot_village_detail;
	}
	public Hot_cost getHot_cost() {
		return hot_cost;
	}
	public void setHot_cost(Hot_cost hot_cost) {
		this.hot_cost = hot_cost;
	}
	public IHot_userService getHot_userService() {
		return hot_userService;
	}
	public void setHot_userService(IHot_userService hot_userService) {
		this.hot_userService = hot_userService;
	}
	public Hot_user getHot_user() {
		return hot_user;
	}
	public void setHot_user(Hot_user hot_user) {
		this.hot_user = hot_user;
	}
	//登录
	public String login(){
        HttpServletRequest request = ServletActionContext.getRequest();		
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		List<Map> l = new ArrayList<Map>();
		Map m = new HashMap();
		try {
			l = hot_userService.queryHot_permission_login(user);
			m = l.get(0);
			String type = m.get("type").toString();
			String password = m.get("password").toString();
			if((type.contains("用户") || type.contains("普通")) && password.equals(pwd)){
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user);
				session.setAttribute("type", type);
				return "noadmin";
			}
			else if(type.contains("管理") && password.equals(pwd)){
				HttpSession session = request.getSession(true);
				session.setAttribute("user", user);
				session.setAttribute("type", type);
				return "admin";
			}else if(!type.contains("用户") && !type.contains("普通") && !type.contains("管理")){
				return "error";
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			return "error";
		}		
		return "error";
	}
	
	public String applyInsert(){
		
		try {
 		    hot_userService.insertHot_user(hot_user);
 		    hot_userService.insertHot_village(hot_village);
 		    
 		    //把用户表的房间编号传给小区详细表的房间编号
 		    hot_village_detail.setRoom_code(hot_user.getRoom_code());
 		    //把小区表的小区编号赋给小区详细表的小区编号	    
 		    hot_village_detail.setVillage_code(hot_village.getCode());
 		    hot_userService.insertHot_village_detail(hot_village_detail);
 		    
 		    //把用户表的房间编号传给费用表的房间编号
 		    hot_cost.setRoom_code(hot_user.getRoom_code());
 		    //计算暖气费用
 		    String type = hot_cost.getHeating_cost_type();
 		    if(type.equals("area")){//按面积
 		    	double area = hot_village_detail.getArea();//面积
 		    	double u_area = 7.50;//每平方米单价
 		    	hot_cost.setAmount(area*u_area);
 		    	hot_cost.setU_area(u_area);
 		    	hot_cost.setHeating_cost_type("面积");
 		    }
 		    if(type.equals("flow")){
 		    	double flow = 30.00;//按每月30吉焦
 		    	double u_flow = 36.00;//每吉焦单价
 		    	hot_cost.setAmount(flow*u_flow);
 		    	hot_cost.setU_flow(u_flow);
 		    	hot_cost.setHeating_cost_type("流量");
 		    	
 		    }
 		    hot_userService.insertHot_cost(hot_cost);
			return "success";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "error";
		}			
	}
	
	public void contract() throws IOException{
	
		String user = hot_user.getUser_name();
		String adress = hot_user.getUser_adress();
		int area = hot_village_detail.getArea();
		double charge = hot_cost.getAmount();
		long idno = hot_user.getId_num();
		long phoneno = hot_user.getTelephone_no();
		
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		json.put("idno", idno);
		json.put("phoneno", phoneno);
		json.put("area", area);
		json.put("charge", charge);
		json.put("adress", adress);
		json.put("user", user);
		array.add(json);
		
		JSONObject jsondata = new JSONObject();
		jsondata.put("array", array);
		JSONObject idnoJSON = new JSONObject();
		JSONObject phonenoJSON = new JSONObject();
		JSONObject userJSON = new JSONObject();
		JSONObject adressJSON = new JSONObject();
		JSONObject areaJSON = new JSONObject();
		JSONObject chargeJSON = new JSONObject();
		idnoJSON.put("idno", idno);
		phonenoJSON.put("phoneno", phoneno);
		areaJSON.put("area", area);
		chargeJSON.put("charge", charge);
		adressJSON.put("adress", adress);
		userJSON.put("user", user);
        //获得response对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");  
		PrintWriter out = response.getWriter();
		out.print(jsondata.toString());
		//out.print(userJSON.toString());
		/*
		 * out.print(json.toString());
		out.print(adressJSON.toString());
		out.print(areaJSON.toString());
		out.print(chargeJSON.toString());
		out.print(idnoJSON.toString());
		out.print(phonenoJSON.toString());*/
		out.close();	
	}
	
	public void messageChange(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String idString = request.getParameter("id");
		long id = Long.parseLong(idString);
		
		try {
			user = hot_userService.queryHot_user(id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		if(!user.isEmpty()){

			String user_name = user.get("user_name").toString();
			//hot_user.setUser_name(user_name);
			String id_num = user.get("id_num").toString();
			//hot_user.setId_num(Integer.parseInt(id_num));
			String sex = user.get("sex").toString();
			//hot_user.setSex(sex);
			String telephone_no =user.get("telephone_no").toString();
			//hot_user.setTelephone_no(Integer.parseInt(telephone_no));
			String user_adress = user.get("user_adress").toString();
			//hot_user.setUser_adress(user_adress);
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();
			json.put("user_name", user_name);
			json.put("id_num", id_num);
			json.put("sex", sex);
			json.put("telephone_no", telephone_no);
			json.put("user_adress", user_adress);
			array.add(json);
			JSONObject jsondata = new JSONObject();
			jsondata.put("array", array);
			//获得response对象
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");  
			PrintWriter out=null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(jsondata.toString());
			out.close();
			
		}
	}
	
	public void edituser_name(){
		try{
			Hot_user h = new Hot_user();
			//设置数据库读取的基础数据
			h.setUser_code(user.get("user_code").toString());
			h.setRoom_code(user.get("room_code").toString());
			h.setJoin_date((Date) user.get("join_date"));
			
			JSONObject json = new JSONObject();
			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			HttpServletRequest request = ServletActionContext.getRequest();
			
			String user_name = request.getParameter("user_name");
			String id_num = request.getParameter("id_num");
			String sex = request.getParameter("sex");
			String telephone_no = request.getParameter("telephone_no");
			String user_adress = request.getParameter("user_adress");
			//设置请求的基础数据
			h.setUser_name(user_name);
			h.setId_num(Long.parseLong(id_num));
			h.setSex(sex);
			h.setTelephone_no(Long.parseLong(telephone_no));
			h.setUser_adress(user_adress);

			json.put("user_name", user_name);
			
			hot_userService.editHot_user(h);
			out.print(json.toString());
			out.close();
		}catch(Exception e){
			e.printStackTrace();
			}
	}
	
	public void editid_num(){
		try{
			Hot_user h = new Hot_user();
			//设置数据库读取的基础数据
			h.setUser_code(user.get("user_code").toString());
			h.setRoom_code(user.get("room_code").toString());
			h.setJoin_date((Date) user.get("join_date"));
			
			JSONObject json = new JSONObject();
			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			HttpServletRequest request = ServletActionContext.getRequest();
			
			String user_name = request.getParameter("user_name");
			String id_num = request.getParameter("id_num");
			String sex = request.getParameter("sex");
			String telephone_no = request.getParameter("telephone_no");
			String user_adress = request.getParameter("user_adress");
			//设置请求的基础数据
			h.setUser_name(user_name);
			h.setId_num(Long.parseLong(id_num));
			h.setSex(sex);
			h.setTelephone_no(Long.parseLong(telephone_no));
			h.setUser_adress(user_adress);

			json.put("id_num", id_num);
			
			hot_userService.editHot_user(h);
			out.print(json.toString());
			out.close();
		}catch(Exception e){
			e.printStackTrace();
			}
	}
	
	public void editsex(){
		try{
			Hot_user h = new Hot_user();
			//设置数据库读取的基础数据
			h.setUser_code(user.get("user_code").toString());
			h.setRoom_code(user.get("room_code").toString());
			h.setJoin_date((Date) user.get("join_date"));
			
			JSONObject json = new JSONObject();
			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			HttpServletRequest request = ServletActionContext.getRequest();
			
			String user_name = request.getParameter("user_name");
			String id_num = request.getParameter("id_num");
			String sex = request.getParameter("sex");
			String telephone_no = request.getParameter("telephone_no");
			String user_adress = request.getParameter("user_adress");
			//设置请求的基础数据
			h.setUser_name(user_name);
			h.setId_num(Long.parseLong(id_num));
			h.setSex(sex);
			h.setTelephone_no(Long.parseLong(telephone_no));
			h.setUser_adress(user_adress);

			json.put("sex", sex);
			
			hot_userService.editHot_user(h);
			out.print(json.toString());
			out.close();
		}catch(Exception e){
			e.printStackTrace();
			}
	}
	
	public void edittelephone_no(){
		try{
			Hot_user h = new Hot_user();
			//设置数据库读取的基础数据
			h.setUser_code(user.get("user_code").toString());
			h.setRoom_code(user.get("room_code").toString());
			h.setJoin_date((Date) user.get("join_date"));
			
			JSONObject json = new JSONObject();
			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			HttpServletRequest request = ServletActionContext.getRequest();
			
			String user_name = request.getParameter("user_name");
			String id_num = request.getParameter("id_num");
			String sex = request.getParameter("sex");
			String telephone_no = request.getParameter("telephone_no");
			String user_adress = request.getParameter("user_adress");
			//设置请求的基础数据
			h.setUser_name(user_name);
			h.setId_num(Long.parseLong(id_num));
			h.setSex(sex);
			h.setTelephone_no(Long.parseLong(telephone_no));
			h.setUser_adress(user_adress);

			json.put("telephone_no",telephone_no);
			
			hot_userService.editHot_user(h);
			out.print(json.toString());
			out.close();
		}catch(Exception e){
			e.printStackTrace();
			}
	}
	
	public void edituser_adress(){
		try{
			Hot_user h = new Hot_user();
			//设置数据库读取的基础数据
			h.setUser_code(user.get("user_code").toString());
			h.setRoom_code(user.get("room_code").toString());
			h.setJoin_date((Date) user.get("join_date"));
			
			JSONObject json = new JSONObject();
			
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			HttpServletRequest request = ServletActionContext.getRequest();
			
			String user_name = request.getParameter("user_name");
			String id_num = request.getParameter("id_num");
			String sex = request.getParameter("sex");
			String telephone_no = request.getParameter("telephone_no");
			String user_adress = request.getParameter("user_adress");
			//设置请求的基础数据
			h.setUser_name(user_name);
			h.setId_num(Long.parseLong(id_num));
			h.setSex(sex);
			h.setTelephone_no(Long.parseLong(telephone_no));
			h.setUser_adress(user_adress);

			json.put("user_adress",user_adress);
			
			hot_userService.editHot_user(h);
			out.print(json.toString());
			out.close();
		}catch(Exception e){
			e.printStackTrace();
			}
	}
	
	public String quit(){
		try {
		hot_user_quit = new Hot_user();
		HttpServletRequest request = ServletActionContext.getRequest();
		String idString = request.getParameter("id_num");
		long id = Long.parseLong(idString);
		
		try {
			user = hot_userService.queryHot_user(id);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
        
		hot_user_quit.setUser_code(user.get("user_code").toString());
		hot_user_quit.setRoom_code(user.get("room_code").toString());
		hot_user_quit.setJoin_date((Date) user.get("join_date"));

		String user_name = user.get("user_name").toString()+"(退)";
		hot_user_quit.setUser_name(user_name);
		String id_num = user.get("id_num").toString();
		hot_user_quit.setId_num(Long.parseLong(id_num));
		String sex = user.get("sex").toString();
		hot_user_quit.setSex(sex);
		String telephone_no =user.get("telephone_no").toString();
		hot_user_quit.setTelephone_no(Long.parseLong(telephone_no));
		String user_adress = user.get("user_adress").toString();
		hot_user_quit.setUser_adress(user_adress);		
		
		
			hot_userService.editHot_user(hot_user_quit);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		return "quitSuccess";
	}
	
	
	
	//quit.jsp页面清除用户信息
	public String deleteAll(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String param = request.getParameter("choice").toString(); 
		if("yesDel".equals(param)){
			Map cost_user = null;
			String room_code = user.get("room_code").toString();
			String id = user.get("id_num").toString();
			long id_num = Long.parseLong(id);
			Hot_user u = new Hot_user();
			Hot_cost c = new Hot_cost();
			Hot_village_detail hd = new Hot_village_detail();
			
			hd.setRoom_code(room_code);
			
			
			try {
				cost_user = hot_userService.queryHot_cost(id_num);
				String cost_code = cost_user.get("cost_code").toString();
				c.setCost_code(cost_code);
				cost_user = hot_userService.queryHot_user(id_num);
				String user_code = cost_user.get("user_code").toString();
				u.setUser_code(user_code);
				
				
				hot_userService.deleteAll(u, c, hd);
				hot_user_quit = null;
				user.clear();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return "quitSuccess";
		}
		
		return "error";
	}
	
	//费用页面
	public void pay(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String idnum = request.getParameter("idnum");
		String reMoney = request.getParameter("money");
		Long id = Long.parseLong(idnum);
		
		try {
			
			cost = hot_userService.queryHot_cost(id);
			
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		double money=-0.00001;
		if(!("-0.0001".equals(reMoney))){
			money = Double.parseDouble(reMoney);
		}
		
		int costState = 1;
		if(!cost.isEmpty()){
			costState = 2;
		}
		try {							
			if(costState==2){

				String cost_code = cost.get("cost_code").toString();
				String room_code = cost.get("room_code").toString();
				String amount = cost.get("amount").toString();
				Double u_flow = Double.parseDouble(cost.get("u_flow").toString());
				java.sql.Date update_date = java.sql.Date.valueOf(cost.get("update_date").toString());
				Double u_area = Double.parseDouble(cost.get("u_area").toString());
				Double c_equipment = Double.parseDouble(cost.get("c_equipment").toString());
				Double c_man = Double.parseDouble(cost.get("c_man").toString());
				Double c_other = Double.parseDouble(cost.get("c_other").toString());
				String heating_cost_type = cost.get("heating_cost_type").toString();
		
				String user_name = cost.get("user_name").toString();
				if(money!=-0.00001&&money!=-0.0001){
					Hot_cost hot_cost = new Hot_cost(cost_code,room_code,money,u_flow,update_date,u_area,c_equipment,c_man,c_other,heating_cost_type);
					System.out.println(hot_cost);
					hot_userService.updateHot_cost(hot_cost);
				}
			
				JSONObject json = new JSONObject();
				json.put("amount", amount);
				json.put("user_name",user_name);
				JSONArray array = new JSONArray();
				array.add(json);
				JSONObject data = new JSONObject();
				data.put("array", array);
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(data.toString());
				out.close();
			}
			
		} catch (Exception e) {
			System.out.println("ajax查询，每输入一个数字查询一次，数据库没有该户主！");
			e.printStackTrace();
		}
	}
	
	
	public String reportHot_village(){
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			String param = request.getParameter("param");
			String vname = request.getParameter("vname");
			String paramu = request.getParameter("paramU");
			String uname = request.getParameter("uname");
			
			
			if("sosuoVName".equals(param)){
				list = hot_userService.queryHot_village_sosuo(vname);
				//调用设计好的分页效果
				list = empPage.getPage(list);
				//获得页数属性
				mapPage = empPage.getMapPage();
				
			}else{
				list = hot_userService.queryHot_village();
				//调用设计好的分页效果
				list = empPage.getPage(list);
				//获得页数属性
				mapPage = empPage.getMapPage();
				
			}
			
			if("sosuoU".equals(paramu)){
				listUserAll = hot_userService.queryHot_userAll_sosuo(uname);
				//调用设计好的分页效果
				listUserAll = empPage.getPage(listUserAll);
				//获得页数属性
				mapPage = empPage.getMapPage();
			}else{
				listUserAll = hot_userService.queryHot_userAll();
				//调用设计好的分页效果
				listUserAll = empPage.getPage(listUserAll);
				//获得总页数属性
				mapPage = empPage.getMapPage();
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		return "pagereportDetail";
	}
	
	
	public String reportHot_villageBTN() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		String state = request.getParameter("state");
		String statey = request.getParameter("statey");
		String stateb = request.getParameter("stateb");
		if("wgn".equals(state)){
			state="未供暖";
			listUserAll.clear();
			listUserAll = hot_userService.queryHot_village_state(state);
			//调用设计好的分页效果
			listUserAll = empPage.getPage(listUserAll);
			//获得页数属性
			mapPage = empPage.getMapPage();
		}
		
		if("ygn".equals(statey)){
			statey="已供暖";
			listUserAll.clear();
			listUserAll = hot_userService.queryHot_village_state(statey);
			//调用设计好的分页效果
			listUserAll = empPage.getPage(listUserAll);
			//获得页数属性
			mapPage = empPage.getMapPage();
		}
		
		if("blz".equals(stateb)){
			stateb="办理中";
			listUserAll.clear();
			listUserAll = hot_userService.queryHot_village_state(stateb);
			//调用设计好的分页效果
			listUserAll = empPage.getPage(listUserAll);
			//获得页数属性
			mapPage = empPage.getMapPage();
		}
		return "pagereportDetail";
	}
	
	//费用界面，全部用户
	public String costAll(){
		try{
			List<Map> all = hot_userService.queryHot_costAll();
			//调用设计好的分页效果
			list = empPage.getPage(all);
			//获得页数属性
			mapPage = empPage.getMapPage();
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	
		return "costAll";
	}
	//费用界面名字搜索
	public String costAllName(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		try{
			List<Map> all = hot_userService.queryHot_costAll_name(username);
			//调用设计好的分页效果
			list = empPage.getPage(all);
			//获得页数属性
			mapPage = empPage.getMapPage();
		}catch(Exception e){
			e.printStackTrace();
			return "error";
		}
	
		return "costAll";
	}
	
	//欠费用户查询
	public String costAllBTN(){
		try {
			List<Map> all = hot_userService.queryHot_costAllBTN(0.0);
			//调用设计好的分页效果
			list = empPage.getPage(all);
			//获得页数属性
			mapPage = empPage.getMapPage();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		
		return "costAllBTNto";
	}
	//导出excel用
	public String excelChargeAll(){
		list = hot_userService.queryHot_costAll();
		return "excelChargeAll";
	}
	
	//导出excel用
	public String excelChargeArrears(){
		try {
			list = hot_userService.queryHot_costAllBTN(0.0);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "excelChargeArrears";
	}

	
	//导出excel用
	public String excelUserDetail(){
		try {
			list = hot_userService.queryHot_userAll();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "excelUserDetail";
	}
	
	
	
	public String permission(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String account = request.getParameter("account");
		String password= request.getParameter("password2");
		String type= request.getParameter("type");
		
		if("guanli".equals(type)){
			type="管理";
		}
		if("user".equals(type)){
			type="用户";
		}
		if("putong".equals(type)){
			type="普通";
		}
		
		
		Hot_permission p = new Hot_permission(account, password,type);
		
		
		try {
			hot_userService.insertHot_permission(p);
			list = new ArrayList<Map>();
			list = hot_userService.queryHot_permission();
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return "error";
		}
		return "toDistribution";
		
	}	
	
	public String distribution(){
		list = new ArrayList<Map>();
		HttpServletRequest request = ServletActionContext.getRequest();
		String acc = request.getParameter("account");
		String pwd = request.getParameter("password");
		String type = request.getParameter("r");
		
		if(type!=null){
			if("guanli".equals(type)){
				type="管理";
			}
			if("yonghu".equals(type)){
				type="用户";
			}
			if("putong".equals(type)){
				type="普通";
			}
			Hot_permission p = new Hot_permission(acc, pwd, type);
			try {
				hot_userService.editHot_permission(p);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "error";
			}
		}
		try {
			list = hot_userService.queryHot_permission();
			//调用设计好的分页效果
			list = empPage.getPage(list);
			//获得页数属性
			mapPage = empPage.getMapPage();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		return "toDistribution";
	}
	
	public String picCharge() throws Exception{
		try {
			DefaultCategoryDataset dataset = new DefaultCategoryDataset();
			List<Map> all = hot_userService.queryHot_costAll();
			List<Map> arrears = hot_userService.queryHot_costAllBTN(0.0);
			double allC = 0.0;
			double allA = 0.0;
			double allE = 0.0;
			double allM = 0.0;
			double allO = 0.0;
			
			for(int i=0;i<=all.size()-1;i++){
				
				allC += Double.parseDouble(all.get(i).get("amount").toString());
				allE += Double.parseDouble(all.get(i).get("c_equipment").toString());
				allM += Double.parseDouble(all.get(i).get("c_man").toString());
				allO += Double.parseDouble(all.get(i).get("c_other").toString());
			}
			for(int i=0;i<=arrears.size()-1;i++){
				
				allA += Double.parseDouble(arrears.get(i).get("amount").toString());
			}
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession(true);
			
			session.setAttribute("allC", allC);
			session.setAttribute("allE", allE);
			session.setAttribute("allM", allM);
			session.setAttribute("allO", allO);
			session.setAttribute("allA", allA);
			dataset.addValue(allC,"额度", "收费总额");
			dataset.addValue(allA,"额度", "欠费总额");
			dataset.addValue(allE,"额度", "设备费用");
			dataset.addValue(allM,"额度", "人工费用");
			dataset.addValue(allO,"额度", "其他费用");
			
			JFreeChart chart = ChartFactory.createBarChart3D(
					"收费分析柱状图", "", "额度", dataset, PlotOrientation.VERTICAL, true, false, false);
			//解决中文乱码
			CategoryPlot plot = chart.getCategoryPlot();   
			CategoryAxis domainAxis = plot.getDomainAxis();   
			ValueAxis rAxis = plot.getRangeAxis(); 
			chart.getRenderingHints().put(RenderingHints.KEY_TEXT_ANTIALIASING,    
			RenderingHints.VALUE_TEXT_ANTIALIAS_OFF); 
			TextTitle textTitle = chart.getTitle(); 
			textTitle.setFont(new Font("宋体", Font.PLAIN, 30)); 
			domainAxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 20)); 
		    domainAxis.setLabelFont(new Font("宋体", Font.PLAIN, 20)); 
			rAxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 20));   
			rAxis.setLabelFont(new Font("宋体", Font.PLAIN, 20)); 
			chart.getLegend().setItemFont(new Font("宋体", Font.PLAIN, 20));
			BarRenderer3D renderer = (BarRenderer3D) plot.getRenderer();     
			renderer.setBaseItemLabelGenerator(new 
			StandardCategoryItemLabelGenerator());//设置柱子上显示文字 
		    renderer.setItemLabelFont(new Font("宋体", Font.PLAIN, 20));    
		    renderer.setItemLabelsVisible(true);
			//图片是文件格式的，故要用到FileOutputStream用来输出。
			HttpServletResponse response = ServletActionContext.getResponse();
			OutputStream out = response.getOutputStream();
			
			ChartUtilities.writeChartAsJPEG(out, 1.0f, chart, 1000, 800, null);		
			out.close();
			
		} catch (IOException e) {
			
			e.printStackTrace();
			return "error";
		}
		return "picCharge";
	}
}
