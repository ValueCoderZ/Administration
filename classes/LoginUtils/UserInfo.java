package LoadUtils;

import javax.imageio.ImageIO;

import LoginUtils.UserDatabase;

public class UserInfo {
	
	private String username;
	private int userid;
	private ImageIO profile;
	
	public UserInfo(String name) {
		username = name;
		userid = UserDatabase.getUserID(name);
	}

	public int getUserid() {
		return userid;
	}

	public ImageIO getProfile() {
		return profile;
	}
	
	public String getUsername() {
		return username;
	}
	
}
