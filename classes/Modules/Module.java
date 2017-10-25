package Modules;

import Datas.Data;

public interface Module {
	
	public String prefix();
	
	public String build(Data data);
	
	public boolean jqueryupdate();
	
	public boolean pushnotification();

}
