package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import LoadUtils.User;
import LoadUtils.UserSettings.Setting;

@WebServlet("/pages/profile")
public class Profile extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		User user = null;
		
		if(session != null){
		 	if(session.getAttribute("logedin") != null){
				if(session.getAttribute("logedin").toString().equals("true")){
					if(session.getAttribute("loaded") != null && !session.getAttribute("loaded").toString().equals("true")){
						response.sendRedirect("loaded.jsp");					
					}else if(session.getAttribute("loaded") == null){
						response.sendRedirect("loaded.jsp");
					}else{
						user = (User) session.getAttribute("user");
					}
				}else{
					response.sendRedirect("login.jsp");
				}
		 	}else{
		 		response.sendRedirect("login.jsp");
		 	}
		}else{
			response.sendRedirect("login.jsp");
		}
		
		if(user != null){
			
			if(request.getParameter("rps") != null && user.getSettings().getProxyServer() != Setting.Disabled){
				user.getSettings().setProxyServer(Setting.Activated);
			}else if(user.getSettings().getProxyServer() != Setting.Disabled){
				user.getSettings().setProxyServer(Setting.Deactivated);
			}
			
			if(request.getParameter("rsp") != null && user.getSettings().getSupport() != Setting.Disabled){
				user.getSettings().setSupport(Setting.Activated);
			}else if(user.getSettings().getSupport() != Setting.Disabled){
				user.getSettings().setSupport(Setting.Deactivated);
			}
			
			user.getSettings().saveChanges(user.getInfo().getUserid());
			user.reloadDatas();
			
			response.sendRedirect("index.jsp");
		}
		
	}

}
