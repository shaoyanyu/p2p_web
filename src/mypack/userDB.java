/** 直接通过JDBC API 访问MySQL数据库 */
package mypack;
import java.sql.*;

import javax.naming.*;
import javax.sql.*;
import java.util.*;
import java.util.Date;

public class userDB {

  private String dbUrl =  "jdbc:mysql://localhost:3306/new1?useUnicode=true&characterEncoding=utf-8";
  private String dbUser="root"; //root
  private String dbPwd="yu";// ""
  public int id=0;
  public int amount0 =0;
  public String reason0 =null;
  public int cycle0 =0;
  public String rate0 =null;
  
  public int Pcount =0;
  public int sum1 =0;
  public int sum2 =0;
  public int sum3 =0;

  
  public userDB () throws Exception{
     Class.forName("com.mysql.jdbc.Driver");
     //DriverManager.registerDriver(new com.mysql.jdbc.Driver());
  }

  public Connection getConnection()throws Exception{
      return java.sql.DriverManager.getConnection(dbUrl,dbUser,dbPwd);
  }

  public void closeConnection(Connection con){
    try{
        if(con!=null) con.close();
      }catch(Exception e){
        e.printStackTrace();
      }
  }

  public void closePrepStmt(PreparedStatement prepStmt){
    try{
        if(prepStmt!=null) prepStmt.close();
      }catch(Exception e){
        e.printStackTrace();
      }
  }

  public void closeResultSet(ResultSet rs){
    try{
        if(rs!=null) rs.close();
      }catch(Exception e){
        e.printStackTrace();
      }
  }
  
  public int checkOnTime(String ID) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    Timestamp time1 = null;
	    Timestamp time2 = null;
	    Timestamp time3 =new java.sql.Timestamp(new java.util.Date().getTime());
	    Timestamp time4 = null;
	    int cycle =1;
	    try{
	      con=getConnection();
	      String SelectStatement = "select dealtime,repaytime,cycle from loan where ID = ?";
	      prepStmt = con.prepareStatement(SelectStatement);
	      prepStmt.setString(1, ID);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
		       time1 =rs.getTimestamp(1);
		       time2 =rs.getTimestamp(2);
		       cycle =rs.getInt(3);
		       cycle =cycle+1;
		      }  
	      Calendar cal = Calendar.getInstance();
	      cal.setTime(time1);
	      cal.add(Calendar.DATE,cycle);
	      time1 = new Timestamp(cal.getTime().getTime());
	      if(((time2.compareTo(time1))>0)){
	      return 0;
	      }
	      else return 1;
	      /*
	      if((time2.compareTo(time4))==0){
	    	  if((time3.compareTo(time1))>0){
	    		  return false;
	    	  }
	      }
	      
	      if(((time2.compareTo(time1))>0)){
	         return false;
	      }
	      else {
	    	 return true;
	      }
	     
	      */
	      
	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
	
		
		
}
 
  public int checkOnTime2(String ID) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    String ss=null;
	    try{
	      SignBad2();
	      con=getConnection();
	      String SelectStatement = "select name from loan where id =? and bad=1";
	      prepStmt = con.prepareStatement(SelectStatement);
	      prepStmt.setString(1, ID);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
		       ss =rs.getString(1);
		      }
	      if(ss ==null)
	    	  return 1;
	      else return 0;
	      

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
		
}
  public void SignBad(int id) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    try{
	      con=getConnection();
	      String UpdateStatement = "Update loan l SET l.bad =1 where l.id=?";
	      prepStmt = con.prepareStatement(UpdateStatement);
	      prepStmt.setInt(1, id);
		  prepStmt.executeUpdate();
		           
	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
	
		
		
}
  
  public void SignBad2() throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    Timestamp time1 = null;
	    Timestamp time2 = null;
	    Timestamp time3 = new java.sql.Timestamp(new java.util.Date().getTime());
	    int cycle=1;
	    int id1 =0;
	    int count =0;
	    
	    
	    try{
	    	con=getConnection();
		    String SelectStatement = "select count(*) from loan where helper!='NULL' and repaytime='0000-00-00 00:00:00' and BAD !=1;";
		    prepStmt = con.prepareStatement(SelectStatement);
		    rs = prepStmt.executeQuery();
		      if(rs.next()){      
			       count =rs.getInt(1);
			       //System.out.println(count);
			       
		      }
		      for(int i =0;i<count;i++){
		    	  SelectStatement = "select dealtime,cycle,id from loan where helper!='NULL' and repaytime='0000-00-00 00:00:00' and BAD !=1;";
				    prepStmt = con.prepareStatement(SelectStatement);
				    rs = prepStmt.executeQuery();
				      if(rs.next()){      
					       time1 =rs.getTimestamp(1);
					       cycle =rs.getInt(2);
					       cycle =cycle+1;
					       id1 =rs.getInt(3);
					       
					       Calendar cal = Calendar.getInstance();
					       cal.setTime(time1);
					       cal.add(Calendar.DATE,cycle);
				           time2 = new Timestamp(cal.getTime().getTime());
					       if(((time3.compareTo(time2))>0)){
					           String UpdateStatement = "Update loan l SET l.bad =1 where l.id=?";
					           prepStmt = con.prepareStatement(UpdateStatement);
					           prepStmt.setInt(1, id1);
						       prepStmt.executeUpdate();	
						    }
					       
				      }   
		    	  
				       
			       
		    	  
		      }
		           
	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
	
		
		
}
  
 
  
  public void regist(String name, String keyword) throws Exception {
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    try{
	      con=getConnection();
	      String insertStatement = "insert into USERS(name,keyword) values(?,?)";
	      prepStmt = con.prepareStatement(insertStatement);
	      prepStmt.setString(1, name);
	      prepStmt.setString(2,keyword);
	      prepStmt.executeUpdate();

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
	  }
  
  public void getID(String name) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    try{
	      con=getConnection();
	      String SelectStatement = "select MAX(ID) from loan";
	      prepStmt = con.prepareStatement(SelectStatement);
	      //prepStmt.setString(1, name);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
		       id =rs.getInt(1);
		      }
	      

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
		
  }
  public void getLoan(String ID) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    try{
	      con=getConnection();
	      String SelectStatement = "select amount,reason,cycle,rate from loan where ID = ?";
	      prepStmt = con.prepareStatement(SelectStatement);
	      prepStmt.setString(1, ID);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
		       amount0 =rs.getInt(1);
		       reason0 =rs.getString(2);
		       cycle0 =rs.getInt(3);
		       rate0 =rs.getString(4);
		      }
	      

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
		
}
  
  public int getSum1(String name) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    String ss=null;
	    int sum1=0;
	    try{
	      con=getConnection();
	      
	      String SelectStatement ="SELECT SUM(S.amount) From loan S where s.helper=?;";
	      prepStmt = con.prepareStatement(SelectStatement);
	      prepStmt.setString(1, name);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
	       ss =rs.getString(1);
	      }
	      if(ss!=null)
	          sum1=Integer.parseInt(ss);
	      else
	    	  sum1 =0;
	      return sum1;

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
		
}
  public int getSum2(String name) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    String ss=null;
	    int sum2 =0;
	    try{
	      con=getConnection();
	      String SelectStatement ="SELECT SUM(S.amount) From loan S where s.name=? and s.dealtime !='0000-00-00 00:00:00';";
	      prepStmt = con.prepareStatement(SelectStatement);
	      prepStmt.setString(1, name);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
	       ss =rs.getString(1);
	      }
	      if(ss!=null)
	          sum2=Integer.parseInt(ss);
	      else
	    	  sum2 =0;
	      return sum2;

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
		
}
  
  public int getSum3(String name) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    String ss=null;
	    int sum3 =0;
	    try{	
	      con=getConnection();
	      SignBad2();
	      String SelectStatement ="SELECT SUM(S.amount) From loan S where s.helper=? and s.bad =1;";
	      prepStmt = con.prepareStatement(SelectStatement);
	      prepStmt.setString(1, name);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
	       ss =rs.getString(1);
	      }
	      if(ss!=null)
	          sum3=Integer.parseInt(ss);
	      else
	    	  sum3 =0;
	      return sum3;

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
		
} 
  
  

  public void updateloan(int id,int amount,String reason,int cycle,String rate,Timestamp time1) throws Exception {
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    try{
	      con=getConnection();
	      String updateStatement = "UPDATE LOAN set amount =?,reason =?,cycle =?,rate =?, asktime =?, store =0,BAD=0 where id =?";
	      prepStmt = con.prepareStatement(updateStatement);
	      prepStmt.setInt(1, amount);
	      prepStmt.setString(2, reason);
	      prepStmt.setInt(3,cycle);
	      prepStmt.setString(4,rate);
	      prepStmt.setTimestamp(5, (java.sql.Timestamp) time1);
	      prepStmt.setInt(6,id);
	      
	      prepStmt.executeUpdate();

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
	  }

  
  
  public void askloan(String name, int id,int amount,String reason,int cycle,String rate,Timestamp time1) throws Exception {
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    try{
	      con=getConnection();
	      String insertStatement = "insert into LOAN(name,id,amount,reason,cycle,rate,asktime,store,BAD) values(?,?,?,?,?,?,?,0,0)";
	      prepStmt = con.prepareStatement(insertStatement);
	      prepStmt.setString(1, name);
	      prepStmt.setInt(2, id);
	      prepStmt.setInt(3,amount);
	      prepStmt.setString(4,reason);
	      prepStmt.setInt(5,cycle);
	      prepStmt.setString(6, rate);
	      prepStmt.setTimestamp(7, (java.sql.Timestamp) time1);
	      prepStmt.executeUpdate();

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
	  }
  
  public void makedeal(int id,Timestamp dealtime,String name) throws Exception {
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    try{
	      con=getConnection();
	      String updateStatement = "Update loan set dealtime =?,helper=?  where id =?";
	      prepStmt = con.prepareStatement(updateStatement);
	      prepStmt.setTimestamp(1, (java.sql.Timestamp)dealtime);
	      prepStmt.setString(2,name);
	      prepStmt.setInt(3, id);
	      prepStmt.executeUpdate();

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
	  }
  
 
  
  
  
  public void storeloan(String name, int id,int amount,String reason,int cycle,String rate,int store) throws Exception {
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    try{
	      con=getConnection();
	      String insertStatement = "insert into LOAN(name,id,amount,reason,cycle,rate,store) values(?,?,?,?,?,?,?)";
	      prepStmt = con.prepareStatement(insertStatement);
	      prepStmt.setString(1, name);
	      prepStmt.setInt(2, id);
	      prepStmt.setInt(3,amount);
	      prepStmt.setString(4,reason);
	      prepStmt.setInt(5,cycle);
	      prepStmt.setString(6, rate);
	      prepStmt.setInt(7,store);
	      prepStmt.executeUpdate();

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
	  }

  public void repay(int id,Timestamp repaytime) throws Exception {
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    try{
	      con=getConnection();
	      String updateStatement = "Update loan set repaytime =? where id =?";
	      prepStmt = con.prepareStatement(updateStatement);
	      prepStmt.setTimestamp(1, (java.sql.Timestamp)repaytime);
	      prepStmt.setInt(2, id);
	      prepStmt.executeUpdate();

	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
	  }
  public int checkSignin(String name,String keyword) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    String s1 =null;
	    String s2 =null;
	    try{
	      con=getConnection();
	      String SelectStatement = "select NAME,KEYWORD from users where name=?";
	      prepStmt = con.prepareStatement(SelectStatement);
	      prepStmt.setString(1, name);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
	       s1 =rs.getString(1);
	       s2 =rs.getString(2);
	      }
	      if(s1==null)
	    	  return -1;
	      else if ((s1.equals(name))&&(s2.equals(keyword)))
	    	  return 1;
	      else 
	    	  return 0;
	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
}


  public boolean checkLogin(String name) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    String s1 =null;
	    try{
	      con=getConnection();
	      String SelectStatement = "select NAME,KEYWORD from users where name=?";
	      prepStmt = con.prepareStatement(SelectStatement);
	      prepStmt.setString(1, name);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
	       s1 =rs.getString(1);
	      }
	      if(s1==null)
	    	  return false;
	      else 
	    	  return true;
	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
  }

  public boolean checkRepay(String name) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    String s1 =null;
	    try{
	      con=getConnection();
	      String SelectStatement = "select L.NAME from LOAN L where name=? and repaytime ='0000-00-00 00:00:00'";
	      prepStmt = con.prepareStatement(SelectStatement);
	      prepStmt.setString(1, name);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
	       s1 =rs.getString(1);
	      }
	      if(s1==null)
	    	  return true;
	      else 
	    	  return false;
	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
}

  
  
  public int countByTime(String time1,String time2) throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    String s1 =null;
	    try{
	      con=getConnection();
	      String SelectStatement = "select SUM(l.amount) from loan l where repaytime!='0000-00-00 00:00:00' and repaytime > ? and repaytime < ?";
	      prepStmt = con.prepareStatement(SelectStatement);
	      prepStmt.setString(1, time1);
	      prepStmt.setString(2, time2);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
	       s1 =rs.getString(1);
	      }
	      if(s1!=null){
	      int num=Integer.parseInt(s1);
	      return num;}
	      else
	    	  return 0;
	      
	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
}
  
  public void countByPeople() throws Exception{
	    Connection con = null;
	    PreparedStatement prepStmt=null;
	    ResultSet rs=null;
	    String s1 =null;
	    String s2 =null;
	    String s3 =null;
	    String s4 =null;
	    try{
	      con=getConnection();
	      String SelectStatement =" SELECT COUNT(DISTINCT S.HELPER) from loan S;";
	      prepStmt = con.prepareStatement(SelectStatement);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
	       s1 =rs.getString(1);
	      }
	      if(s1!=null)
	          Pcount=Integer.parseInt(s1);
	      else
	    	  Pcount =0;
	      
	      SelectStatement ="SELECT SUM(S.amount) From loan S where s.helper!='NULL';";
	      prepStmt = con.prepareStatement(SelectStatement);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
	       s2 =rs.getString(1);
	      }
	      if(s2!=null)
	          sum1=Integer.parseInt(s2);
	      else
	    	  sum1 =0;
	      
	      SelectStatement ="SELECT SUM(S.amount) From loan S where s.name!='NULL' and s.dealtime !='0000-00-00 00:00:00';";
	      prepStmt = con.prepareStatement(SelectStatement);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
	       s3 =rs.getString(1);
	      }
	      if(s3!=null)
	          sum2=Integer.parseInt(s3);
	      else
	    	  sum2=0;
	      
	      SignBad2();
	      
	      SelectStatement ="SELECT SUM(S.amount) From loan S where s.helper!='NULL' and s.bad =1;";
	      prepStmt = con.prepareStatement(SelectStatement);
	      rs = prepStmt.executeQuery();
	      if(rs.next()){      
	       s4 =rs.getString(1);
	      }
	      if(s4!=null)
	       sum3=Integer.parseInt(s4);
	      else
	       sum3=0;
	     
	      
	      
	    }finally{
	      closeResultSet(rs);
	      closePrepStmt(prepStmt);
	      closeConnection(con);
	    }
  
  
  }
  
  
  
  
  
  
}

	  
  

  
 
  
 
 
