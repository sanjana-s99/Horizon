/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author SHATTER
 */
public class dbCon {
    public Connection createConnection() throws ClassNotFoundException, SQLException{
        Connection con = null;
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/horizon";
        String uname = "root";
        String pass = "";
        try{
            con = DriverManager.getConnection(url, uname, pass);
            return con;
        }catch(SQLException e){
            System.out.println(e);
        }
        return con;
    }
}
