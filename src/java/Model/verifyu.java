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
public class verifyu {
    dbCon con = new dbCon();
    public boolean uuser(String email) throws ClassNotFoundException, SQLException{
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("UPDATE users SET status = 'A' where email = ?");
            ps.setString(1,email);
            
            PreparedStatement ps1 = con.createConnection().prepareStatement("DELETE FROM verify where email = ?");
            ps1.setString(1,email);
            
            int i = ps.executeUpdate();
            int x = ps1.executeUpdate();
            return i>0 && x>0;            
            
        }catch(ClassNotFoundException | SQLException e){ 
            System.out.println(e);
        }
        return false;
    }
}
