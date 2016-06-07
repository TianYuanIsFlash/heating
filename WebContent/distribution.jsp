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
	   $(".allInput").bind("change",function(){
		   var i = $(this).attr("id");
		   $("#tishi").toggle();
		   //设置暂停一会
		   setTimeout(function () {		   
			   
			   $("#"+i).submit();
		    }, 2000);
		   
		   
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



<div style="display: inline-block;position: fixed;top: 130px;right: 10px;">
  <img src="img/tishi.jpg";width="100px" height="120px"style="display: none;" id="tishi">
</div>

<table class="table table-striped">
   <caption>权限分配</caption>
   <thead>
      <tr>
         <th>账号</th>
         <th>权限</th>
         <th>修改权限</th>
      </tr>
   </thead>
   <tbody>
   
   <c:forEach var="u" items="${requestScope.list}">
    <tr>
         <td>${u.account}</td>
         <td>${u.type}</td>
         <td>
         <form action="distributionAction"  id="${u.account}" method="post">
          <input type="hidden" value="${u.account}" name="account">
          <input type="hidden" value="${u.password}" name="password">
                           管理<input type="radio" value="guanli" name="r" class="allInput" id="${u.account}">
                           用户<input type="radio" value="yonghu" name="r" class="allInput" id="${u.account}">
                           普通<input type="radio" value="putong" name="r" class="allInput" id="${u.account}">
         </form>
         
         
         </td>
      </tr>
   </c:forEach>
      
     <tr id="dis">
      <td colspan="10">
       <ul class="pagination">
          
		  <li><a href="distributionAction.action?num=last">&laquo;</a></li>
		  <li><a href="distributionAction.action?result=1">1</a></li>
		  <li><a href="distributionAction.action?result=2">2</a></li>
		  <li><a href="distributionAction.action?result=3">3</a></li>
		  <li><a href="distributionAction.action?result=4">4</a></li>
		  <li><a href="distributionAction.action?result=5">5</a></li>
		  <li><a href="distributionAction.action?num=end">...${mapPage.totalPage}</a></li>
		  <li><a href="distributionAction.action?num=next">&raquo;</a></li>
		  
		  <li><form action="distributionAction" method="post">
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