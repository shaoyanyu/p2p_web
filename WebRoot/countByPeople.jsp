<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="common.jsp" %>
<%@ page import = "java.util.Date"%>
<link href="forindex/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="forindex/dataTable.css" media="screen">

<% user.countByPeople();%>
<html> 
 <br>总人数<%=user.Pcount%> <br/>
 总共发放贷款<%=user.sum1%>
 &nbsp;总共收取贷款<%=user.sum2%>
  &nbsp;总共坏账<%=user.sum3%>

<%
Connection con = null;
	 Statement stmt ;
	 ResultSet rs=null;
try{
	 con=user.getConnection();
	 stmt =con.createStatement();
	 int totalCount=0;
	 rs =stmt.executeQuery("SELECT COUNT(DISTINCT S.HELPER) from loan S;");
	 if(rs.next())
	  totalCount =rs.getInt(1);
	 String sql ="select DISTINCT S.HELPER FROM LOAN S WHERE S.HELPER !='NULL'";
	 rs =stmt.executeQuery(sql);

%>
    <table border="1" cellspacing="0" cellpadding="0" class="dataTable" width="1140" height="209">
  <thead>
    <tr>
      <th class="dataTableHeader">用户名</th>
      <th class="dataTableHeader">发放贷款总额</th>
      <th class="dataTableHeader">收取贷款总额</th>
      <th class="dataTableHeader">坏账总额</th>
     
    </tr>
    </thead>

  
   
    <%
    while(rs.next()){
    String helper =rs.getString(1);
    int sum1 =user.getSum1(helper);
    int sum2 =user.getSum2(helper);
    int sum3 =user.getSum3(helper);
      
     %> 
     <tr>
<td><%=helper %></td>
<td><%=sum1 %></td>
<td><%=sum2 %></td>
<td><%=sum3 %></td>
</tr>          
    
 <%
} %>
</table>
<%
stmt.close();
user.closeResultSet(rs);
user.closeConnection(con);
}catch(Exception e){out.println(e.getMessage());}

 %>
  
    
    
  
  
 </html>