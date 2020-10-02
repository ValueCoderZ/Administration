package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import LoadUtils.User;

@WebServlet("/pages/searchplayer")
public class SearchPlayer extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

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
		
		if(user != null 
//				&& user.getSettings().getSpieler() == Setting.Activated
//				&& user.getSpieler() != null
				){
			if(request.getParameter("username") != null){
				String username = request.getParameter("username");
				session.setAttribute("search", username);
				response.sendRedirect("player.jsp");
			}else{
				response.sendRedirect("index.jsp");
			}
		}else{
			response.sendRedirect("index.jsp");
		}
		
	}

}
