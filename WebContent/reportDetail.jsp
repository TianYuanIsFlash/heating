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




<h4 align="center">综合明细报表</h4>
<div style="display: inline-block;width:200px;float: left;">
<table class="table table-bordered">
   <caption>小区综合</caption>
   <thead>
      <tr>
      
         <th>
         <form action="reportHot_villageAction" method="post">
         <input type="hidden" style="width:120px;" name="param" value="sosuoVName">
         <input type="text" style="width:120px;" name="vname"> 
         <input type="submit" value="搜索">
         </form>
         </th>
        
      </tr>
   </thead>
   <tbody>
   <tr>
         <th>小区名字</th>
         
      </tr>
   <c:forEach var="hot_village" items="${requestScope.list}">
      <tr>
         <td>${hot_village.name}</td>
         
      </tr>
    </c:forEach> 
     
     
     <tr id="dis">
      <td>
       <ul class="pagination">
          
		  <li><a href="reportHot_villageAction.action?num=last">&laquo;</a></li>
		  
		  <li><a href="reportHot_villageAction.action?num=next">&raquo;</a></li>
		  
		  <li><form action="reportHot_villageAction" method="post">
		   <input type="text" name="result" size="1" style="width: 40px;height: 33px" pattern="^[0-9]{1,9}$" title="小于1000000000的正整数！">
		   <input type="submit" value="跳转" style="height: 30px;">
		  </form></li>
		   
		</ul>
		<span class="" style="color: blue;font-size: 20px;"><span class=""></span></span>
      </td>
      </tr>
   </tbody>
</table>
</div>


<div style="display: inline-block;width:1130px;">
<table class="table table-hover">
   <caption>户主综合</caption>
   <thead>
   <tr>
      
         <th colspan="14">
         
         <form action="reportHot_villageAction" method="post" style="display: inline-block;">
         <input type="hidden" style="width:120px;" name="paramU" value="sosuoU">
         <input type="text" style="width:120px;" name="uname"> 
         <input type="submit" value="姓名检索">
         
         </form>
         <a href="excelUserDetailAction.action"><input type="button" class="btn btn-default" value="导出"></a>
         <form action="reportHot_villageBTNAction" method="get" style="display: inline-block;">
         <input type="hidden" value="wgn" name="state">
         
         <input type="submit" class="btn btn-default" value="未供暖">
         
         
         </form>
         
         
         <form action="reportHot_villageBTNAction" method="get" style="display: inline-block;">
         <input type="hidden" value="ygn" name="statey">
         
         <input type="submit" class="btn btn-default" value="已供暖">
         
         
         </form>
         
         
         <form action="reportHot_villageBTNAction" method="get" style="display: inline-block;">
         <input type="hidden" value="blz" name="stateb">
         
         <input type="submit" class="btn btn-default" value="办理中">
         
         
         </form>
         
         
         <input type="button" class="btn btn-default" value="每页显示数量">
         
         
         <form role="form" style="display: inline-block;position:absolute;" id="formSub">
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
         
         <th>姓名</th>
         <th>生份证号</th>
         <th>手机</th>
         <th>入网时间</th>
         <th>所在小区</th>
         <th>楼号</th>
         <th>单元号</th>
         <th>楼层号</th>
         <th>房间号</th>
         <th>供暖状态</th>
         <th>房间面积</th>
         <th>暖气费用</th>
         <th>计费类型</th>
         <th>缴费时间</th>
      </tr>
    <c:forEach var="u" items="${requestScope.listUserAll}">
      <tr>
         <td>${u.user_name}</td>
         <td>${u.id_num}</td>
         <td>${u.telephone_no}</td>
         <td>${u.join_date}</td>
         <td>${u.name}</td>
         <td>${u.house_no}</td>
         <td>${u.unit_no}</td>
         <td>${u.floor_no}</td>
         <td>${u.room_no}</td>
         <td>${u.state}</td>
         <td>${u.area}</td>
         <td>${u.amount}</td>
         <td>${u.heating_cost_type}</td>
         <td>${u.update_date}</td>
         
      </tr>
    </c:forEach> 
         
    <tr id="dis">
      <td colspan="10">
       <ul class="pagination">
          
		  <li><a href="reportHot_villageAction.action?num=last">&laquo;</a></li>
		  <li><a href="reportHot_villageAction.action?result=1">1</a></li>
		  <li><a href="reportHot_villageAction.action?result=2">2</a></li>
		  <li><a href="reportHot_villageAction.action?result=3">3</a></li>
		  <li><a href="reportHot_villageAction.action?result=4">4</a></li>
		  <li><a href="reportHot_villageAction.action?result=5">5</a></li>
		  <li><a href="reportHot_villageAction.action?num=end">...${mapPage.totalPage}</a></li>
		  <li><a href="reportHot_villageAction.action?num=next">&raquo;</a></li>
		  
		  <li><form action="reportHot_villageAction" method="post">
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


</div>
</body>
</html>