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

  <!--引入我的CSS-->
  <link href="css/QuickEnter.css" rel="stylesheet">
  <!-- 包括JS文件，放置头文件 -->
  <script src="js/headJquery.js"></script>
  <!--title前logo-->
  <link rel="icon" href="img/hotIcon.png" type="image/x-icon"/>
  
 
  
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



<div class="quickAll">

  <div>

  <div id="" class="quickEnter">
	<a href="charge.jsp"><img src="img/quick1.png"></img></a>
  </div>

  <div id="" class="quickEnter">
	<a href="reportHot_villageAction.action"><img src="img/quick2.png"></img></a>
  </div>

  <div id="" class="quickEnter">
	<a href="messageChange.jsp"><img src="img/quick3.png"></img></a>
  </div>

  </div>

  <div>

  <div id="" class="quickEnter">
	<a href="picCharge.jsp"><img src="img/quick4.png"></img></a>
  </div>

  <div id="" class="quickEnter">
	<a href="costAllAction.action"><img src="img/quick5.png"></img></a>
  </div>

  <div id="quickEnter6" class="quickEnter">
	<a href="costAllAction.action"><img src="img/quick6.png"></img></a>
  </div>

  </div>

  
  </div>
</body>
</html>