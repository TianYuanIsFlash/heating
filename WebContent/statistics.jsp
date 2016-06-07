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
  
<script>
   $(function () { $('#myModal').modal({
      keyboard: true
      show:false
   })});
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



<table class="table table-hover" data-toggle="modal" data-target="#myModal">
   <caption>维修维护统计：</caption>
   <thead>
      <tr>
         <th>站点</th>
         <th>维修</th>
         <th>维护</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>冯东</td>
      </tr>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>冯东</td>
      </tr>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>冯东</td>
      </tr>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>冯东</td>
      </tr>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>冯东</td>
      </tr>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>冯东</td>
      </tr>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>冯东</td>
      </tr>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>冯东</td>
      </tr>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>冯东</td>
      </tr>
      
      
      
   </tbody>
</table>



       <ul class="pagination">
          
		  <li><a href="#">&laquo;</a></li>
		  <li><a href="#">1</a></li>
		  <li><a href="#">2</a></li>
		  <li><a href="#">3</a></li>
		  <li><a href="#">4</a></li>
		  <li><a href="#">5</a></li>
		  <li><a href="#">...1</a></li>
		  <li><a href="#">&raquo;</a></li>
		  
		  <li><form action="" method="post">
		   <input type="text" name="result" size="1" style="width: 40px;height: 33px" pattern="^[0-9]{1,9}$" title="小于1000000000的正整数！">
		   <input type="button" value="跳转" style="height: 30px;">
		  </form></li>
		  
		  
		</ul>
		<span>总页数：<u style="color: blue;">1</u> |&nbsp;当前页：<u style="color: blue;">1</u> |&nbsp; 每页：<u style="color: blue;">9</u>条记录</span>
		<span class="glyphicon glyphicon-align-justify" style="position:relative;left: 10px;"><span class="badge pull-right">1</span>
		
		</span>
 


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
               详情，按下 ESC 按钮退出。
            </h4>
         </div>
         <form class="form-horizontal" role="form" method="post" action="quitAction">
         <div class="modal-body">
            <table class="table table-striped">
   
   <thead>
      <tr>
         <th>站点</th>
         <th>人员</th>
         <th>时间</th>
         <th>材料</th>
         <th>备注</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>2016/03/20</td>
         <td>钢制管道</td>
         <td>完成</td>
      </tr>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>2016/03/20</td>
         <td>钢制管道</td>
         <td>完成</td>
      </tr>
      <tr>
         <td>塘沽</td>
         <td>李宇</td>
         <td>2016/03/20</td>
         <td>钢制管道</td>
         <td>完成</td>
      </tr>
   </tbody>
</table>

			  

			  

			
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            
            <button type="button" class="btn btn-primary" id="sbtn" data-dismiss="modal">
            
                                    确定
                                 
            </button>
            
         </div>
         </form>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>