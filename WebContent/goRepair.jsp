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
  
  <script>$(function () 
      { $("[data-toggle='popover']").popover();
      });
  </script>
  
  <script type="text/javascript">
   $(document).ready(function(){
	   var t = $("tr").length;
	   if(t>4){
		   $(".haveWork").hide();
	   }

	   
   });
  </script>
  
  
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

<a href="repairManager.action"><button type="button" class="btn btn-primary" id="noWorkBtn">空闲查看</button></a>
<button type="button" class="btn btn-default" title="已处理：964"  
      data-container="body" data-toggle="popover" data-placement="bottom" 
      data-content="维修调度通知成功！">
      维修
   </button>
   
   
   <button type="button" class="btn btn-default" title="已处理：964"  
      data-container="body" data-toggle="popover" data-placement="bottom" 
      data-content="维修调度通知成功！">
      维护
   </button>
   
   <button type="button" class="btn btn-default" title="已处理：964"  
      data-container="body" data-toggle="popover" data-placement="bottom" 
      data-content="维修调度通知成功！">
     巡查
   </button>
   
   <button type="button" class="btn btn-default" title="已处理：964"  
      data-container="body" data-toggle="popover" data-placement="bottom" 
      data-content="维修调度通知成功！">
      派遣
   </button>
   
   
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
   
   <table class="table table-striped">
   
   <thead>
      <tr>
         <th>选择</th>
         <th>序号</th>
         <th>员工</th>
         <th>位置</th>
         <th>任务</th>
         <th>备注</th>
      </tr>
   </thead>
   <tbody>
   <c:forEach var="list" items="${requestScope.list}">
      <tr>
         <td><input type="checkbox" ></td>
         <td>${list.rownum}</td>
         <td>${list.ename}</td>
         <td>${list.position}</td>  
         <td>${list.task}</td>  
         <td>${list.job}</td>       
      </tr>
      </c:forEach> 
      
      <tr class="haveWork">
         <td><input type="checkbox" ></td>
         <td>1</td>
         <td>李斌</td>
         <td>毛海路33号</td>
         <td>维修派遣中</td>
         <td>设备工程师</td>
      </tr>
      <tr class="haveWork">
         <td><input type="checkbox" ></td>
         <td>2</td>
         <td>王斌</td>
         <td>和平路66号</td>
         <td>维修派遣中</td>
         <td>设备工程师</td>
      </tr>
      
      <tr>
      <td colspan="10">
       <ul class="pagination">
          
		  <li><a href="repairManager.action?num=last">&laquo;</a></li>
		  <li><a href="repairManager.action?result=1">1</a></li>
		  <li><a href="repairManager.action?result=2">2</a></li>
		  <li><a href="repairManager.action?result=3">3</a></li>
		  <li><a href="repairManager.action?result=4">4</a></li>
		  <li><a href="repairManager.action?result=5">5</a></li>
		  <li><a href="repairManager.action?num=end">...${mapPage.totalPage}</a></li>
		  <li><a href="repairManager.action?num=next">&raquo;</a></li>
		  
		  <li><form action="repairManager" method="post">
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