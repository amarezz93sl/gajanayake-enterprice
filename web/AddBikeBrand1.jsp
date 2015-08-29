
<%-- 
    Document   : AddSpareparts
    Created on : Jun 30, 2015, 5:46:57 PM
    Author     : Chathuri Lakmini 
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>;
<%@ page import="java.io.FileInputStream"%>;
<%@ page import="java.io.IOException" %>;
<%@ page import="java.sql.Connection"%>;
<%@ page import="java.sql.DriverManager"%>;
<%@ page import="java.sql.PreparedStatement"%>;
<%@ page import="java.sql.ResultSet"%>;
<%@ page import="java.sql.Statement"%>;
<%@ page import="java.util.Iterator"%>;
<%@ page import="java.util.List"%>;
<%@ page import="javax.servlet.ServletException"%>;
<%@ page import="javax.servlet.http.HttpServlet"%>;
<%@ page import="javax.servlet.http.HttpServletRequest"%>;
<%@ page import="javax.servlet.http.HttpServletResponse"%>;

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>




<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
         <%@include file="DB_Connector.jsp"%>
       
    <%
           
       
    
         
          String bname=request.getParameter("Bname");
          out.print(bname);
          String registeredno=request.getParameter("regno");
          String description=request.getParameter("description");
          String file=request.getParameter("ufile");
         
          
          
         
      out.print(registeredno);
      out.print(description);
       out.print(" "+file);
     
      
            PreparedStatement pstmt = null;
            ResultSet rs1 = null;
            FileInputStream fis = null;
 
           
           
 
        
         
         
         //Increament ID    
      Statement stmt1 =conn.createStatement();
      int id=0;
      String BrandI="BB";
      try{
      stmt1 = conn.createStatement();
      String sql = "SELECT * FROM mbbrand ORDER BY BrandID DESC LIMIT 1";
      ResultSet rs=stmt1.executeQuery(sql);
      
  
         while(rs.next())
            {    
                BrandI=rs.getString("BrandID");
            }
         rs.close();
         }      
      catch(SQLException se)
      {      
            se.printStackTrace();
      } 
     id=Integer.parseInt(BrandI.substring(2));
     id=id+1;
     String BrandID="BB"+id;
      //End Of Increament Id
            
         
         try
          { 
             
                File image = new File("C:/Users/windya yasas/Downloads/"+file);
               
                pstmt = conn.prepareStatement("INSERT INTO `gajanayake`.`mbbrand` (`BrandID`,`Bname`,`RegisteredNo`,`Logo`,`Description`) VALUES (?,?,?,?,?)");
                pstmt.setString(1, BrandID);
                pstmt.setString(2, bname);
                pstmt.setString(3, registeredno);
                fis = new FileInputStream(image);
                pstmt.setBinaryStream(4, (InputStream) fis, (int) (image.length()));
                pstmt.setString(5, description);
              
                
 
                int count = pstmt.executeUpdate();
                if (count > 0) {
                    System.out.println("The image has been inserted successfully");
                    session.setAttribute("noti","yes");
                    response.sendRedirect("AddBikeBrand.jsp");
                } else {
                    System.out.println("The image did not insert successfully");
                }
                
             
         
            
          
            
             
             
             
        
             
          }
          catch(Exception e)
          {
             e.printStackTrace();
          }
          finally
            {
                try {
                    if (rs1 != null) {
                        rs1.close();
                        rs1 = null;
                    }
                    if (pstmt != null) {
                        pstmt.close();
                        pstmt = null;
                    }
                    if (conn != null) {
                        conn.close();
                        conn = null;
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
  
        %>
    </body>
</html>

