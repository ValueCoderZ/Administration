package LoadUtils;

import javax.servlet.http.HttpSession;

import LoadDatas.DashboardDatas;
import LoadDatas.ProxyDatas;
import LoadDatas.SpielerDatas;
import LoadDatas.SupportDatas;
import LoadUtils.UserSettings.Setting;
import LoginUtils.Groups;
import LoginUtils.UserDatabase;

public class User {
	
	private DashboardDatas dashboard = new DashboardDatas();
	
	private ProxyDatas proxyserver = null;
	private SupportDatas support = null;
	private SpielerDatas spieler = null;
	
	private Groups group;
	private UserInfo info;
	private UserSettings settings;
	
	public User(String name, HttpSession session) {
		this.group = Groups.getRankByName(UserDatabase.getGroup(name));
		this.info = new UserInfo(name);
		this.settings = new UserSettings(group, UserDatabase.getSettings(name));
		loadDatas();
	}
	
	public void loadDatas(){
		if(settings.getProxyServer() == Setting.Activated && proxyserver == null){
			proxyserver = new ProxyDatas();
		}
		if(settings.getSpieler() == Setting.Activated && spieler == null){
			spieler = new SpielerDatas();
		}
	}
	
	public void reloadDatas(){
		if(settings.getProxyServer() == Setting.Activated){
			proxyserver = null;
			proxyserver = new ProxyDatas();
		}else{
			proxyserver = null;
		}
	}
	
	public Groups getGroup() {
		return group;
	}
	
	public UserInfo getInfo() {
		return info;
	}
	
	public UserSettings getSettings() {
		return settings;
	}
	
	public DashboardDatas getDashboard() {
		return dashboard;
	}
	
	public ProxyDatas getProxyserver() {
		return proxyserver;
	}

	public SupportDatas getSupport() {
		return support;
	}

	public SpielerDatas getSpieler() {
		return spieler;
	}
	
}
