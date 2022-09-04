package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionProvider {

    private final static DBConnectionProvider INSTANCE = new DBConnectionProvider();

    Connection connection;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/book_library?useUnicode=true";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "root";

    private DBConnectionProvider(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static DBConnectionProvider getInstance(){
        return INSTANCE;
    }

    public Connection getConnection(){
        try {
            if(connection == null || connection.isClosed()){
                connection = DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

}
