<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="common.jsp" %>


<%
request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
String yourname =request.getParameter("name");
//yourname  = new String(yourname.getBytes("ISO8859-1"),"UTF-8");

String yourkeyword =request.getParameter("keyword");
%>
  

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
<html>
<%if(user.checkSignin(yourname,yourkeyword)==-1){ %>
<head>
<meta http-equiv= "Refresh" content= "3;url=index0.jsp ">
<title>hello</title>
<style type="text/css">
</style>
</head>
<body>
<table>
<tr>
<td>用户名不存在请注册<br><br>你好 <%=yourname %> 该页面将在 </td>
<td> <div class="STYLE1" id= "time"> <br><br>3 </div> </td>
<td><br><br>秒后自动跳转 </td>
</tr>
</table>
</body>

<body><br><br><br></body>
<%}else if(user.checkSignin(yourname,yourkeyword)==1)  {

session.setAttribute("name",yourname); %>
<head>
<meta http-equiv= "Refresh" content= "3;url=index1.jsp ">
<title>hello</title>
<style type="text/css">
</style>
</head>
<body>
<table>
<tr>
<td>登录成功<br><br>你好 <%=yourname %> 该页面将在 </td>
<td> <div class="STYLE1" id= "time"> <br><br>3 </div> </td>
<td><br><br>秒后自动跳转 </td>
</tr>
</table>
</body>
<%} else{ %>
<head>
<meta http-equiv= "Refresh" content= "3;url=index.jsp ">
<title>hello</title>
<style type="text/css">
</style>
</head>
<body>
<table>
<tr>
<td>密码错误<br><br>你好 ， 该页面将在 </td>
<td> <div class="STYLE1" id= "time"> <br><br>3 </div> </td>
<td><br><br>秒后自动跳转 </td>
</tr>
</table>
</body>

<%} %>

</html>

  
