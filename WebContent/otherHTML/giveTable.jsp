<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>居民供暖管理系统-提供加载table</title>
</head>
<body>
  <table class="table table-hover" id="tableLoad">
   <caption>数据汇总(RMB)：</caption>
   <thead>

   </thead>
   <tbody>
         <tr> 
         <th>收费总额：</th>  
         <th>
                       <%=session.getAttribute("allC") %>元
         </th>      
      </tr>
      
      <tr>   
         <th>欠费总额：</th>
         <th>
                       <%=session.getAttribute("allA") %>元
         </th>      
      </tr>
      
      <tr> 
         <th>设备费用：</th>  
         <th>
                       <%=session.getAttribute("allE") %>元
         </th>      
      </tr>
      
      <tr> 
         <th>人工费用：</th>  
         <th>
                       <%=session.getAttribute("allM") %>元
         </th>      
      </tr>
      
      <tr> 
         <th>其他费用：</th>  
         <th>
                       <%=session.getAttribute("allO") %>元
         </th>      
      </tr>
   </tbody>
</table>
</body>
</html>