/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author SHATTER
 */
public class dfind {
    dbCon con = new dbCon();
    
    public ResultSet symptomCheck(String symptom1, String symptom2, String symptom3) throws SQLException, ClassNotFoundException{
        
        ResultSet rs = null;
        System.out.println(symptom1);
        System.out.println(symptom2);
        System.out.println(symptom3);
        
        try{
            PreparedStatement ps=con.createConnection().prepareStatement("SELECT specialist_id , disease FROM diseases WHERE ? IN(symptom_1, symptom_2, symptom_3, symptom_4, symptom_5, symptom_6, symptom_7, symptom_8, symptom_9, symptom_10) AND ? IN(symptom_1, symptom_2, symptom_3, symptom_4, symptom_5, symptom_6, symptom_7, symptom_8, symptom_9, symptom_10) OR ? IN(symptom_1, symptom_2, symptom_3, symptom_4, symptom_5, symptom_6, symptom_7, symptom_8, symptom_9, symptom_10) AND ? IN(symptom_1, symptom_2, symptom_3, symptom_4, symptom_5, symptom_6, symptom_7, symptom_8, symptom_9, symptom_10) OR ? IN(symptom_1, symptom_2, symptom_3, symptom_4, symptom_5, symptom_6, symptom_7, symptom_8, symptom_9, symptom_10) AND ? IN(symptom_1, symptom_2, symptom_3, symptom_4, symptom_5, symptom_6, symptom_7, symptom_8, symptom_9, symptom_10)");
            ps.setString(1, symptom1);
            ps.setString(2, symptom2);
            ps.setString(3, symptom3);
            ps.setString(4, symptom1);
            ps.setString(5, symptom2);
            ps.setString(6, symptom3);
                        
            rs = ps.executeQuery();          
        }
        catch(Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return rs;
    }

    
    public ResultSet getDoctor(String id){
       ResultSet rs = null;
        
        try {
            PreparedStatement ps = con.createConnection().prepareStatement("select id from doctor where s_id=?");
            ps.setString(1, id);
            
            rs = ps.executeQuery();
           
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return rs;
    }
}
