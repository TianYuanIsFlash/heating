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
	   $("#divLoad").load("otherHTML/giveTable.jsp #tableLoad");
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

<div style="display: inline-block;">
<img src="picChargeAction.action" width="700px" height="500px" id="imgLoad"/> <br>
</div>

<div id="divLoad" style="display: inline-block;width: 400px;height: 300px;position: absolute;top: 300px;left: 800px;">
 
</div>
</body>
</html>