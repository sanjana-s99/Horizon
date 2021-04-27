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
public class drprescription {
    dbCon con = new dbCon();
    public boolean send(String cid, String pid, String did, String pres ) throws ClassNotFoundException, SQLException{
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("insert into drprescription(cno,pid,did,pres) values (?,?,?,?)");
            ps.setString(1, cid);
            ps.setString(2, pid);
            ps.setString(3, did);
            ps.setString(4, pres);
            
            int i = ps.executeUpdate();
            
            PreparedStatement ps1 = con.createConnection().prepareStatement("UPDATE channeling SET status = 'D' where p_id = ? AND d_id = ? AND number = ?");
            ps1.setString(1, pid);
            ps1.setString(2, did);
            ps1.setString(3, cid);
            
            int x = ps1.executeUpdate();
            
            return i>0 && x>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
}
