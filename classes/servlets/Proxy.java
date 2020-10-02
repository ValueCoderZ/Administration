package Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import LoadUtils.User;

@WebServlet("/pages/proxy")
public class Proxy extends HttpServlet {
	
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
		
		if(user != null && user.getProxyserver() != null){
			
			if(request.getParameter("mline1") != null && request.getParameter("mline2") != null){
				String mline1 = request.getParameter("mline1").toString().replace("&", "§");
				String mline2 = request.getParameter("mline2").toString().replace("&", "§");
				user.getProxyserver().setMotd(mline1 + ":" + mline2);
			}
			
			if(request.getParameter("wmline1") != null && request.getParameter("wmline2") != null){
				String wmline1 = request.getParameter("wmline1").toString().replace("&", "§");
				String wmline2 = request.getParameter("wmline2").toString().replace("&", "§");
				user.getProxyserver().setWartungsmotd(wmline1 + ":" + wmline2);
			}
			
			if(request.getParameter("pswm") != null){
				user.getProxyserver().setWartung(true);
			}else{
				user.getProxyserver().setWartung(false);
			}
			
			if(request.getParameter("psal") != null){
				user.getProxyserver().setAlerts(true);
			}else{
				user.getProxyserver().setAlerts(false);
			}
			
			if(request.getParameter("psgm") != null){
				user.getProxyserver().setGlobalmute(true);
			}else{
				user.getProxyserver().setGlobalmute(false);
			}
			
			if(request.getParameter("pssm") != null){
				user.getProxyserver().setSlowmode(true);
			}else{
				user.getProxyserver().setSlowmode(false);
			}
			
			user.getProxyserver().savechanges();
			
			response.sendRedirect("index.jsp");
		}
		
	}

}
