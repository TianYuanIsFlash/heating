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
  position: relative;
  left:260px;
  top:20px;
  }
 </style>
  
  <script type="text/javascript">
   $(document).ready(function(){
	   
	   $("[name='account']").bind("input propertychange",function(){
		   var acc = $("[name='account']").val().length;
		   if(acc<36 && acc>=3){
			   $("#accCH").css("display","inline-block");
			   $("#accCHW").css("display","none");
			   $("#type").attr("disabled",false);
			   $("[name='sub']").attr("disabled",false);
		   }else{
			   $("#accCH").css("display","none");
			   $("#accCHW").css("display","inline-block");
			   $("#accCHW").text("账号为3~35位字符！");
			   $("#type").attr("disabled",true);
			   $("[name='sub']").attr("disabled",true);
		   }
	   });
	   
	   
	   $("[name='password']").bind("input propertychange",function(){
		   var p1 = $("[name='password']").val().length;
		   if(p1>=6 && p1<35){
			   $("#pwdCH").css("display","inline-block");
			   $("#pwdCHW").css("display","none");
			   $("#type").attr("disabled",false);
			   $("[name='sub']").attr("disabled",false);
		   }else{
			   $("#pwdCH").css("display","none");
			   $("#pwdCHW").css("display","inline-block");
			   $("#pwdCHW").text("密码为6~35位字符！");
			   $("#type").attr("disabled",true);
			   $("[name='sub']").attr("disabled",true);
		   }
	   });
	   
	   
	   $("[name='password2']").bind("input propertychange",function(){
		   var p1 = $("[name='password']").val();
		   var p2 = $("[name='password2']").val();
		   if(p1!=p2){
			   $("#pwdCHW2").css("display","inline-block");
			   $("#pwdCH2").css("display","none");
			   $("#pwdCHW2").text("密码不一致！");
			   $("#type").attr("disabled",true);
			   $("[name='sub']").attr("disabled",true);
		   }
		   if(p1==p2){
			   $("#pwdCH2").css("display","inline-block");
			   $("#pwdCHW2").css("display","none");
			   
			   $("#type").attr("disabled",false);
			   $("[name='sub']").attr("disabled",false);
		   }
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





<form class="form-horizontal" role="form" action="permissionAction" method="post">
   
   
   <div class="form-group">
      <label class="col-sm-2 control-label">用户</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;display: inline-block;" name="account">
            
         <span id="accCH" class="glyphicon glyphicon-ok" style="color: green;display: none;"></span>
         <span id="accCHW" class="glyphicon glyphicon-remove" style="color: red;display: none;"></span>   
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">密码</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="password" 
            value="" style="width:40%;display: inline-block;" name="password">
         
         <span id="pwdCH" class="glyphicon glyphicon-ok" style="color: green;display: none;"></span>
         <span id="pwdCHW" class="glyphicon glyphicon-remove" style="color: red;display: none;"></span>
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">密码确认</label>
      <div class="col-sm-10">
      <span>
         <input class="form-control" id="focusedInput" type="password" 
            value="" style="width:40%;display: inline-block;" name="password2">
         <span id="pwdCH2" class="glyphicon glyphicon-ok" style="color: green;display: none;"></span>
         <span id="pwdCHW2" class="glyphicon glyphicon-remove" style="color: red;display: none;"></span>   
      </span>
      </div>
   </div>

   

   <div class="form-group">
      <label class="col-sm-2 control-label">类型选择</label>
      <div class="col-sm-10">
      <select class="form-control" style="width:40%;display: inline-block;" name="type" id="type">
         <option value="guanli" >管理</option>
         <option value="user">用户</option>
         <option value="putong">普通</option>
      </select>
      <span id="tCH" class="glyphicon glyphicon-ok" style="color: green;display: none;"></span>
         <span id="tCHW" class="glyphicon glyphicon-remove" style="color: red;display: none;"></span>
      </div>
   </div>
   
   <button type="submit" id="subBtn" class="btn btn-default" name="sub">提交申请</button>
   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
   <button type="reset" id="subBtn" class="btn btn-default">重新输入</button>
   
</form>

</body>
</html>