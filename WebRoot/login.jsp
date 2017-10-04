<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="common.jsp" %>

<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
String yourname =request.getParameter("name");

//yourname  = new String(yourname.getBytes("ISO8859-1"),"UTF-8");

String yourkeyword =request.getParameter("keyword");
int length = yourname.length();
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
<%if(user.checkLogin(yourname)){ %>
<head>
<meta http-equiv= "Refresh" content= "3;url=index.jsp ">
<title>hello</title>
<style type="text/css">
</style>
</head>
<body>
<table>
<tr>
<td>用户名已经存在请重新注册<br><br>你好 <%=yourname %> 该页面将在 </td>
<td> <div class="STYLE1" id= "time"> <br><br>3 </div> </td>
<td><br><br>秒后自动跳转 </td>
</tr>
</table>
</body>

<body><br><br><br></body>
<%}else {
if(length<5){
user.regist(yourname,yourkeyword);
session.setAttribute("name",yourname); %>
<head>
<meta http-equiv= "Refresh" content= "3;url=index1.jsp ">
<title>hello</title>
<style type="text/css">
</style>
</head>
<body>
<table>
<%=length %>
<tr>
<td>注册成功<br><br>你好 <%=yourname %> 该页面将在 </td>
<td> <div class="STYLE1" id= "time"> <br><br>3 </div> </td>
<td><br><br>秒后自动跳转 </td>
</tr>
</table>
</body>
<%}
else{ %>
用户名长度不得超过5
<%}
} %>



</html>

  