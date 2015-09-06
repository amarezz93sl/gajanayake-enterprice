/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data.dao;
import java.sql.Connection;
import data.DbConnManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import model.Brand;
/**
 *
 * @author User
 */
public class BrandDAO {
    
    private DbConnManager dbConnManager;
    
    public BrandDAO() {
        dbConnManager = new DbConnManager();
    }
    
    public ArrayList  getBrand()
    {
        Connection connection = dbConnManager.connect();
        String query = "SELECT * FROM mbbrand";
        
        
        ArrayList small = new ArrayList();
        try
        {
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(query);
            while(result.next())
            {
                Brand myBrand = new Brand();
                myBrand.setBrandID(result.getString("BrandID"));
                myBrand.setBname(result.getString("Bname"));
                myBrand.setRegisteredNo(result.getString("RegisteredNo"));
                small.add(myBrand);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            dbConnManager.closeConnection(connection);
            return small;
        }
    }
    
}
