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
  
 
  <style type="text/css">
   .dp{
   
   display: inline-block;
   width:10%;
   position: relative;
   left:100px;
   }
   .zt{
   display: inline-block;
   width:70%;
   float:right;
   position: relative;
   top: 90px;
   }
  </style>

<script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>
  
  <script type="text/javascript">
  
  $(document).ready(function(){
	  
	  $("#liusu").width($("#liusu").width() + 50);	  
	  $("#liusu").on("click",function(e){
		  var x = e.pageX-410;		  
		  $("#liusu2").width(x);
		  $("#liusu3").text(x*0.02+"m³/min");
	  });
	  
	  
	  $("#liuliang").width($("#liuliang").width() + 100);
	  $("#liuliang").on("click",function(e){
		  var x = e.pageX-410;		  
		  $("#liuliang2").width(x);
		  $("#liuliang3").text(x*0.05+"m³/h");
	  });
	  
	  
	  $("#wendu").width($("#wendu").width() + 150);
	  $("#wendu").on("click",function(e){
		  var x = e.pageX-410;		  
		  $("#wendu2").width(x);
		  $("#wendu3").text(x*0.06+"℃");
	  });
	  
	  
	  $("#shidu").width($("#shidu").width() + 200);
	  $("#shidu").on("click",function(e){
		  var x = e.pageX-410;		  
		  $("#shidu2").width(x);
		  $("#shidu3").text(x*0.15+"RH");
	  });
	  
	  
	  $("#xinji").width($("#xinji").width() + 300);
	  $("#xinji").on("click",function(e){
		  var x = e.pageX-410;		  
		  $("#xinji2").width(x);
		  $("#xinji3").text(x*0.0008+"%");
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




<div class="dp">
<p>设备区域：</p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择津南区设备"><a>津南</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择西青区设备"><a>西青</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择南开区设备"><a>南开</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择和平区设备"><a>和平</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择宝坻区设备"><a>宝坻</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择蓟县区设备"><a>蓟县</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择河西区设备"><a>河西</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择河东区设备"><a>河东</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择河北区设备"><a>河北</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择虹桥区设备"><a>虹桥</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择东丽区设备"><a>东丽</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择北辰区设备"><a>北辰</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择静海区设备"><a>静海</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择宁河区设备"><a>宁河</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择武清区设备"><a>武清</a></p>
</div>


<div class="zt">
<span>暖气流速</span>



<div class="progress" id="liusu" data-toggle="tooltip" 
      data-placement="top" title="点击调节流速">

  

   <div class="progress-bar progress-bar-success" id="liusu2" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
      style="width:600px;cursor:pointer;">
      <span id="liusu3">12m³/min</span>
   </div>
</div>
<span>暖气流量</span>
<div class="progress" data-toggle="tooltip" 
      data-placement="top" title="点击调节流量" id="liuliang">

   <div class="progress-bar progress-bar-info" id="liuliang2" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
      style="width:450px;cursor:pointer;">
      <span id="liuliang3">26m³/h</span>
   </div>
</div>
<span>温度</span>
<div class="progress" data-toggle="tooltip" 
      data-placement="top" title="点击调节温度" id="wendu">

   <div class="progress-bar progress-bar-info" id="wendu2" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
      style="width:350px;cursor:pointer;">
      <span id="wendu3">28℃</span>
   </div>
</div>
<span>湿度</span>
<div class="progress" data-toggle="tooltip" 
      data-placement="top" title="点击调节湿度" id="shidu">

   <div class="progress-bar progress-bar-warning" id="shidu2" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 
      style="width:250px;cursor:pointer;">
      <span  id="shidu3">66RH</span>
   </div>
</div>
<span>清新剂</span>
<div class="progress" data-toggle="tooltip" 
      data-placement="top" title="点击调节湿度" id="xinji">

   <div class="progress-bar progress-bar-danger" id="xinji2" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
      style="width:389px;cursor:pointer;">
      <span id="xinji3">0.56%</span>
   </div>
</div>
</div>



</body>
</html>