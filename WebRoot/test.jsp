<%@ page import = "java.util.*"%>
<%@ page contentType="text/html; charset=GB2312" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="common.jsp" %>
<%@ page import = "java.util.Date"%>
<%@ page import = "java.io.*"%>
<%@ page import = "java.sql.*"%>

<%
Connection con = null;
	 Statement stmt ;
	 ResultSet rs=null;
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
	  
	  
	 rs =stmt.executeQuery("select count(*) from loan;");
	 if(rs.next())
	  totalCount =rs.getInt(1);
	  
	  totalPages = ((totalCount%e==0)?(totalCount/e):(totalCount/e+1));
	  if(totalPages==0) totalPages =1;
	  
	  if(currentPage>totalPages)
	    currentPage =totalPages;
	  else if (currentPage<1)
	    currentPage=1;
	    
	  p=(currentPage-1)*e;
	  String sql ="select amount,asktime,name,cycle,rate,reason from loan order by cycle limit "+p+","+e;
	  rs =stmt.executeQuery(sql);
  %>
  <%
  for(int i =1;i<=totalPages;i++){
      if(i ==currentPage){
   %>
     <%=i %>
   <%  }else{ %>
         <a href = "test.jsp?currentPage=<%= i%>"><%=i %></a>   
    <% } %>
    <%} %>
    &nbsp;PAGE<%=totalPages %>,jilu<%=totalCount %>
    <table border ="1" width=400>
    <tr>
    <td bgcolor ="#D8E4F1"><b>amount</b></td>
    <td bgcolor ="#D8E4F1"><b>asktime</b></td>
    <td bgcolor ="#D8E4F1"><b>name</b></td>
    <td bgcolor ="#D8E4F1"><b>cycle</b></td>
    <td bgcolor ="#D8E4F1"><b>rate</b></td>
    <td bgcolor ="#D8E4F1"><b>reason</b></td>
    
    </tr>
    <%
    while(rs.next()){
    String amount =rs.getString(1);
    Date asktime =rs.getDate(2);
    String name =rs.getString(3);
    String cycle =rs.getString(4);
    String rate =rs.getString(5);
    String reason =rs.getString(6);  
    
     %>           
 
<tr>
<td><%=amount %></td>
<td><%=asktime %></td>
<td><%=name %></td>
<td><%=cycle %></td>
<td><%=rate %></td>
<td><%=reason %></td>

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
  

 

