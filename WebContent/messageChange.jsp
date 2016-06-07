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
	  //输入的值变化即会触发
	  $(".form-control").bind("input propertychange", function() { 
		  $.ajax({
			  type:"post",
			  url:"messageChangeAction",
			  data:{id:$(".form-control").val()},
			  dataType:"json",
			  success:function(data){
				  $(function(){
					  $.each(data.array,function(index){
						  $.each(data.array[index],function(key,value){
							  
							  if(key=="user_name"){$(".user_name").html(value);}
							  if(key=="id_num"){$(".id_num").html(value);}
							  if(key=="sex"){$(".sex").html(value);}
							  if(key=="telephone_no"){$(".telephone_no").html(value);}
							  if(key=="user_adress"){$(".user_adress").html(value);} 
						  }); 
					  });			  
				  });
				  
				  //修改用户名
				  $(function(){
					  $("#edit_user_name_btn").on("click",function(){
						  $.ajax({
							  type:"post",
							  url:"edituser_nameAction",
							  data:{user_name:$("#edit_user_name_text").val(),
								    id_num:$("#id_num_p").text(),
								    sex:$("#sex_p").text(),
								    telephone_no:$("#telephone_no_p").text(),
								    user_adress:$("#user_adress_p").text()
								  },
							  dataType:"json",
							  success:function(data){
								  $(".user_name").html(data.user_name);
							  },error:function(){
								  alert("网络错误！请重试！");
							  }
						  });
					  });
				  });
				  //修改身份证号码
				  $(function(){
					  $("#edit_id_num_btn").on("click",function(){
						  $.ajax({
							  type:"post",
							  url:"editid_numAction",
							  data:{user_name:$("#user_name_p").text(),
								    id_num:$("#edit_id_num_text").val(),
								    sex:$("#sex_p").text(),
								    telephone_no:$("#telephone_no_p").text(),
								    user_adress:$("#user_adress_p").text()
								    },
							  dataType:"json",
							  success:function(data){
								  $(".id_num").html(data.id_num);
							  },error:function(){
								  alert("网络错误！请重试！");
							  }
						  });
					  });
				  });
				  
				  //修改性别
				  $(function(){
					  $("#edit_sex_btn").on("click",function(){
						  $.ajax({
							  type:"post",
							  url:"editsexAction",
							  data:{user_name:$("#user_name_p").text(),
								    id_num:$("#id_num_p").text(),
								    sex:$("#edit_sex_text").val(),
								    telephone_no:$("#telephone_no_p").text(),
								    user_adress:$("#user_adress_p").text()
								    },
							  dataType:"json",
							  success:function(data){
								  $(".sex").html(data.sex);
							  },error:function(){
								  alert("网络错误！请重试！");
							  }
						  });
					  });
				  });
				  //手机号
				  $(function(){
					  $("#edit_telephone_no_btn").on("click",function(){
						  $.ajax({
							  type:"post",
							  url:"edittelephone_noAction",
							  data:{user_name:$("#user_name_p").text(),
								    id_num:$("#id_num_p").text(),
								    sex:$("#sex_p").text(),
								    telephone_no:$("#edit_telephone_no_text").val(),
								    user_adress:$("#user_adress_p").text()
								    },
							  dataType:"json",
							  success:function(data){
								  $(".telephone_no").html(data.telephone_no);
							  },error:function(){
								  alert("网络错误！请重试！");
							  }
						  });
					  });
				  });
				  //住址
				  $(function(){
					  $("#edit_user_adress_btn").on("click",function(){
						  $.ajax({
							  type:"post",
							  url:"edituser_adressAction",
							  data:{user_name:$("#user_name_p").text(),
								    id_num:$("#id_num_p").text(),
								    sex:$("#sex_p").text(),
								    telephone_no:$("#telephone_no_p").text(),
								    user_adress:$("#edit_user_adress_text").val()
								    },
							  dataType:"json",
							  success:function(data){
								  $(".user_adress").html(data.user_adress);
							  },error:function(){
								  alert("网络错误！请重试！");
							  }
						  });
					  });
				  });
				  
				  //切换
				  $(function(){
					  $(".edit_user_name").on("mouseout",function(){
						  //$(".user_name").toggle();
						  $(".edit_user_name").toggle();	  
					  });
					  });
				  
				  $(function(){
					  $(".edit_id_num").on("mouseout",function(){
						  //$(".user_name").toggle();
						  $(".edit_id_num").toggle();	  
					  });
					  });
				  
				  $(function(){
					  $(".edit_sex").on("mouseout",function(){
						  //$(".user_name").toggle();
						  $(".edit_sex").toggle();	  
					  });
					  });
				  
				  $(function(){
					  $(".edit_telephone_no").on("mouseout",function(){
						  //$(".user_name").toggle();
						  $(".edit_telephone_no").toggle();	  
					  });
					  });
				  
				  $(function(){
					  $(".edit_user_adress").on("mouseout",function(){
						  //$(".user_name").toggle();
						  $(".edit_user_adress").toggle();	  
					  });
					  });
				  
				  $(function(){
					  $(".user_name").on("click",function(){
						  //$(".user_name").toggle();
						  $(function(){
							  $(".edit_user_name").toggle();
						  }); 			  	  
					  });
					  });
				  
				  $(function(){
					  $(".id_num").on("click",function(){
						  //$(".user_name").toggle();
						  $(function(){
							  $(".edit_id_num").toggle();
						  }); 			  	  
					  });
					  });
				  
				  $(function(){
					  $(".sex").on("click",function(){
						  //$(".user_name").toggle();
						  $(function(){
							  $(".edit_sex").toggle();
						  }); 			  	  
					  });
					  });
				  
				  $(function(){
					  $(".telephone_no").on("click",function(){
						  //$(".user_name").toggle();
						  $(function(){
							  $(".edit_telephone_no").toggle();
						  }); 			  	  
					  });
					  });
				  
				  $(function(){
					  $(".user_adress").on("click",function(){
						  //$(".user_name").toggle();
						  $(function(){
							  $(".edit_user_adress").toggle();
						  }); 			  	  
					  });
					  });
			  },error:function(){
				  $(".user_name").html("无");
				  $(".id_num").html("无");
				  $(".sex").html("无");
				  $(".telephone_no").html("无");
				  $(".user_adress").html("无");
			  },complete:function(){
				  //局部完成函数
				  
			  }
		  });
		 });  
  });
  
  </script>
  
  <script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
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




  <form class="form-horizontal" role="form" id="myposition" action="applyInsertAction" method="post">
   <div class="form-group">
      <label class="col-sm-2 control-label">身份证号码</label>
      <div class="col-sm-10">
         <input class="form-control" id="focusedInput" type="text" 
            value="" style="width:40%;" name="" data-toggle="tooltip" data-placement="right" 
   title="想要变更?鼠标点击下方显示的信息">
      </div>
   </div>
  </form>
  
  <table class="table table-hover">
   <caption>你的信息：</caption>
   <thead>
      <tr>
         <th>序号</th>
         <th>姓名</th>
         <th>身份证</th>
         <th>性别</th>
         <th>手机号</th>
         <th>地址</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>1</td>
         <td><p class="user_name" id="user_name_p"></p><input type="text" class="edit_user_name" id="edit_user_name_text" placeholder="请输入变更：" style="display: none;height:30px;width:200px;"><input type="button" class="edit_user_name" id="edit_user_name_btn" style="display: none;height:30px;" value="变更"></td>
         <td><p class="id_num" id="id_num_p"></p><input type="text" class="edit_id_num" id="edit_id_num_text" placeholder="请输入变更：" style="display: none;height:30px;width:200px;"><input type="button" class="edit_id_num" id="edit_id_num_btn" style="display: none;height:30px;" value="变更"></td>
         <td><p class="sex" id="sex_p"></p><input type="text" class="edit_sex" id="edit_sex_text" placeholder="请输入变更：" style="display: none;height:30px;width:200px;"><input type="button" class="edit_sex" id="edit_sex_btn" style="display: none;height:30px;" value="变更"></td>
         <td><p class="telephone_no" id="telephone_no_p"></p><input type="text" class="edit_telephone_no" id="edit_telephone_no_text" placeholder="请输入变更：" style="display: none;height:30px;width:200px;"><input type="button" class="edit_telephone_no" id="edit_telephone_no_btn" style="display: none;height:30px;" value="变更"></td>
         <td><p class="user_adress" id="user_adress_p"></p><input type="text" class="edit_user_adress" id="edit_user_adress_text" placeholder="请输入变更：" style="display: none;height:30px;width:200px;"><input type="button" class="edit_user_adress" id="edit_user_adress_btn" style="display: none;height:30px;" value="变更"></td>
      </tr>
      <tr>
         <td>2</td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
      </tr>
      <tr>
         <td>3</td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
      </tr>
   </tbody>
</table>
</body>
</html>