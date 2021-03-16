/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Statement;
import java.time.LocalDate;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import javax.xml.bind.DatatypeConverter;

/**
 *
 * @author SHATTER
 */
public class keygen {
    public String generate(String tohash) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance("MD5");
        messageDigest.update(tohash.getBytes());
        byte[] digiest = messageDigest.digest();
        return DatatypeConverter.printHexBinary(digiest);
    }
    
    
    public String verify(String email){
        dbCon con = new dbCon();
        LocalDate today;     //Today
        today = LocalDate.now();
        LocalDate tomorrow = today.plusDays(1);     //Plus 1 day
        try{
            Statement st = con.createConnection().createStatement();
            String query = "insert into verify values ('"+email+"','"+generate(email)+"','"+tomorrow+"')";
            st.executeUpdate(query);
            return generate(email);

        }catch(ClassNotFoundException | NoSuchAlgorithmException | SQLException e){
            System.out.println(e);
        }
        return  null;
    }
    
    public void regverify(String key, String mail){
        String msg = "<a href='http://localhost:8080/Horizon/verify.jsp?key="+key+"&mail="+mail+"&action=verify' target='_blank'>click me</a>";
        SendMail.send(mail, "Verification", msg);
    }   
}
