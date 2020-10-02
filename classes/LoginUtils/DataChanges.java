package LoadUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DataChanges {
	
	public static String Dashboardchanges = getTime() + ";" + getDate();
	public static String Proxychanges = getTime() + ";" + getDate();
	public static String Playerchanges = getTime() + ";" + getDate();
	
	public static void setDashboardchanges(String dashboardchanges) {
		Dashboardchanges = dashboardchanges;
	}

	public static void setProxychanges(String proxychanges) {
		Proxychanges = proxychanges;
	}

	public static void setPlayerchanges(String playerchanges) {
		Playerchanges = playerchanges;
	}

	public static String getTime(){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss", Locale.GERMAN);
		return sdf.format(date);
	}
	
	public static String getDate(){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("dd.MMMM.yyy", Locale.GERMAN);
		return sdf.format(date);
	}

}
