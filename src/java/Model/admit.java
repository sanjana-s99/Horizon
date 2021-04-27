/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author SHATTER
 */
public class admit {
    dbCon con = new dbCon();
    public boolean radmit(newadmit d){
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("insert into admit(nic,did,bno,gname,gtp,type) values (?,?,?,?,?,'room')");
            ps.setString(1, d.getPnic());
            ps.setString(2, d.getDid());
            ps.setString(3, d.getBid());
            ps.setString(4, d.getGname());
            ps.setString(5, d.getGtp());
            int i = ps.executeUpdate();
            
            PreparedStatement ps1 = con.createConnection().prepareStatement("UPDATE room SET status = 'B' WHERE id = ?");
            ps1.setString(1, d.getBid());             
            int x = ps1.executeUpdate();
            
            return i>0 && x>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
    
    
    public boolean wadmit(newadmit d){
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("insert into admit(nic,did,bno,gname,gtp,type) values (?,?,?,?,?,'ward')");
            ps.setString(1, d.getPnic());
            ps.setString(2, d.getDid());
            ps.setString(3, d.getBid());
            ps.setString(4, d.getGname());
            ps.setString(5, d.getGtp());
            int i = ps.executeUpdate();
            
            PreparedStatement ps1 = con.createConnection().prepareStatement("UPDATE beds SET status = 'B' WHERE bid = ?");
            ps1.setString(1, d.getBid());             
            int x = ps1.executeUpdate();
            
            return i>0 && x>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
    
    public boolean rdis(String index){
            ResultSet rs = null;
        try{
            PreparedStatement ps2 = con.createConnection().prepareStatement("select bno from admit WHERE id =  ?");
            ps2.setString(1,index);
            rs = ps2.executeQuery();
            rs.next();
            String bid = rs.getString("bno");
            
            PreparedStatement ps = con.createConnection().prepareStatement("DELETE FROM admit WHERE id = ?");
            ps.setString(1, index);
            int i = ps.executeUpdate();
            
            PreparedStatement ps1 = con.createConnection().prepareStatement("UPDATE room SET status = 'F' WHERE id = ?");
            ps1.setString(1, bid);             
            int x = ps1.executeUpdate();
            
            return i>0 && x>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
    
    public boolean wdis(String index){
            ResultSet rs = null;
        try{
            PreparedStatement ps2 = con.createConnection().prepareStatement("select bno from admit WHERE id =  ?");
            ps2.setString(1,index);
            rs = ps2.executeQuery();
            rs.next();
            String bid = rs.getString("bno");
            
            PreparedStatement ps = con.createConnection().prepareStatement("DELETE FROM admit WHERE id = ?");
            ps.setString(1, index);
            int i = ps.executeUpdate();
            
            PreparedStatement ps1 = con.createConnection().prepareStatement("UPDATE beds SET status = 'F' WHERE bid = ?");
            ps1.setString(1, bid);             
            int x = ps1.executeUpdate();
            
            return i>0 && x>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
    
    public boolean roomup(String id, String nbno, String bno){
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("UPDATE room SET status = 'F' WHERE id = ?");
            ps.setString(1, bno);             
            int x = ps.executeUpdate();
            
            PreparedStatement ps1 = con.createConnection().prepareStatement("UPDATE admit SET bno = ? WHERE id = ?");
            ps1.setString(1, nbno); 
            ps1.setString(2, id);              
            int i = ps1.executeUpdate();
            
            PreparedStatement ps2 = con.createConnection().prepareStatement("UPDATE room SET status = 'B' WHERE id = ?");
            ps2.setString(1, nbno);             
            int z = ps2.executeUpdate();
            
            return i>0 && x>0 && z>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
    
    
}
