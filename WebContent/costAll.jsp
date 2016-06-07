<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>居民供暖管理系统</title>

<!-- 引入 Bootstrap -->
  <link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
  <script src="jQuery/jquery-1.11.3.min.js"></script>
  <!-- 包括所有已编译的插件 -->
  <script src="bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>  
  <!-- 包括JS文件，放置头文件 -->
  <script src="js/headJquery.js"></script> 
  <!--引入我的CSS-->
  <link href="css/QuickEnter.css" rel="stylesheet">

  <!--title前logo-->
  <link rel="icon" href="img/hotIcon.png" type="image/x-icon"/>
  
 <script type="text/javascript">
 $(document).ready(function(){
	 //导出到excel
	 $("#toExcel").on("click",function(toExcelTab){
		//必须用ie浏览器，必须安装excel，必须是windwos系统 

		

	 });
	//输入的值变化即会触发
	 $("#pagenumId").change(function() {
		 $("#formSub").submit();
	 });
 });
 </script>
 
</head>
<body>

<div class="page-header">
   <h3><a href="quickdoor.jsp" class="glyphicon glyphicon-home">居民供暖管理系统</a>
  
   
      <small class="btn btn-primary btn-lg" style="text-shadow: black 5px 3px 3px;position: absolute;right: 180px;"><span class="glyphicon glyphicon-user"><%=session.getAttribute("user") %></span></small>
      <small class="btn btn-primary btn-lg" style="text-shadow: black 5px 3px 3px;position: absolute;right: 80px;"><span class="glyphicon glyphicon-user"><%=session.getAttribute("type") %></span></small>
       <small id="nowDiv" style="position: absolute;right: 33px;top: 60px;"><span><a href="index.html" class="glyphicon glyphicon-log-out"></a></span></small>
	  
   </h3>
  </div>


<div id="loadHead">

</div> 
<hr>


<h4 align="center">收费汇总报表</h4>
<table class="table table-hover" id="toExcelTab">
   
   <thead>
   <tr>      
         <th colspan="14">
         <form action="costAllNameAction" method="post" style="display: inline-block;">
         
         <input type="text" style="width:120px;" name="username"> 
         <input type="submit" value="姓名检索">       
         </form>
         
         <a href="costAllBTNAction.action"><input type="button" class="btn btn-default" value="欠费用户"></a>
         <form action="costAllAction" method="get" style="display: inline-block;">
         
         <input type="submit" class="btn btn-default" value="全部用户">
         </form>
         
         <a href="excelChargeAllAction"><input type="button" class="btn btn-default" id="toExcel" value="导出"></a>
         <input type="button" class="btn btn-default" value="每页显示数量">
         
         
         <form role="form" style="display: inline-block;position:relative;top: 30px;" id="formSub">
         <div class="form-group" style="display: inline-block;width: 40px;">
         
         <select class="form-control" id="pagenumId" name="pagenum">
         <option>请选择</option>
         <option value="5">5</option>
         <option value="7">7</option>
         <option value="8">8</option>
         <option value="12">12</option>
         <option value="16">16</option>
         <option value="20">20</option>
         </select>
         </div>
         </form>
         </th>
        
      </tr>
      
   </thead>
   <tbody>
      <tr>
         <th>序号</th>
         <th>姓名</th>
         <th>总额</th>
         <th>暖气费用</th>
         <th>单价-暖气流量（立方米）</th>
         <th>单价-面积（平方米）</th>
         <th>设备费用</th>
         <th>人工费用</th>
         <th>其他费用</th>
         
         <th>供暖计费类型</th>
         <th>更新时间</th>
      </tr>
    <c:forEach var="u" items="${requestScope.list}">
      <tr>
         <td>${u.rownum}</td>
         <td>${u.user_name}</td>
         <td>${u.amount+u.c_equipment+u.c_man+u.c_other}</td>
         <td>${u.amount}</td>
         <td>${u.u_flow}</td>
         <td>${u.u_area}</td>
         <td>${u.c_equipment}</td>
         <td>${u.c_man}</td>
         <td>${u.c_other}</td>
         <td>${u.heating_cost_type}</td>
         <td>${u.update_date}</td>
         
      </tr>
    </c:forEach> 
         
    
      <tr >
      <td colspan="10">
       <ul class="pagination">
          
		  <li><a href="costAllAction.action?num=last">&laquo;</a></li>
		  <li><a href="costAllAction.action?result=1">1</a></li>
		  <li><a href="costAllAction.action?result=2">2</a></li>
		  <li><a href="costAllAction.action?result=3">3</a></li>
		  <li><a href="costAllAction.action?result=4">4</a></li>
		  <li><a href="costAllAction.action?result=5">5</a></li>
		  <li><a href="costAllAction.action?num=end">...${mapPage.totalPage}</a></li>
		  <li><a href="costAllAction.action?num=next">&raquo;</a></li>
		  
		  <li><form action="costAllAction" method="post">
		   <input type="text" name="result" size="1" style="width: 40px;height: 33px" pattern="^[0-9]{1,9}$" title="小于1000000000的正整数！">
		   <input type="submit" value="跳转" style="height: 30px;">
		  </form></li>
		   
		</ul>
		<span>总页数：<u style="color: blue;">${mapPage.totalPage}</u> |&nbsp;当前页：<u style="color: blue;">${mapPage.page}</u> |&nbsp; 每页：<u style="color: blue;">${mapPage.state}</u>条记录</span>
		<span class="glyphicon glyphicon-align-justify" style="position:relative;left: 10px;"><span class="badge pull-right">${mapPage.page}</span>
		
		</span>
      </td>
      </tr>
   </tbody>
</table>

</body>
</html>