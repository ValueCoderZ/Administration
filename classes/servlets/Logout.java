package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/pages/logout")
public class Logout extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session != null){
		 	if(session.getAttribute("logedin") != null){
				if(session.getAttribute("logedin").toString().equals("true")){
					
					session.removeAttribute("user");
					session.removeAttribute("loaded");
					session.removeAttribute("logedin");
					
					response.sendRedirect("login.jsp");
				}else{
					response.sendRedirect("login.jsp");
				}
		 	}else{
		 		response.sendRedirect("login.jsp");
		 	}
		}else{
			response.sendRedirect("login.jsp");
		}
	}

}
