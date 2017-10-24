package Modules;

import com.mysql.fabric.xmlrpc.base.Data;

public interface Module {
	
	public String prefix();
	
	public String build(Data data);
	
	public boolean jqueryupdate();

}
