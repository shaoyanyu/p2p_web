<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="common.jsp" %>
<%@ page import = "java.util.Date"%>



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

<title>hello</title>
<style type="text/css">
</style>
</head>
<body>
<table>
<tr>

<%if(user.checkOnTime("1")==1){ %>
ontime
<%}else{ %>
not ontime
<%} %>
<%=user.checkOnTime("1") %>


<td>还款成功 你好 该页面将在 </td>
<td> <div class="STYLE1" id= "time"> 3 </div> </td>
<td>秒后自动跳转 </td>
</tr>
</table>



</body>



</html>


