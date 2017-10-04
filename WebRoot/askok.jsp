<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="common.jsp" %>
<%@ page import = "java.util.Date"%>
<link href="forindex/style.css" rel="stylesheet" type="text/css">


<%

request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
 String yourname = (String)session.getAttribute("name");
 %>
 
 <%if(user.checkRepay(yourname)){ %>
 <% 
 user.getID(yourname);
 user.id++;
 String youramount =request.getParameter("amount");
 int num1=Integer.parseInt(youramount);
 
 String yourreason =request.getParameter("reason");
 String yourcycle =request.getParameter("cycle");
 int num2=Integer.parseInt(yourcycle);
 
 String yourrate =request.getParameter("rate");
 
 
 String ss =request.getParameter("s2");
 if(ss==null){
 Timestamp asktime =new java.sql.Timestamp(new java.util.Date().getTime());
  user.askloan(yourname,user.id,num1,yourreason,num2,yourrate,asktime);
}
else {
  user.storeloan(yourname,user.id,num1,yourreason,num2,yourrate,1);
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
<body><br><table>
<tr>

<td>成功 该页面将在 </td>
<td> <div class="STYLE1" id= "time"> 3 </div> </td>
<td>秒后自动跳转 </td>
</tr>
</table>
</body>

<%}else{ %>
你有贷款没有还，请先还款后再发布求助贷款信息
<br><br/>
<p><a href="form2.jsp">你的还款界面</a></p>

<%} %>





</html>

