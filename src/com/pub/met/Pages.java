package com.pub.met;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class Pages {
	
	private int inputResult = -1;	
	private Map mapPage=null;
	//初始化每页记录数
	private int state = 6;
	
	
    
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

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

	//分页设计，查询出的或者需要显示在页面的集合,初始化每页显示记录数,返回页面
	public List<Map> getPage(List<Map>  list){
        HttpServletRequest request = ServletActionContext.getRequest();		
		String num = request.getParameter("num");
		String result = request.getParameter("result");
		List<Map> all = new ArrayList();		
		all.addAll(list);
		
		try{
			if(result!=null){
				inputResult = Integer.parseInt(result);
			}					
			
			//设置每页的数据条数			
			if(request.getParameter("pagenum")!=null){				
				state=Integer.parseInt(request.getParameter("pagenum"));
			}
			//计算页数
			int size = all.size()/state;
			int nextS = all.size()%state;
			
			//初始化时设计的分页效果
			try{
				
				if( result==null && num==null){
					list = new ArrayList<Map>();
					for(int i=1;i<=state;i++){
						
						list.add(all.get(i));		
					}
					inputResult=1;
				}
				
			}catch(Exception e){
				System.out.println("初始化不满一页记录！");
			}
						
			//不满N条记录，有余数
			if("end".equals(num) && nextS<state&&nextS>0){
				list.clear();
				inputResult = size+1;
				for(int i=inputResult*state-state;i<=inputResult*state-state-1+nextS;i++){
					list.add(all.get(i));				
				}				
			}			
			//正好N条记录，无余数
			if("end".equals(num) && nextS==0){
				list.clear();
				inputResult = size;
				for(int i=inputResult*state-state;i<=inputResult*state-1;i++){
					list.add(all.get(i));					
				}				
			}			
			//判断下一页
			if("next".equals(num)&&inputResult<size){
				list.clear();
				inputResult+=1;
				for(int i=inputResult*state-state;i<=inputResult*state-1;i++){
					list.add(all.get(i));					
				}				
			}
			//判断下一页无余数
			if("next".equals(num)&&inputResult>=size && nextS==0){
				list.clear();
				inputResult = size;
				for(int i=inputResult*state-state;i<=inputResult*state-1;i++){
					list.add(all.get(i));			
				}
			}
			//判断下一页有余数
			if("next".equals(num)&&inputResult>=size && nextS!=0){
				list.clear();
				inputResult = size+1;
				for(int i=inputResult*state-state;i<=inputResult*state-state-1+nextS;i++){
					list.add(all.get(i));		
				}
			}
			//判断上一页
			if("last".equals(num)&&inputResult>1){
				list.clear();
				inputResult-=1;
				for(int i=inputResult*state-state;i<=inputResult*state-1;i++){
					list.add(all.get(i));				
				}			
			}			
			//输入页码判断，无余数，输入小的数字
			if(inputResult>0 && inputResult<=size){
				list.clear();
				for(int i=inputResult*state-state;i<=inputResult*state-1;i++){
					list.add(all.get(i));			
				}
				
			}
			//输入页码判断，无余数，输入大的数字
			if(inputResult>size && nextS==0){
				list.clear();
				inputResult = size;
				for(int i=inputResult*state-state;i<=inputResult*state-1;i++){
					list.add(all.get(i));			
				}
				
			}
			//输入页码判断，输入小于1，或者不为数字
			if(inputResult<1){
				list.clear();
				inputResult = 1;
				for(int i=inputResult*state-state;i<=inputResult*state-1;i++){
					list.add(all.get(i));			
				}
				
			}
			//输入页码判断，有余数
			if(inputResult>size && nextS!=0){
				list.clear();
				inputResult = size+1;
				for(int i=inputResult*state-state;i<=inputResult*state-state-1+nextS;i++){
					list.add(all.get(i));		
				}
			}
			
			
			mapPage = new HashMap();
			mapPage.put("totalPage", nextS<state&&nextS>0?size+1:size);
			mapPage.put("state", state);
			mapPage.put("page", inputResult);
			
		}catch(Exception e){
			
			e.printStackTrace();
			
			return list;
			
		}
		return list;
	}	
}
