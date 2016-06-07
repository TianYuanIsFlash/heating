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
   top: 40px;
   }
  
 
  </style>

<script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>


 <script>
   $(function () { $('#myModal').modal({
      keyboard: true
      show:false
   })});
  </script>
  
  <script>
   $(function () { $('#myModal2').modal({
      keyboard: true
      show:false
   })});
  </script>
  
  
  
  
  
  <script type="text/javascript">
  
  $(document).ready(function(){
	  
	  function builderNum(e){
		  
		  var num = Math.floor(Math.random()*1000+1);
		  var num2 = Math.floor(Math.random()*1000+1);
		  var num3 = Math.floor(Math.random()*1000+1);
		  var num4 = Math.floor(Math.random()*1000+1);
		  var num5 = Math.floor(Math.random()*1000+1);
		  var num6 = Math.floor(Math.random()*1000+1);
		  
	  	  
		  
		  $("#liusu").width($("#liusu").width() + 50);
		  $("#liusu2").width(num);
		  $("#liusu3").text(num+"w");
		  
		  $("#liuliang").width($("#liuliang").width() + 50);
		  $("#liuliang2").width(num2);
		  $("#liuliang3").text(num2+"mg/m³");
		  
		  $("#wendu").width($("#wendu").width() + 50);
		  $("#wendu2").width(num3);
		  $("#wendu3").text(num3+"℃");
		  
		  $("#shidu").width($("#shidu").width() + 50);
		  $("#shidu2").width(num4);
		  $("#shidu3").text(num4+"%");

		  $("#xinji").width($("#xinji").width() + 50);
		  $("#xinji2").width(num5);
		  $("#xinji3").text(num5+"%");
		  
		  $("#san").width($("#san").width() + 50);
		  $("#san2").width(num6);
		  $("#san3").text(num6+"%");
		  
		  
		  
	  }  
	  //控制实时动态暂停还是开始
	  var cotr;
	  $("#qidong").on("click",function(){
		  cotr = setInterval(builderNum,500);
		  $("#qidong").attr("disabled", true); 
	  });
	  
	  $("#zanting").on("click",function(){
		  window.clearInterval(cotr);
		  $("#qidong").attr("disabled", false);
	  });
	  
	  //数据导出
	  
	  
  
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
<p>站点区域：</p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择津南区站点"><a>津南</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择西青区站点"><a>西青</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择南开区站点"><a>南开</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择和平区站点"><a>和平</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择宝坻区站点"><a>宝坻</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择蓟县区站点"><a>蓟县</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择河西区站点"><a>河西</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择河东区站点"><a>河东</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择河北区站点"><a>河北</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择虹桥区站点"><a>虹桥</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择东丽区站点"><a>东丽</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择北辰区站点"><a>北辰</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择静海区站点"><a>静海</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择宁河区站点"><a>宁河</a></p>
<p data-toggle="tooltip" 
      data-placement="top" title="选择武清区站点"><a>武清</a></p>
</div>


<div class="zt">
<p>
<button type="button" id="qidong" class="btn btn-default">启动</button>
<button type="button" id="zanting" class="btn btn-default">暂停</button>

<button type="button" id="subBtn" class="btn btn-default" data-toggle="modal" data-target="#myModal">数据分析</button>

<button type="button" id="subBtn" class="btn btn-default" data-toggle="modal" data-target="#myModal2">设备状态分析</button>
<button type="button" id="subBtn" class="btn btn-default">数据导出</button>
<button type="button" id="subBtn" class="btn btn-default">紧急停止设备</button>
<button type="button" id="subBtn" class="btn btn-default">站点呼叫</button>
</p>
<hr>
<span>功率</span>
<span id="liusu3">1000W</span>


<div class="progress progress-striped" id="liusu" data-toggle="tooltip" 
      data-placement="top" title="功率">

  

   <div class="progress-bar progress-bar-success" id="liusu2" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
      style="width:600px;cursor:pointer;">
      
   </div>
</div>
<span>颗粒烟气</span>
<span id="liuliang3">26mg/m³</span>
<div class="progress progress-striped" data-toggle="tooltip" 
      data-placement="top" title="颗粒烟气" id="liuliang">

   <div class="progress-bar progress-bar-info" id="liuliang2" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
      style="width:450px;cursor:pointer;">
      
   </div>
</div>
<span>温度</span>
<span id="wendu3">28℃</span>
<div class="progress progress-striped" data-toggle="tooltip" 
      data-placement="top" title="温度" id="wendu">

   <div class="progress-bar progress-bar-info" id="wendu2" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
      style="width:350px;cursor:pointer;">
      
   </div>
</div>
<span>注水率</span>
<span  id="shidu3">66%</span>
<div class="progress progress-striped" data-toggle="tooltip" 
      data-placement="top" title="注水率" id="shidu">

   <div class="progress-bar progress-bar-warning" id="shidu2" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 
      style="width:250px;cursor:pointer;">
      
   </div>
</div>
<span>通风率</span>
<span id="xinji3">80%</span>
<div class="progress progress-striped" data-toggle="tooltip" 
      data-placement="top" title="通风率" id="xinji">

   <div class="progress-bar progress-bar-danger" id="xinji2" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" 	
      style="width:389px;cursor:pointer;">
      
   </div>
</div>
<span>散暖量</span>
<span id="san3">2%</span>
<div class="progress progress-striped" id="san" data-toggle="tooltip" 
      data-placement="top" title="散暖量">

  

   <div class="progress-bar progress-bar-success" id="san2" role="progressbar" 
      aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
      style="width:600px;cursor:pointer;">
      
   </div>
</div>

</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               数据分析显示，按下 ESC 按钮退出。
            </h4>
         </div>
         <form class="form-horizontal" role="form" method="post" action="quitAction">
         <div class="modal-body">
            <p>经分析数据，该设备参数稳定！</p>

			  

			  

			
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary" id="sbtn">
               结果导出
            </button>
         </div>
         </form>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<!-- 模态框（Modal2） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
               设备分析显示，按下 ESC 按钮退出。
            </h4>
         </div>
         <form class="form-horizontal" role="form" method="post" action="quitAction">
         <div class="modal-body">
            <p>经分析设备状态，该设备性能优良稳定！</p>

			  

			  

			
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary" id="sbtn">
               结果导出
            </button>
         </div>
         </form>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>