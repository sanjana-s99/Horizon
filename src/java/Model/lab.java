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
public class lab {
    dbCon con = new dbCon();
        public int labadd(String[] data){
        int x=0;
        try{
            PreparedStatement ps=con.createConnection().prepareStatement("insert into lab_apo(pid,did,type,date,time)values(?,?,?,?,?)");
            
            ps.setString(1, data[0]);
            ps.setString(2, data[1]);
            ps.setString(3, data[2]);
            ps.setString(4, data[3]);
            ps.setString(5, data[4]);
            
            x=ps.executeUpdate();
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
        
        return x;  
}
}
