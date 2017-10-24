package LoadUtils;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Load {
	
	public static ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1000);
	
	public Load(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("username") != null){
			String name = session.getAttribute("username").toString();
			User user = new User(name, session);
			
			session.setAttribute("user", user);
			
			User re = (User) session.getAttribute("user");
			re.loadDatas();
			
			session.setAttribute("loaded", "true");
		}
	}

}
