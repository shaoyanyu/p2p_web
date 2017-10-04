<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="common.jsp" %>
<%@ page import = "java.util.Date"%>
<link href="forindex/style.css" rel="stylesheet" type="text/css">


<%

 //String yourname = (String)session.getAttribute("name");
 //user.getID(yourname);
 //user.id++;
 //String youramount =request.getParameter("amount");
 //String yourreason =request.getParameter("reason");
// String yourcycle =request.getParameter("cycle");
// String yourrate =request.getParameter("rate");
 Timestamp repaytime =new java.sql.Timestamp(new java.util.Date().getTime());
 
%>
<%

 
 String no[] = request.getParameterValues("ss");
 for(int i =0;i<no.length;i++){
 int j=Integer.parseInt(no[i]);
 user.repay(j,repaytime);

 }
 //user.BulidBad();

//request.getParameterValues("amount");
 
 %>


<html>
<script language="javascript">
var times=4;
clock();
function clock()
{
   window.setTimeout('clock()',1000);
   times=times-1;
   time.innerHTML =times;
}
</script>

<head>
<meta http-equiv= "Refresh" content= "3;url=index1.jsp ">
<title>repay</title>
<style type="text/css">
</style>
</head>
<body>
<table>
<tr>
<%for(int i =0;i<no.length;i++){
     if(user.checkOnTime(no[i])==0){ 
       int num=Integer.parseInt(no[i]);
       user.SignBad(num);
      %>
      订单<%=no[i] %>没有按期还款，还款时间已经超时
      <%}
      } %>




<td>还款成功 你好 该页面将在 </td>
<td> <div class="STYLE1" id= "time"> 3 </div> </td>
<td>秒后自动跳转 </td>
</tr>
</table>



</body>



</html>

