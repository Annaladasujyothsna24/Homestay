/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author Vision Computer
 */
public class DBbean {
     public static Connection getConn()throws Exception{
        
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","toni","1234");
        return con;
    
    }
}
