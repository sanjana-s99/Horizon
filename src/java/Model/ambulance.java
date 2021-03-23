/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.PreparedStatement;

/**
 *
 * @author SHATTER
 */
public class ambulance {
    dbCon con = new dbCon();
    public boolean add(String number){
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("insert into ambulance(number) values (?)");
            ps.setString(1, number);
            int i = ps.executeUpdate();
            return i>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
    
    public boolean request(String[] data){
         try{
            PreparedStatement ps = con.createConnection().prepareStatement("insert into provide_amb(number,name,phone,lat,lan) values (?,?,?,?,?)");
            ps.setString(1, data[0]);
            ps.setString(2, data[1]);
            ps.setString(3, data[2]);
            ps.setString(4, data[3]);
            ps.setString(5, data[4]);            
            int i = ps.executeUpdate();
            
            PreparedStatement ps1 = con.createConnection().prepareStatement("UPDATE ambulance SET status = 'A' WHERE number = ?");
            ps1.setString(1, data[0]);            
            int x = ps1.executeUpdate();
            return i>0 && x>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
    
    public boolean update(String number){
         try{
            PreparedStatement ps = con.createConnection().prepareStatement("Delete FROM provide_amb WHERE number = ?");
            ps.setString(1, number);         
            int i = ps.executeUpdate();
            
            PreparedStatement ps1 = con.createConnection().prepareStatement("UPDATE ambulance SET status = 'N' WHERE number = ?");
            ps1.setString(1, number);            
            int x = ps1.executeUpdate();
            return i>0 && x>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
}
