/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package data.dao;

import data.DbConnManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Dinesh Liyanage
 */
public class AuthenticateDAO {
    DbConnManager dbConnManager;

    public AuthenticateDAO() {
        dbConnManager = new DbConnManager();
    }
    
    public String getDbPassword(String email) {
        Connection dbConn = null;
        String pwd = "";
        String query = "SELECT `password` FROM `customer` WHERE email = ?";
        
        try {
            dbConn = dbConnManager.connect();
            PreparedStatement ps = dbConn.prepareStatement(query);
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            rs.next();
            pwd = rs.getString(1);
        }catch(SQLException e) {
            e.printStackTrace();
        }finally {
            dbConnManager.closeConnection(dbConn);
        }
        return pwd;
    }
    
   
}
