package Datas;

public interface Data {
	
	public boolean updated();
	
	public void setUpdated(boolean bol);
	
	public void check(MySQL mysql);
	
	public String[] load(MySQL mysql);

}
