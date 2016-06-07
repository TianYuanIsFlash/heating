<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	 $("a[id!='may']").click(function(){
		 alert("账号权限不足！");
		 return false; }); 
	 
	 $("button").click(function(){
		 alert("联系Mr.diver-13821933167");
		 }); 
	
		 });
		 
		 
		 		 
 </script>
  
</head>
<body>

<div class="page-header">
   <h3><a href="quickdoor.jsp" class="glyphicon glyphicon-home">居民供暖管理系统</a>
  
   
      <small class="btn btn-primary btn-lg" style="text-shadow: black 5px 3px 3px;position: absolute;right: 180px;"><span class="glyphicon glyphicon-user"><%=session.getAttribute("user") %></span></small>
      <small class="btn btn-primary btn-lg" style="text-shadow: black 5px 3px 3px;position: absolute;right: 80px;"><span class="glyphicon glyphicon-user"><%=session.getAttribute("type") %></span></small>
       <small id="nowDiv" style="position: absolute;right: 33px;top: 60px;"><span><a href="index.html" class="glyphicon glyphicon-log-out" id="may"></a></span></small>
	  
   </h3>
  </div>



<div id="teshu">
  <ul class="nav nav-pills">
   <li class="active"><a id="a" href="quickdoor.jsp">快捷入口</a></li>
   <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
         基础信息管理 <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
         <li><a href="apply.jsp">入网录入</a></li>
         <li><a href="contract.jsp">入网合同</a></li>
         <li><a href="messageChange.jsp">客户信息变更</a></li>
         <li class="divider"></li>
         <li><a href="quit.jsp">客户退网</a></li>
      </ul>
   </li>
   <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
         采暖计费管理 <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
	     <li><a href="charge.jsp">缴费</a></li>
	     
		 <li><a href="outCharge.jsp">退费</a></li>
         	 
         <li class="divider"></li>
         <li><a href="chargeChange.jsp">价格优惠调整</a></li>
      </ul>
   </li>
   <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
         报表管理 <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
         <li><a href="reportHot_villageAction.action">综合明细报表</a></li>           
         <li class="divider"></li>
         <li><a href="costAllAction.action">收费汇总报表</a></li>
      </ul>
   </li>
   <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
         设备管理 <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
         <li><a href="heatingChange.jsp">设备调节</a></li>
        
         <li><a href="realTime.jsp">站点参数实时反馈</a></li>
         <li class="divider"></li>
         <li><a href="statistics.jsp">报修维护统计</a></li>
      </ul>
   </li>
   <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
         统计图表 <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
         
         <li><a href="picCharge.jsp">收费图表分析 </a></li>      
         
      </ul>
   </li>
   <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
         人员管理 <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
         <li><a href="goCharge.jsp">收费派遣</a></li>                
         <li class="divider"></li>
         <li><a href="goRepair.jsp">维修调度</a></li>
      </ul>
   </li>

   <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
         权限管理 <span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
         <li><a href="createUser.jsp">创建用户</a></li>        
         <li class="divider"></li>
         <li><a href="distributionAction.action">权限分配</a></li>
      </ul>
   </li>
  </ul>
</div>  
<hr>   



<h3 align="center">系统简介</h3>
<table class="table table-hover">
   
   <thead>
      <tr>
         <th>名称</th>
         <th>使用范围</th>
         <th>价格</th>
         <th>系统支持</th>
         <th>技术实现</th>
         <th>联系</th>
         <th>购买</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>居民供暖管理系统1.0</td>
         <td>供暖管理公司（非个人）</td>
         <td>10000$</td>
         <td>Windows系列 内存1G 硬盘100M</td>
         <td>JavaWeb</td>
         <td>Tel:13821933167</td>
         <td><button type="button" class="btn btn-info">购买</button></td>
         
      </tr>
      
      <tr>
         <td>居民供暖管理系统2.0</td>
         <td>供暖管理公司（非个人）</td>
         <td>2000000$</td>
         <td>Windows系列 内存1G 硬盘100M</td>
         <td>JavaWeb</td>
         <td>Tel:13821933167</td>
         <td><button type="button" class="btn btn-info">购买</button></td>
      </tr>
      
      <tr>
         <td>居民供暖管理系统3.0</td>
         <td>供暖管理公司（非个人）</td>
         <td>3000000$</td>
         <td>Windows系列 内存1G 硬盘100M</td>
         <td>JavaWeb</td>
         <td>Tel:13821933167</td>
         <td><button type="button" class="btn btn-info">购买</button></td>
      </tr>
      
      <tr>
         <td>居民供暖管理系统4.0</td>
         <td>供暖管理公司（非个人）</td>
         <td>4000000$</td>
         <td>Windows系列 内存1G 硬盘100M</td>
         <td>JavaWeb</td>
         <td>Tel:13821933167</td>
         <td><button type="button" class="btn btn-info">购买</button></td>
      </tr>
      
      <tr>
         <td>居民供暖管理系统5.0</td>
         <td>供暖管理公司（非个人）</td>
         <td>5000000$</td>
         <td>Windows系列 内存1G 硬盘100M</td>
         <td>JavaWeb</td>
         <td>Tel:13821933167</td>
         <td><button type="button" class="btn btn-info">购买</button></td>
      </tr>
      
      <tr>
         <td>居民供暖管理系统6.0</td>
         <td>供暖管理公司（非个人）</td>
         <td>6000000$</td>
         <td>Windows系列 内存1G 硬盘100M</td>
         <td>JavaWeb</td>
         <td>Tel:13821933167</td>
         <td><button type="button" class="btn btn-info">购买</button></td>
      </tr>
      
      <tr>
         <td>居民供暖管理系统7.0</td>
         <td>供暖管理公司（非个人）</td>
         <td>8000000$</td>
         <td>Windows系列 内存1G 硬盘100M</td>
         <td>JavaWeb</td>
         <td>Tel:13821933167</td>
         <td><button type="button" class="btn btn-info">购买</button></td>
      </tr>
      
   </tbody>
</table>

</body>
</html>