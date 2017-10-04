<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ include file="common.jsp" %>
<%@ page import = "java.util.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.io.*"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<title>form4</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-script-type" content="text/javascript">
<meta http-equiv="content-style-type" content="text/css">
<meta http-equiv="content-language" content="en-gb">
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="forindex/dataTable.css" media="screen">
<style type="text/css">
body, th, td { font-family: Arial, Verdana, sans-serif; font-size: 0.9em; }
a:link, a:visited { color: #59B337; }
a:hover, a:active, a:focus { color: #000000; }
table.dataTable tr.marked { background-color: #FFD900; }
</style>
<!-- jquery packed -->
<script type="text/javascript" src="js/jquery-1.2.3.pack.js"></script>
<!-- tableRowCheckboxToggle -->
<script type="text/javascript" src="js/tableRowCheckboxToggle.js"></script>
</head>
<%
 //String yourname = (String)session.getAttribute("name");
String name =(String)request.getParameter("name");
Connection con = null;
	 Statement stmt ;
	 ResultSet rs=null;
	 PreparedStatement prepStmt=null;
	  
try{
	 con=user.getConnection();
	 stmt =con.createStatement();
	
	  String sql ="select amount,id from loan where helper!='NULL' and store = 0 and name =?  order by amount  ";
	  prepStmt = con.prepareStatement(sql);
	    prepStmt.setString(1, name);
	      rs = prepStmt.executeQuery();
  %>
<h1></h1>
    
  
    <table border="1" cellspacing="0" cellpadding="0" class="dataTable" width="1140" height="209">
  <thead>
    <tr>
      <th class="dataTableHeader">是否及时</th>
      <th class="dataTableHeader">金额 </th>
    

    </tr>
    </thead>
  
    
    <%
    while(rs.next()){
    int amount =rs.getInt(1);
    //Timestamp asktime =rs.getTimestamp(2);
    //Timestamp dealtime =rs.getTimestamp(3);
    //Timestamp repaytime =rs.getTimestamp(4);
    //String sn =rs.getString(4);
    int id1 =rs.getInt(2);
    String s = Integer.toString(id1);
     %>  
  <tbody>  
  <tr class="odd_row">
      <%if(user.checkOnTime2(s)==1){ %>
      <td>是</td>
      <%}else{ %>
      <td>否</td>
   <%} %>

     <td style="white-space: nowrap"><%=amount %></td>
     
    </tr>             
 

<%
} %>
</tbody>
</table>
<%
stmt.close();
user.closeResultSet(rs);
user.closeConnection(con);
}catch(Exception e){out.println(e.getMessage());}
%>
  

<div id="index"></div>
<div id="excludeCheckboxesWithName"></div>
<div id="excludeCheckboxesWithId"></div>
<div id="excludeCheckboxesWithClass"></div>

<div style="width:550px;margin:20px auto;">
<p><strong><a href="http://js.mobanwang.com" target="_blank"></a></strong> </p>

<p></p>
</div>


</BODY></HTML>
