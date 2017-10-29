package LoginUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

public class UserDatabase {

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
		createTables();
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

	public static void createTables(){
		update("CREATE TABLE IF NOT EXISTS users (id INTEGER AUTO_INCREMENT PRIMARY KEY, name TEXT, passwort TEXT, role TEXT, isalternate TEXT)");
		update("CREATE TABLE IF NOT EXISTS usersalts (id INTEGER PRIMARY KEY, secret TEXT, FOREIGN KEY(id) REFERENCES users(id))");
		update("CREATE TABLE IF NOT EXISTS usersettings (id INTEGER PRIMARY KEY, settings TEXT, FOREIGN KEY(id) REFERENCES users(id))");
//		update("CREATE TABLE IF NOT EXISTS usersalts (id INTEGER PRIMARY KEY, salt VARBINARY)");
		// FOREIGN KEY(id) REFERENCES users(id)
	}

	public static void registerUser(String name, String password, String alternate, String group){
		if(con == null){
			connect();
		}
		byte[] salt = MD5Hash.getNewSalt();
		password = MD5Hash.hashPassword(password, salt);

		try {
			PreparedStatement ps = con.prepareStatement("INSERT INTO users (name, passwort, role, isalternate) VALUES (?, ?, ?, ?)");

			ps.setString(1, name);
			ps.setString(2, password);
			ps.setString(3, Groups.getRankByName(group).toString());
			ps.setString(4, alternate)

			ps.executeUpdate();
			int userid = UserDatabase.getUserID(name);
			update("INSERT INTO usersalts (id, secret) VALUES ('"+userid+"', '"+Arrays.toString(salt)+"')");
			update("INSERT INTO usersettings (id, settings) VALUES ('"+userid+"', 'an,an,an,an,an,an,an,an,default')");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static boolean userRegistered(String name){

		if(con == null){
			connect();
		}

		ResultSet rs;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("SELECT * FROM users WHERE name=?");
			ps.setString(1, name);
			rs = ps.executeQuery();
			while(rs != null && rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static int getUserID(String name){
		if(con == null){
			connect();
		}

		ResultSet rs;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement("SELECT * FROM users WHERE name=?");
			ps.setString(1, name);
			rs = ps.executeQuery();
			while(rs != null && rs.next()) {
				return rs.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static String getSalt(int id){
		if(con == null){
			connect();
		}

		ResultSet rs = query("SELECT * FROM usersalts WHERE id= '" + id + "'");
		try{
			while(rs.next()){
				return rs.getString("secret");
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
		return null;
	}

	public static String getPassword(String name){
		if(con == null){
			connect();
		}

		if(userRegistered(name)){

			ResultSet rs = query("SELECT * FROM users WHERE name= '" + name + "'");
			try{
				while(rs.next()){
					return rs.getString("passwort");
				}
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
		return null;
	}

	public static String getGroup(String name){
		if(con == null){
			connect();
		}

		if(userRegistered(name)){

			ResultSet rs = query("SELECT * FROM users WHERE name= '" + name + "'");
			try{
				while(rs.next()){
					return rs.getString("role");
				}
			}catch (SQLException e){
				e.printStackTrace();
			}
			return null;
		}
		return null;
	}

	public static boolean isAlternate(String name){
		if(con == null){
			connect();
		}

		if(userRegistered(name)){

			ResultSet rs = query("SELECT * FROM users WHERE name= '" + name + "'");
			try{
				while(rs.next()){
					if(rs.getString("isalternate").equalsIgnoreCase("ja"))
					return true;
				}
			}catch (SQLException e){
				e.printStackTrace();
			}
			return false;
		}
		return false;
	}

	public static String getSettings(String name){
		String settings = "an,an,an,an,an,an,an,an,default";
		if(con == null){
			connect();
		}
		if(userRegistered(name)){
			int userid = getUserID(name);
			ResultSet rs = query("SELECT settings FROM usersettings WHERE id='"+userid+"'");
			try {
				if(rs != null && rs.next()){
					settings = rs.getString("settings");
				}else{
					update("INSERT INTO usersettings (id, settings) VALUES ('"+userid+"', 'an,an,an,an,an,an,an,an,default')");
				}
			} catch (SQLException e) {
			}
		}
		return settings;
	}

	public static void setSettings(int userid, String settings){
		if(con == null){
			connect();
		}
		update("UPDATE usersettings SET settings='"+settings+"' WHERE id='"+userid+"'");
	}

}
