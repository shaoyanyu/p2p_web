<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="common.jsp" %>
<%@ page import = "java.util.Date"%>
<link href="forindex/style.css" rel="stylesheet" type="text/css">


<form name="frm" method="post" action="countByTime.jsp">
 <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
 <% String starttime =request.getParameter("starttime"); %>
 <% String endtime =request.getParameter("endtime");
     int result =0; %>
 <%if((starttime !=null)&&(endtime!=null)){ %>
 <% result =user.countByTime(starttime,endtime); 
       //result =1;%>
 <%} %>

 
<html>
 
<font color="#0000dd" size="5">起始时间</font><input id="d11" class="active textbox" name="starttime"  type="text" onClick="WdatePicker()"/><br><br>  
 
<font color="#0000dd" size="5">终止时间</font><input id="d12" class="active textbox" name="endtime" type="text"  onClick="WdatePicker()"/>


<li class="active"><div class="form"><input type="submit" value="计算成交总额"> 

<%if(starttime !=null){ %>
<font color="#0000dd" size="5">
从<%=starttime%>到<%=endtime%>的网上成交总额为
<%=result %>元
</font>
<%} %>
</html>