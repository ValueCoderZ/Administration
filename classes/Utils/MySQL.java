package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQL {

	private static String HOST = "localhost";
	private static String DATABASE = "database";
	private static String USER = "root";
	private static String PASSWORD = "password";
	
	private static Connection con;
	
	public static void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://" + HOST + ":3306/" + DATABASE + "?autoReconnect=true";

			con = DriverManager.getConnection(url, USER, PASSWORD);
			System.out.println("[MySQL] Die Verbindung zur MySQL wurde hergestellt!");
		} catch (SQLException e) {
			System.out.println("[MySQL] Die Verbindung zur MySQL ist fehlgeschlagen! Fehler: " + e.getMessage());
		} catch (ClassNotFoundException e) {
			System.out.println("Treiber nicht geladen: " + e.getMessage());
		} 
	}
	
	public static void close() {
		try {
			if(con != null) {
				con.close();
				System.out.println("[MySQL] Die Verbindung zur MySQL wurde Erfolgreich beendet!");
			}
		} catch (SQLException e) {
			System.out.println("[MySQL] Fehler beim beenden der Verbindung zur MySQL! Fehler: " + e.getMessage());
		}
	}
	
	public static void update(String qry) {
		
		if(con == null){
			connect();
		}
		
		try {
			Statement st = con.createStatement();
			st.executeUpdate(qry);
			st.close();
		} catch (SQLException e) {
			System.err.println(e);
		}
	}
	
	public static ResultSet query(String qry) {
		
		if(con == null){
			connect();
		}
		
		ResultSet rs = null;
		
		try {
			Statement st = con.createStatement();
			rs = st.executeQuery(qry);
		} catch (SQLException e) {
			System.err.println(e);
		}
		return rs;
	}

}
