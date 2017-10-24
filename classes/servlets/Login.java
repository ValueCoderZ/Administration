package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import LoginUtils.MD5Hash;
import LoginUtils.UserDatabase;

@WebServlet(description = "Login Servlet", urlPatterns = { "/pages/login" })
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("failure") != null){
			
			int failure = Integer.valueOf(session.getAttribute("failure").toString());
			if(failure < 11){
				
				String name = request.getParameter("username");
				String password = request.getParameter("password");
				
				if (UserDatabase.userRegistered(name)) {
					if(MD5Hash.isVerifiedPassword(name, password)){
						session.setAttribute("username", name);
				   		session.setAttribute("logedin", "true");
				   		session.setAttribute("group", UserDatabase.getGroup(name));
				   		response.sendRedirect("load.jsp");
					}else{
						failure++;
						response.sendRedirect("login.jsp");
						session.setAttribute("failure", failure);
					}
				} else {
					response.sendRedirect("login.jsp");
				}
			}else{
				response.sendRedirect("login.jsp");
			}
		}else{
			String name = request.getParameter("username");
			String password = request.getParameter("password");
				
			if (UserDatabase.userRegistered(name)) {
				if(MD5Hash.isVerifiedPassword(name, password)){
					session.setAttribute("username", name);
			   		session.setAttribute("logedin", "true");
			   		session.setAttribute("group", UserDatabase.getGroup(name));
			   		response.sendRedirect("load.jsp");
				}else{
					response.sendRedirect("login.jsp");
					session.setAttribute("failure", 1);
				}
			}else{
				response.sendRedirect("login.jsp");
			}
		}
	}
}
