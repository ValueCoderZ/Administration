package Utils;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseReader {
	
	public static int getInteger(String table, String integer, String place){
		if(MySQL.getCon() == null){
			MySQL.connect();
		}
		
		ResultSet rs;
		PreparedStatement ps;
		try {
			ps = MySQL.getCon().prepareStatement("SELECT * FROM "+table+" WHERE name=?");
			ps.setString(1, place);
			rs = ps.executeQuery();
			while(rs != null && rs.next()) {
				return rs.getInt(integer);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

}
