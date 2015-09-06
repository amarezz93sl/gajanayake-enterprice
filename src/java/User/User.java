/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package User;

/**
 *
 * @author windya yasas
 */
public class User {
   private String UserID;
    private String firstName;
    private String lastName;
    private String nameWithIni;
    private String email;
    private String address;
    private String nicNo;
    private String password;
    private String username;
    private String DoB;
    private String file;
    private double salary;
    private double tel; 
    private double AccBalance;
    private int Admin;
    private int Employee;
    private int DataEntry;
    private int supplier;
    private int Customer;

    public User( )
    {
        this.UserID="";
        this.firstName="";
        this.lastName="";
        this.nameWithIni="";
        this.email="";
        this.address="";
        this.nicNo="";
        this.password="";
        this.username="";
        this.DoB="";
        this.file="";
        this.salary=0;
        this.tel=0;
        this.AccBalance=0;
        this.Admin=0;
        this.Employee=0;
        this.DataEntry=0;
        this.supplier=0;
        this.Customer=0;
        
        
        
    }
    public User(String UserID,String firstName,String lastName,String email,String address,String nicNo,String password,String username,String DoB,double tel,int Admin,int Employee,int DataEntry,int supplier,int Customer,String file )
    {
        
        this.UserID=UserID;
        this.firstName=firstName;
        this.lastName=lastName;
        this.email=email;
        this.address=address;
        this.nicNo=nicNo;
        this.password=password;
        this.username=username;
        this.nameWithIni=this.firstName+" "+this.lastName;
        this.DoB=DoB;
        this.tel=tel;
        this.Admin=Admin;
        this.Employee=Employee;
        this.DataEntry=DataEntry;
        this.supplier=supplier;
        this.Customer=Customer;
        this.file=file;
        
    }
    
     public String getUserID() {
        return UserID;
    }
      public void setUserID(String userID) {
        this.UserID= userID;
        
    }
    public String getFile() {
        return file;
    }
      public void setFile(String file) {
        this.file=file;
      }
    public String getName() {
        return nameWithIni;
    }
     public String getfname() {
        return firstName;
    }
      public String getlname() {
        return lastName;
    }
    public void setfname(String fname) {
        this.firstName= fname;
        
    }
     public void setlname(String lname) {
        this.lastName= lname;
        
    }
      public void setNameWithIni() {
        this.nameWithIni= this.firstName+" "+this.lastName;
        
    }

    public String getNic() {
        return nicNo;
    }

    public void setNic(String nic) {
        this.nicNo = nic;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
     public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
     public String getDoB()
    {
        return DoB;
    }

    public void setDoB(String DoB) {
        this.DoB=DoB;
    }
     public double getSalary()
    {
        return salary;
    }

    public void setSalary(Double salary) {
        this.salary=salary;
    }
      public double getTel()
    {
        return tel;
    }

    public void setTel(Double tel)
    {
        this.tel=tel;
    }
     public double getAccBalance()
    {
        return AccBalance;
    }
     public void setAccBalance(Double accBalance)
    {
        this.AccBalance=accBalance;
    }
    
}

    

