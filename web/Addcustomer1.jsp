<%-- 
    Document   : AddSpareparts
    Created on : Jun 30, 2015, 5:46:57 PM
    Author     : windya yasas
--%>

<%@page import="data.dao.CustomerDAO"%>
<%@page import="User.User"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        
    </head>
    <body>
         <%@include file="DB_Connector.jsp"%>
        
         
       
        <%
           
     
    
         
          String fname=request.getParameter("fname");
          String lname=request.getParameter("lname");
          String BDay=request.getParameter("BDay");
          String nic=request.getParameter("nic");
          String Address=request.getParameter("Address");
          double tel=Double.parseDouble(request.getParameter("tel"));
          String email=request.getParameter("email");
          String role=request.getParameter("role");
          String file=request.getParameter("ufile");
          
         
          
          User user = new User("",fname,lname,email,Address,nic,"","",BDay,tel,0,0,0,0,0,file);
          CustomerDAO dao=new CustomerDAO();
                    boolean url=dao.insertCustomer(user, role);
                    if (url==true)
                    {
                    System.out.println("The image has been inserted successfully");
                    session.setAttribute("noti","yes");
                    response.sendRedirect("AddCustomer.jsp");
                    }        
             
          
             
          
  
        %>
    </body>
</html>
