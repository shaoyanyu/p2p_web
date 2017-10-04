<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<form name="frm" method="post" action="form1_3.jsp">
<%@ include file="common.jsp" %>
<%@ page import = "java.util.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.io.*"%>
<%@ page import = "java.sql.*"%>
<html>
<head>
<title>form1_2</title>
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
 String yourname = (String)session.getAttribute("name");

Connection con = null;
	 Statement stmt ;
	 ResultSet rs=null;
	 PreparedStatement prepStmt=null;
	  
try{
	 con=user.getConnection();
	 stmt =con.createStatement();




	final int e=3;
	int totalPages =0;
	int currentPage=1;
	int totalCount=0;
	int p=0;
	
	String tempStr =request.getParameter("currentPage");
	if(tempStr!=null && !tempStr.equals(""))
	  currentPage =Integer.parseInt(tempStr);
	  
	  
	 String sql1 ="select count(*) from loan where dealTime = '0000-00-00 00:00:00' and store=1 and name =?;";
	 prepStmt = con.prepareStatement(sql1);
	 prepStmt.setString(1, yourname);
	 rs = prepStmt.executeQuery();
	 if(rs.next())
	  totalCount =rs.getInt(1);
	  
	  totalPages = ((totalCount%e==0)?(totalCount/e):(totalCount/e+1));
	  if(totalPages==0) totalPages =1;
	  
	  if(currentPage>totalPages)
	    currentPage =totalPages;
	  else if (currentPage<1)
	    currentPage=1;
	    
	  p=(currentPage-1)*e;
	  String sql ="select amount,asktime,name,cycle,rate,reason,id from loan where dealTime = '0000-00-00 00:00:00' and store=1 and NAME=? order by amount limit "+p+","+e;
	  prepStmt = con.prepareStatement(sql);
	      prepStmt.setString(1, yourname);
	      rs = prepStmt.executeQuery();
  %>
<h1>草稿箱</h1>



 <%
  for(int i =1;i<=totalPages;i++){
      if(i ==currentPage){
   %>
     <%=i %>
   <%  }else{ %>
         <a href = "form1_2.jsp?currentPage=<%= i%>"><%=i %></a>   
    <% } %>
    <%} %>

    &nbsp;共<%=totalPages %>页,共<%=totalCount %>条记录
    
  
    <table border="1" cellspacing="0" cellpadding="0" class="dataTable" width="1140" height="209">
  <thead>
    <tr>
      <th class="dataTableHeader"></th>
      <th class="dataTableHeader">金额 </th>
      <th class="dataTableHeader">请求时间 </th>
      <th class="dataTableHeader">名字</th>
       <th class="dataTableHeader">周期</th>
       <th class="dataTableHeader">利率</th>
        <th class="dataTableHeader">用途</th>
      
    </tr>
    </thead>
  
    
    <%
    while(rs.next()){
    int amount =rs.getInt(1);
    Timestamp asktime =rs.getTimestamp(2);
    String name =rs.getString(3);
    int cycle =rs.getInt(4);
    String rate =rs.getString(5);
    String reason =rs.getString(6); 
    int id =rs.getInt(7); 
    
     %>  
  <tbody>  
  <tr class="odd_row">
     <td><input type="submit" name ="ss"value="<%=id%>"></td>
      <td><%=amount %></td>
      <td style="white-space: nowrap"><%=asktime %></td>
      

       <td><%=name %></td>
      <td><%=cycle %></td>
      <td><%=rate %></td>
     <td><%=reason %></td>
       
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
<p><strong><a href="http://js.mobanwang.com" target="_blank">ssss</a></strong> </p>

<p></p>
</div>


</BODY></HTML>
