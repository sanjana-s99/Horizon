/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

/**
 *
 * @author SHATTER
 */
public class user {
    dbCon con = new dbCon();
    public boolean reg(newuser d ) throws ClassNotFoundException, SQLException, NoSuchAlgorithmException{
        String nic = d.getNic(), gender;
        int year = 0, daytext = 0;
        
        // get user birthyear from nic
        if (nic.length() == 10) {
            year = Integer.valueOf("19" + (nic.substring(0, 2)));
            daytext = Integer.valueOf(nic.substring(2, 3));
        } else {
            year = Integer.valueOf("19" + (nic.substring(0, 4)));
            daytext = Integer.valueOf(nic.substring(4, 3));
        }

        // get user gender from nic
        if (daytext > 500) {
            gender = "F";
        } else {
            gender = "M";
        }

        //calculate user age
        int age = Calendar.getInstance().get(Calendar.YEAR) - year;
        
        keygen key = new keygen();
        String pass = key.generate(d.getPassword());
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("insert into users(name,email,password,age,gender,telephone,address,nic) values (?,?,?,?,?,?,?,?)");
            ps.setString(1, d.getName());
            ps.setString(2, d.getEmail());
            ps.setString(3, pass);
            ps.setString(4, String.valueOf(age));
            ps.setString(5, gender);
            ps.setString(6, d.getTp());
            ps.setString(7, d.getAdd());
            ps.setString(8, d.getNic());
            int i = ps.executeUpdate();
            return i>0;
        }catch(Exception e){
            System.out.println(e);
        }
        return false;
    }
    
    public ResultSet login(String email, String pass) throws ClassNotFoundException, SQLException, NoSuchAlgorithmException{
        ResultSet rs = null;
        keygen key = new keygen();
        String passs = key.generate(pass);
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select id from users where email =  ? and password = ?");
            ps.setString(1, email);
            ps.setString(2, passs);

            rs = ps.executeQuery();
            
        }catch(Exception e){ 
            System.out.println(e);
        }
        return rs;
    }
    
     public ResultSet udata(String id) throws ClassNotFoundException, SQLException{
        ResultSet rs = null;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from users where id =  ?");
            ps.setString(1,id);
            
            rs = ps.executeQuery();
            
        }catch(Exception e){ 
            System.out.println(e);
        }
        return rs;
    }
     
     public ResultSet udatamail(String email) throws ClassNotFoundException, SQLException{
        ResultSet rs = null;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from users where email =  ?");
            ps.setString(1,email);
            
            rs = ps.executeQuery();
            
        }catch(Exception e){ 
            System.out.println(e);
        }
        return rs;
    }
     
     public boolean checkexist(String email){
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select id from users where email =  ?");
            ps.setString(1,email);
            
            ResultSet rs = ps.executeQuery();
            
            if(!rs.next()){
                return true;
            }
            
        }catch(Exception e){ 
            System.out.println(e);
        }
        return false;
     }     
     
    public ResultSet udatanic(String nic) throws ClassNotFoundException, SQLException{
        ResultSet rs = null;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from users where nic =  ?");
            ps.setString(1,nic);
            
            rs = ps.executeQuery();
            
        }catch(Exception e){ 
            System.out.println(e);
        }
        return rs;
    }
     
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
     
    public boolean adduser(newstaff d ) throws ClassNotFoundException, SQLException{
        String nic = d.getNic(), gender;
        int year = 0, daytext = 0;
        
        // get user birthyear from nic
        if (nic.length() == 10) {
            year = Integer.valueOf("19" + (nic.substring(0, 2)));
            daytext = Integer.valueOf(nic.substring(2, 3));
        } else {
            year = Integer.valueOf("19" + (nic.substring(0, 4)));
            daytext = Integer.valueOf(nic.substring(4, 3));
        }

        // get user gender from nic
        if (daytext > 500) {
            gender = "F";
        } else {
            gender = "M";
        }

        //calculate user age
        int age = Calendar.getInstance().get(Calendar.YEAR) - year;
        
        if(d.getSpe() == null){
            try{
                PreparedStatement ps = con.createConnection().prepareStatement("insert into users(name,email,type,age,gender,telephone,address,nic) values (?,?,?,?,?,?,?,?)");
                ps.setString(1, d.getName());
                ps.setString(2, d.getEmail());
                ps.setString(3, d.getType());
                ps.setString(4, String.valueOf(age));
                ps.setString(5, gender);
                ps.setString(6, d.getTp());
                ps.setString(7, d.getAdd());
                ps.setString(8, d.getNic());
                int i = ps.executeUpdate();
                return i>0;
            }catch(Exception e){
                System.out.println(e);
            }
        }else{
            try{
                PreparedStatement ps = con.createConnection().prepareStatement("insert into users(name,email,type,age,gender,telephone,address,nic) values (?,?,?,?,?,?,?,?)");
                ps.setString(1, d.getName());
                ps.setString(2, d.getEmail());
                ps.setString(3, d.getType());
                ps.setString(4, String.valueOf(age));
                ps.setString(5, gender);
                ps.setString(6, d.getTp());
                ps.setString(7, d.getAdd());
                ps.setString(8, d.getNic());
                int i = ps.executeUpdate();
                
                PreparedStatement ps1 = con.createConnection().prepareStatement("UPDATE doctor SET s_id = ? WHERE nic = ?");
                ps1.setString(1, d.getSpe());
                ps1.setString(2, d.getNic());                
                int x = ps1.executeUpdate();
                
                return i>0 && x>0;
            }catch(Exception e){
                System.out.println(e);
            }
        }
        return false;
    } 
    
    public boolean resetpass(String pass , String email) throws ClassNotFoundException, SQLException{
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("UPDATE users SET password = ? where email = ?");
            ps.setString(1,pass);
            ps.setString(2,email);

            int i = ps.executeUpdate();
            return i>0;            
            
        }catch(Exception e){ 
            System.out.println(e);
        }
        return false;
    }
    
    public ResultSet drtime(String id) throws ClassNotFoundException, SQLException{
        ResultSet rs = null;
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select * from doctor where id =  ?");
            ps.setString(1,id);
            
            rs = ps.executeQuery();
            
        }catch(Exception e){ 
            System.out.println(e);
        }
        return rs;
    }
    
    public boolean checkstatus(String email) throws ClassNotFoundException, SQLException{
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("select status from users where email =  ?");
            ps.setString(1,email);
            
            ResultSet rs = ps.executeQuery();
            rs.next();
            if(rs.getString("status").equals("A")){
                return true;
            }
            
        }catch(Exception e){ 
            System.out.println(e);
        }
        return false;
    }
    
}
