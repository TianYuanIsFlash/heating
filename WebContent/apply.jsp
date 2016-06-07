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
	bottom:33px;
	left:500px;
	}
  </style>

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



<form class="form-horizontal" role="form" id="myposition" action="applyInsertAction" method="post">
   <div class="form-group">
      <label class="col-sm-2 control-label">姓名</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;" name="hot_user.user_name">
      </div>
   </div>

   <div class="form-group">
      <label for="inputPassword" class="col-sm-2 control-label">
         区域
      </label>
      <div class="col-sm-10">
         <input class="form-control" id="disabledInput" type="text" 
            value="县城区域（乡镇区域暂不提供供暖）" placeholder="县城区域（乡镇区域暂不提供供暖）" disabled style="width:40%;">
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">身份证号码</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;" name="hot_user.id_num">
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">性别</label>
      <div class="col-sm-10">
      <select class="form-control" id="hot" style="width:40%;" name="hot_user.sex">
         <option id="man" value="man" selected="selected">男</option>
         <option id="woman" value="woman">女</option>
      </select>
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">手机号</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;" name="hot_user.telephone_no">
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">地址</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;" name="hot_user.user_adress">
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">小区名字</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;" name="hot_village.name">
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">楼号</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;" name="hot_village_detail.house_no">
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">单元号</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;" name="hot_village_detail.unit_no">
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">楼层号</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;" name="hot_village_detail.floor_no">
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">房间号</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;" name="hot_village_detail.room_no">
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">房间面积</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;" name="hot_village_detail.area">
      </div>
   </div>

   <div class="form-group">
      <label class="col-sm-2 control-label">供暖计费类型</label>
      <div class="col-sm-10">
      <select class="form-control" style="width:40%;" name="hot_cost.heating_cost_type">
         <option value="flow" >热流量</option>
         <option value="area" selected="selected">平方米</option>
      </select>
      <button type="submit" id="subBtn" class="btn btn-default">提交申请</button>
	  <button type="reset" id="subBtn" class="btn btn-default">重新输入</button>
      </div>
   </div>
   
</form>

</body>
</html>