<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="application/vnd.ms-excel; charset=gbk" %>
<%@page import="java.text.SimpleDateFormat"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
 <%
 SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
 String filename = new String(("欠费用户报表-"+sf.format(new Date())).getBytes("utf-8"),"ISO-8859-1");      
 response.addHeader("Content-Disposition", "filename=" + filename + ".xls"); 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>   
    <title>居民供暖管理系统</title>
    <!--title前logo-->
    <link rel="icon" href="img/hotIcon.png" type="image/x-icon"/>  
   </head>
   
<body>

 <table style="border: 2px black solid;">
   
   <thead>
   <tr>      
     <th colspan="14">   
                欠费用户报表
     </th>       
   </tr>
      
   </thead>
<tbody style="border: 2px black solid;">
      <tr style="border: 2px black solid;">
         <th>序号</th>
         <th>姓名</th>
         <th>总额</th>
         <th>暖气费用</th>
         <th>单价-暖气流量（立方米）</th>
         <th>单价-面积（平方米）</th>
         <th>设备费用</th>
         <th>人工费用</th>
         <th>其他费用</th>        
         <th>供暖计费类型</th>
         <th>更新时间</th>
         <th>费用编号</th>
         <th>房间编号</th>
         <th>数据行号</th>
      </tr>
    <c:forEach var="u" items="${requestScope.list}">
      <tr style="border: 1px black solid;">
         <td>${u.rownum}</td>
         <td>${u.user_name}</td>
         <td>${u.amount+u.c_equipment+u.c_man+u.c_other}</td>
         <td>${u.amount}</td>
         <td>${u.u_flow}</td>
         <td>${u.u_area}</td>
         <td>${u.c_equipment}</td>
         <td>${u.c_man}</td>
         <td>${u.c_other}</td>
         <td>${u.heating_cost_type}</td>
         <td>${u.update_date}</td> 
         <td>${u.cost_code}</td>  
         <td>${u.room_code}</td>
         <td>${u.rownum}</td>        
     </tr>
    </c:forEach> 
 
   </tbody>
</table>

</body>
</html>
