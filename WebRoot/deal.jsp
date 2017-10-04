<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="common.jsp" %>
<%@ page import = "java.util.Date"%>


<%

 String yourname = (String)session.getAttribute("name");
 //user.getID(yourname);
 //user.id++;
 //String youramount =request.getParameter("amount");
 //String yourreason =request.getParameter("reason");
// String yourcycle =request.getParameter("cycle");
// String yourrate =request.getParameter("rate");
  Timestamp dealtime =new java.sql.Timestamp(new java.util.Date().getTime());
 
// user.repay(yourname,user.id,youramount,yourreason,yourcycle,yourrate,asktime);

 

%>
<%
 String no[] = request.getParameterValues("ss");
 for(int i =0;i<no.length;i++){
 int j=Integer.parseInt(no[i]);
 user.makedeal(j,dealtime,yourname);
 
 }
 
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
<title>hello</title>
<style type="text/css">
</style>
</head>
<body>
<table>
<tr>


<td>放贷成功 你好 该页面将在 </td>
<td> <div class="STYLE1" id= "time"> 3 </div> </td>
<td>秒后自动跳转 </td>
</tr>
</table>



</body>



</html>

