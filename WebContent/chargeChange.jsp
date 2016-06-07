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
	#subBtn{
	position:relative;
	bottom:34px;
	left:230px;
	}
   </style>
   
   <script type="text/javascript">
   var username="";
   $(document).ready(function(){
	   
	   
	   $("#subBtn").on("click",function(){
		   $.ajax({
			   type:"post",
			   url:"payAction",
			   data:{idnum:$("#idnum").val(),
				     money:$("#amountY").val()-$("#money").val() 
			   },
			   dataType:"json",
			   success:function(data){}
		   });
	   });
	   
	   $("#idnum").bind("input propertychange",function(){
		   $.ajax({
			   type:"post",
			   url:"payAction",
			   data:{idnum:$("#idnum").val(),
				     money:-0.0001       },
			   dataType:"json",
			   success:function(data){
				   
				   $(function(){
						  $.each(data.array,function(index){
							  $.each(data.array[index],function(key,value){
								  
								  if(key=="amount"){$("#amountY").val(value);}
								  if(key=="user_name"){username=value;}
							  }); 
						  });			  
					  });
				   
				   
				   
				   
				   $("#subBtn").on("click",function(){
					   $("#show").text("|"+username+"|"+"------金额调整成功！");
				   });
				   
			   },error:function(){
				   $("#subBtn").on("click",function(){
					   $("#show").text("身份证号码有误！");
				   });
			   }
		   });
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



<form class="form-horizontal" role="form" id="myposition" action="payAction">
   <div class="form-group">
      <label class="col-sm-2 control-label">身份证号码</label>
      <div class="col-sm-10">
         <input class="form-control" id="idnum" type="text" 
            value="" style="width:40%;">
      </div>
   </div>

   <div class="form-group">
      <label for="inputPassword" class="col-sm-2 control-label">
         金额
      </label>
      <div class="col-sm-10">
         <input class="form-control" id="amountY" type="text" 
            placeholder="" disabled style="width:30%;">
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">调整金额</label>
      <div class="col-sm-10">
         <input class="form-control" id="money" type="text" 
            value="" style="width:15%;">

         <button type="button" id="subBtn" class="btn btn-default">确定</button>
      </div>
   </div>

   
      
 </form>

 <span style="color: blue;">金额调整状态：</span><u><b><span id="show" style="color: blue;"></span></b></u>

</body>
</html>