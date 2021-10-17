package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlConnection {

    /**
     * JDBC url.
     */
    private static final String URL;

    /**
     * Username authentication database.
     */
    private static final String USER;

    /**
     * Password authentication database.
     */
    private static final String PASSWORD;

    static {
        URL = "jdbc:mysql://localhost:3306/swp391_g2_project?useSSL=false";
        USER = "root";
        PASSWORD = "123456";
    }

    /**
     * Get jdbc to database.
     *
     * @return Connection
     */
    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace(System.err);
        }
        return null;
    }

//    public static void main(String[] args) {
//        System.out.println(MySqlConnection.getConnection());
//    }
}
