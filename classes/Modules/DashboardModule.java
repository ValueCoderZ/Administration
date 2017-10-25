package Modules;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;


import Datas.Data;

public class DashboardModule implements Module {

	public String prefix() {
		return "dashboard";
	}

	public String build(Data data) {
		String[] ldata = data.load();
		
		String status = ldata[0].toString();
		int register = Integer.valueOf(ldata[1]);
		int tickets = Integer.valueOf(ldata[2]);
		int forum = Integer.valueOf(ldata[3]);
		
		String htmlstatus = "<h5 class='center red-text'>Offline</h5>";
		if(status.equalsIgnoreCase("Online")){
			htmlstatus = "<h5 class='center green-text'>Online</h5>";
		}
		String htmlregistered = "scrollspy";
		String htmltickets = "container";
		String htmlforum = "row";
		String size = "col s12 m3";
		
		String dashboard = "<div class='container'>"+
    "<div id='dashboard' class='section scrollspy'>"+    
      "<div class='row'>"+
        "<div class='col s12 m3'>"+
          "<div class='icon-block'>"+
            "<h2 class='center black-text'><i class='material-icons'>message</i></h2>"+
            htmlstatus + 
          "</div>"+
        "</div>"+
        "<div class='col s12 m3'>"+
          "<div class='icon-block'>"+
            "<h2 class='center black-text'><i class='material-icons'>group</i></h2>"+
            htmlregistered +
          "</div>"+
        "</div>"+
		"<div class='col s12 m3'>"+
			"<div class='icon-block'>"+
			  "<h2 class='center black-text'><i class='material-icons'>error_outline</i></h2>"+
			  htmltickets +
			"</div>"+
		"</div>"+
		"<div class='col s12 m3'>"+
			"<div class='icon-block'>"+
			  "<h2 class='center black-text'><i class='material-icons'>verified_user</i></h2>"+
			  htmlforum +
			"</div>"+
		"</div>"+
    	"</div>"+
    	"</div>";
		
		return dashboard;
	}

	public boolean jqueryupdate() {
		return true;
	}
	
	public boolean pushnotification() {
		return false;
	}

}
