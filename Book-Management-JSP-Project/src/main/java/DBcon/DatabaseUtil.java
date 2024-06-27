package DBcon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
 private static Connection con = null;
 private static final String URL = "jdbc:mysql://localhost:3306/library";
 private static final String USER = "root";
 private static final String PASSWORD = "sibusiso";

 public static  Connection getConnection(){

     if (con ==null){
    	 try {
         Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(URL, USER, PASSWORD);
    	 }catch(Exception e) {
    		 e.getStackTrace();
    	 }
        
         }   
         return con;
 }
}
