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
    public boolean cin(String[] data) throws ClassNotFoundException, SQLException{
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("UPDATE channeling SET status = 'C' where p_id = ? AND d_id = ? AND number = ?");
            ps.setString(1,data[0]);
            ps.setString(2,data[1]);
            ps.setString(3,data[2]);
            
            int i = ps.executeUpdate();
            if(i>0){
                return true;
            }else{
                return false;
            }            
            
        }catch(Exception e){ 
            System.out.println(e);
        }
        return false;
    }
    
    public boolean ccom(String[] data) throws ClassNotFoundException, SQLException{
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("DELETE FROM channeling where p_id = ? AND d_id = ? AND number = ?");
            ps.setString(1,data[0]);
            ps.setString(2,data[1]);
            ps.setString(3,data[2]);
            
            int i = ps.executeUpdate();
            if(i>0){
                return true;
            }else{
                return false;
            }            
            
        }catch(Exception e){ 
            System.out.println(e);
        }
        return false;
    }
    
}
