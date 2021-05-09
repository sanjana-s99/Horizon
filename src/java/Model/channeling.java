/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author SHATTER
 */
public class channeling {
    dbCon con = new dbCon();
    
    //make channel
        public boolean book(String[] d ) throws ClassNotFoundException, SQLException{
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("insert into channeling(d_id,p_id,number) values (?,?,?)");
            ps.setString(1, d[0]);
            ps.setString(2, d[1]);
            ps.setString(3, d[2]);

            int i = ps.executeUpdate();
            return i>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
     
        //update status
    public boolean cin(String[] data) throws ClassNotFoundException, SQLException{
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("UPDATE channeling SET status = 'C' where p_id = ? AND d_id = ? AND number = ?");
            ps.setString(1,data[0]);
            ps.setString(2,data[1]);
            ps.setString(3,data[2]);
            
            int i = ps.executeUpdate();
            return i>0;            
            
        }catch(ClassNotFoundException | SQLException e){ 
            System.out.println(e);
        }
        return false;
    }
    
    //delete channel
    public boolean ccom(String[] data) throws ClassNotFoundException, SQLException{
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("DELETE FROM channeling where p_id = ? AND d_id = ? AND number = ?");
            ps.setString(1,data[0]);
            ps.setString(2,data[1]);
            ps.setString(3,data[2]);
            
            int i = ps.executeUpdate();
            return i>0;            
            
        }catch(ClassNotFoundException | SQLException e){ 
            System.out.println(e);
        }
        return false;
    }
    
}
