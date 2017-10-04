<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="common.jsp" %>
<%@ page import = "java.util.Date"%>


<%
request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
 String yourname = (String)session.getAttribute("name");
 String yourID =(String)session.getAttribute("id");
 String youramount =request.getParameter("amount");
 int num1=Integer.parseInt(youramount);
 
 String yourreason =request.getParameter("reason");
 
 String yourcycle =request.getParameter("cycle");
 int num2=Integer.parseInt(yourcycle);
 
 String yourrate =request.getParameter("rate");
 int num3=Integer.parseInt(yourID);
 
 
 
 Timestamp asktime =new java.sql.Timestamp(new java.util.Date().getTime());
  user.updateloan(num3,num1,yourreason,num2,yourrate,asktime);

 

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

<td>成功 该页面将在 </td>
<td> <div class="STYLE1" id= "time"> 3 </div> </td>
<td>秒后自动跳转 </td>
</tr>
</table>



</body>



</html>

