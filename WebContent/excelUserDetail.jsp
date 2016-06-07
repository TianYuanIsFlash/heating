<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="application/vnd.ms-excel; charset=gbk" %>
<%@page import="java.text.SimpleDateFormat"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
 <%
 SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
 String filename = new String(("户主综合明细报表-"+sf.format(new Date())).getBytes("utf-8"),"ISO-8859-1");      
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





<table class="table table-hover">
   
   <thead>
   <tr>
      
         <th colspan="14">
                          户主综合明细报表
         
         </th>
        
   </tr>
      
   </thead>
   <tbody>
      <tr style="border:2px black solid;">
         <th>序号</th>
         <th>姓名</th>
         <th>生份证号</th>
         <th>手机</th>
         <th>入网时间</th>
         <th>所在小区</th>
         <th>楼号</th>
         <th>单元号</th>
         <th>楼层号</th>
         <th>房间号</th>
         <th>供暖状态</th>
         <th>房间面积</th>
         <th>暖气费用</th>
         <th>计费类型</th>
         <th>缴费时间</th>
      </tr>
    <c:forEach var="u" items="${requestScope.listUserAll}">
      <tr style="border:1px black solid;">
         <td>${u.rownum}</td>
         <td>${u.user_name}</td>
         <td>${u.id_num}</td>
         <td>${u.telephone_no}</td>
         <td>${u.join_date}</td>
         <td>${u.name}</td>
         <td>${u.house_no}</td>
         <td>${u.unit_no}</td>
         <td>${u.floor_no}</td>
         <td>${u.room_no}</td>
         <td>${u.state}</td>
         <td>${u.area}</td>
         <td>${u.amount}</td>
         <td>${u.heating_cost_type}</td>
         <td>${u.update_date}</td>
         
      </tr>
    </c:forEach> 
         
    
      
   </tbody>
</table>

 </div>

</body>
</html>
