<%@ page import="mypack.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import = "java.util.Date"%>


<jsp:useBean id="user" scope="application" class="mypack.userDB"/>

<%!
   public String convert(String s){
    try{
     	return new String(s.getBytes("ISO-8859-1"),"GB2312");
    }catch(Exception e){return null;}
   }
%>
