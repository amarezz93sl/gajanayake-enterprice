/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package data.dao;

import User.User;
import data.DbConnManager;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import java.util.Vector;

/**
 *
 * @author Dinesh Liyanage
 */
public class CustomerDAO {
    private DbConnManager dbConnManager;
    int no;
    public CustomerDAO() {
        
        dbConnManager = new DbConnManager();
    }
    
    /**
     *
     * @param user
     * @param role
     * @return
     * @throws FileNotFoundException
     */
    public boolean insertCustomer(User user,String role) throws FileNotFoundException {
        Connection dbConn = null;
        dbConn = dbConnManager.connect();
         int id=0;
      String url="AddCustomer.jsp";
      String RID="";
      if (role.equals("Customer"))
      {
          RID="CS";
          url="AddCustomer.jsp";
      }
      else if(role.equals("Supplier"))
      {
         RID="SU";
         url="AddSupplier.jsp";
      }
      else if(role.equals("Employee"))
      {
         RID="EM";
         url="AddEmployee.jsp";
      }
      else if(role.equals("Administrator"))
      {
         RID="AD";
         url="AddEmployee.jsp";
      }
      else if(role.equals("DataEntryOperator"))
      {
         RID="DE";
         url="AddEmployee.jsp";
      }
      
      String userC="CS";
      
                
                     
      try{
       Connection connection = dbConnManager.connect();
       Statement stmt1 = connection.createStatement();
       
       String sql = "SELECT userID FROM user WHERE userID LIKE '"+RID+"%' ORDER BY userID DESC LIMIT 1 ";
            try (
                    ResultSet rs = stmt1.executeQuery(sql)
            //where userID LIKE 'CS'
            ) {
                while(rs.next())
                {
                    userC = rs.getString("userID");
                }
            }
     }      
      catch(SQLException se){      
      } 
     id=Integer.parseInt(userC.substring(2));
     id=id+1;
     String userID=RID+""+id;
     user.setUserID(userID);
     System.out.println(user.getUserID());
     System.out.println(user.getfname());
     System.out.println(role);
     System.out.println(user.getFile());
          
          

     
     
        boolean res = false;
        String query = "INSERT INTO `gajanayake`.`user`(`userID`,`fname`,`BDay`,`tel`,`Address`,`lname`,`password`,`Email`,`NIC`,`nameWithIni`,`salary`,`AccBalance`,`"+role+"`,`username`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            dbConn = dbConnManager.connect();
            PreparedStatement ps = dbConn.prepareStatement(query);
            
            ps.setString(1, user.getUserID());
            ps.setString(2, user.getfname());
            ps.setString(3, user.getDoB());
            ps.setDouble(4, user.getTel());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getlname());
            ps.setString(7, user.getPassword());
            ps.setString(8, user.getEmail());
            ps.setString(9, user.getNic());
            ps.setString(10, user.getName());
            ps.setDouble(11, user.getSalary());
            ps.setDouble(12, user.getAccBalance());
            ps.setInt(13,1);
            ps.setString(14, user.getUsername());
         
            int i = ps.executeUpdate();
          
            
             PreparedStatement pstmt = null;           
             FileInputStream fis = null;
             File image = new File("C:/Users/windya yasas/Downloads/"+user.getFile());
               
                pstmt = dbConn.prepareStatement("UPDATE `gajanayake`.`user` SET `image` = ? WHERE `userID`='"+user.getUserID()+"'");
               
               
                fis = new FileInputStream(image);
                pstmt.setBinaryStream(1, (InputStream) fis, (int) (image.length()));
                pstmt.executeUpdate();
            
            if(i > 0)
            {
                res = true;
            }
            else 
            {
                res = false;
            }
        }
        catch(SQLException e)
        {
        }
        finally 
        {
            dbConnManager.closeConnection(dbConn);
        }
        
        return res;
    } 
  /*  
    public int getEmailCount(String email) {
        Connection dbConn = null;
        int count = -1;
        String query = "SELECT COUNT(email) FROM `customer` WHERE email = ?";
        
        try {
           dbConn = dbConnManager.connect();
           PreparedStatement ps = dbConn.prepareStatement(query);
           
           ps.setString(1, email);
           
            ResultSet rs = ps.executeQuery();
            rs.next();
            count = rs.getInt(1);
            
        }catch(SQLException e) {
            e.printStackTrace();
        }finally {
            dbConnManager.closeConnection(dbConn);
        }
        return count;
    }
    
    //image id return
    
     public ArrayList getImageID()
    {
        Connection connection = dbConnManager.connect();
        String sql = "SELECT `BrandID` FROM `mbbrand`";
        ArrayList imageCollector = new ArrayList();
       try
       {
         Statement statement = connection.createStatement();
         ResultSet resultSet = statement.executeQuery(sql);
         while(resultSet.next())
         {
            imageCollector.add(resultSet.getString("BrandID"));
         }
       }
       catch(Exception exception)
       {
           exception.printStackTrace();
       }
       finally
       {
           dbConnManager.closeConnection(connection);
       }
     
       return imageCollector;
    }
     
     //update customer
     
     public boolean updateCustomer(Customer cust)
     {
         boolean result = false;
         Connection connection = dbConnManager.connect();
         String sqlQuery = "UPDATE `customer` SET `name`='"+cust.getName()+"',`nic`='"+cust.getNic()+"',`address`='"+cust.getAddress()+"',`password`='"+cust.getPassword()+"'"
                 + " WHERE email = '"+cust.getEmail()+"'";
         try
         {
             Statement statement = connection.createStatement();
             statement.executeUpdate(sqlQuery);
             result = true;
         }
         catch(Exception e)
         {
             e.printStackTrace();
         }
         finally
         {
             dbConnManager.closeConnection(connection);
             return result;
         }
     }
     
     //load Customer
     
     public Customer loadCustomer(String email)
             {
                 Customer customer = new Customer();
                 Connection connection = dbConnManager.connect();
                 String sqlQuery = "SELECT * FROM `customer` WHERE email='"+email+"'";
                 try
                 {
                     Statement statement = connection.createStatement();
                     ResultSet result = statement.executeQuery(sqlQuery);
                     while(result.next())
                     {
                         customer.setAddress(result.getString("address"));
                         customer.setName(result.getString("name"));
                         customer.setNic(result.getString("nic"));
                         customer.setPassword(result.getString("password"));
                     }
                     
                 }
                 catch(Exception e)
                 {
                     e.printStackTrace();
                 }
                 finally
                 {
                     return customer;
                 }
             }*/
    
}
