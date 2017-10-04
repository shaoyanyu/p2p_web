<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<form name="frm" method="post" action="askok2.jsp">
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="common.jsp" %>
<%

 String no[] = request.getParameterValues("ss");
 session.setAttribute("id",no[0]);
 user.getLoan(no[0]);
 %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://gmpg.org/xfn/11">
<title>form1</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="forindex/demo.css" type="text/css" media="all" />
</head>
<body>

<form class="form">
  <p class="amount">
    <input type="number" name="amount" id="amount" value="<%=user.amount0 %>"/>
    <label for="amount">金额</label>
  </p>
  <p class="reason">
    <input type="text" name="reason" id="reason" value="<%=user.reason0 %>"  />
    <label for="reason">用途</label>
  </p>
  <p class="cycle">
    <input type="number" name="cycle" id="cycle" value="<%=user.cycle0 %>" />
    <label for="cycle">周期</label>
  </p>
  <p class="rate">
    <input type="text" name="rate" id="rate" value="<%=user.rate0 %>"/>
    <label for="rate">利率</label>
  </p>
  
  <p class="submit"> 
    <input type="submit" name ="s1" value="发送" /><br /></p>
  <p class="submit">
     <input type="submit" name ="s2" value="暂时保存" /> 
     
  </p>
  <p><strong><a href="form1_2.jsp" target="_blank">草稿箱</a></strong> </p>

 <style>
body{background-color:lightblue}
</style>

</form>

</body>
</html>