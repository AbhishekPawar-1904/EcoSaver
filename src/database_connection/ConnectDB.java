package database_connection;
import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
    static Connection con = null;

    public static Connection getConnect() {
        try {
            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded...");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/energy_saverdb", "root", "");
                System.out.println("Connection established... " + con);
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return con;
    }
}