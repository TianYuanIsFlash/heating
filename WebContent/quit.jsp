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
  <!--  
  <script type="text/javascript">
  $(document).ready(function(){
	  $("#sbtn").on("click",function(){
		  
		  $("#trAppend").before("<tr id="trAppend"><td><input type="text" disabled="disabled" value="${hot_user_quit.user_name}"></td><td><input type="text" disabled="disabled" value="${hot_user_quit.id_num }"></td><td><input type="text" disabled="disabled" value="${hot_user_quit.sex }"></td></tr>");
	  });
  });
  </script>-->
  

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



<div>
<button class="btn btn-primary btn-lg" style="position:absolute;left:300px;">
   申请退网
</button>

<button class="btn btn-primary btn-lg" style="position:absolute;right:300px;">
   在网状态
</button>
</div>


<div style="display: inline-block;width: 600px;height: 100p;position: absolute;left: 100px;top: 260px;">
<form class="form-horizontal" role="form" method="post" action="quitAction">
         <div class="modal-body">
            

			  

			  <div class="form-group">
              <label class="col-sm-2 control-label">身份证号</label>
              <div class="col-sm-10">
              <input class="form-control" id="focusedInput" type="text" 
               value="" style="width:60%;" name="id_num">
              </div>
              </div>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="submit" class="btn btn-primary" id="sbtn">
                                     退网
            </button>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="reset" class="btn btn-default">取消
            </button>
         </div>
         
         </form>

   
</div>

<div style="display: inline-block;width: 600px;height: 100p;position: absolute;right: 10px;top: 260px;">
<table class="table table-hover">
   
   <thead>
      <tr>
         
         <th>退网操作名单</th>
         <th>身份证</th>
         <th>性别</th>
         
      </tr>
   </thead>
         <tbody>
      <tr id="trAppend">
         
         <td><input type="text" disabled="disabled" value="${hot_user_quit.user_name}"></td>
         <td><input type="text" disabled="disabled" value="${hot_user_quit.id_num }"></td>
         <td><input type="text" disabled="disabled" value="${hot_user_quit.sex }"></td>
      </tr>
      
      <tr>
      <td style="color: red;">是否删除该户主所有信息：</td>
      <td><form method="post" action="deleteAllAction">
            <input type="hidden" value="yesDel" name="choice">
            <input type="submit" class="btn btn-danger" value="退网并删除户主">
          </form>
      </td>
      <td></td>
      
      </tr>
      
      <tr> 
         <td></td>
         <td></td>
         <td></td>
      </tr>
   </tbody>
</table>
</div>

</body>
</html>