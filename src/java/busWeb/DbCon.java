package busWeb;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbCon {

    Connection con = null;

    public Connection connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/bus_pass2","root","");
        } catch (Exception e) {
        }
        return con;
    }
}
