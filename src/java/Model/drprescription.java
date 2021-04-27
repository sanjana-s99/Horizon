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
    public boolean send(String pid, String did, String pres ) throws ClassNotFoundException, SQLException{
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("insert into drprescription(pid,did,pres) values (?,?,?)");
            ps.setString(1, pid);
            ps.setString(2, did);
            ps.setString(3, pres);

            int i = ps.executeUpdate();
            return i>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
}
