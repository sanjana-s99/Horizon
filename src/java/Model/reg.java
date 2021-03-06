/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

/**
 *
 * @author SHATTER
 */
public class reg {
    public boolean reg(String[] d ) throws ClassNotFoundException, SQLException{
        dbCon con = new dbCon();
        
        String nic = d[3], gender;
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
        
        try{
            PreparedStatement ps = con.createConnection().prepareStatement("insert into patients(name,email,password,age,gender,telephone,address) values (?,?,?,?,?,?,?)");
            ps.setString(1, d[0]);
            ps.setString(2, d[1]);
            ps.setString(3, d[2]);
            ps.setString(4, String.valueOf(age));
            ps.setString(5, gender);
            ps.setString(6, d[4]);
            ps.setString(7, d[5]);
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
