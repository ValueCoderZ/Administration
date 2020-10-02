<%@page import="LoadUtils.User"%>
<%@page import="LoadUtils.UserSettings.Setting"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Administration</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body class="dark">
	<%
	
	User user = null;
	
	if(session != null){
	 	if(session.getAttribute("logedin") != null){
			if(session.getAttribute("logedin").toString().equals("true")){
				if(session.getAttribute("loaded") != null && !session.getAttribute("loaded").toString().equals("true")){
					response.sendRedirect("load.jsp");					
				}else if(session.getAttribute("loaded") == null){
					response.sendRedirect("load.jsp");
				}else if(session.getAttribute("user") != null){
					user = (User) session.getAttribute("user");
				}else{
					session.setAttribute("loaded", "false");
					response.sendRedirect("load.jsp");
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
	
	String search;
	
	if(user != null){
		if(session.getAttribute("search") != null){
			search = session.getAttribute("search").toString();
		}else{
			System.out.println("Search not found...");
			response.sendRedirect("index.jsp");
		}
	}else{
		System.out.println("User not found...");
		response.sendRedirect("index.jsp");
	}
	%>
	
	<div id="logoutmodal" class="modal">
		<form method="post" action="logout" class="col s12">
			<div class="modal-content" align="center">
				<h4 class="grey-text">Abmeldung</h4>
				<br>
				<h5 class="black-text">Bist du sicher, dass du dich abmelden willst?</h5>
			</div>
			<div class="modal-footer" align="center">
	      		<a class="modal-action modal-close waves-effect waves-green btn-flat">Abrechen</a>
	      		<button class="waves-effect waves-red btn-flat" type="submit" name="action">Bestätigen</button>
	      		<!--<a class="waves-effect waves-green btn-flat" type="submit">Speichern</a> -->
	    	</div>
		</form>
	</div>
	
    <ul id="slide-out" class="side-nav">
        <%
  		if(user != null){
  			%>
  			<li>
	            <div class="user-view">
	                <div class="background">
	                    <img src="images/background2.jpg">
	                </div>
		            <a><img class="circle" src="http://cravatar.eu/helmavatar/<%out.write(user.getInfo().getUsername()); %>/64"></a>
		            <a><span class="white-text name"><%out.write(user.getInfo().getUsername()); %></span></a>
		            <a><span class="<%out.write(user.getGroup().getPrefix());%> email"><%out.write(user.getGroup().getRank()); %></span></a>
	        	</div>
	      	</li>
  			<%
  		}
  		%>
	    <li><a class="waves-effect"  href="index.jsp"><i class="material-icons">dashboard</i>Hauptseite</a></li>
	    <li><div class="divider"></div></li>
        <li><a class="waves-effect" href="#playerdatas"><i class="material-icons">library_books</i>Informationen</a></li>
      	<li><a class="waves-effect" href="#playerbans"><i class="material-icons">lock_outline</i>Banstatistik</a></li>
  	</ul>
	
	<div class="navbar-fixed">
      <nav class="white" role="navigation">
        <div class="nav-wrapper container">

            <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
            <a id="logo-container" href="#" class="brand-logo">Logo</a>
            <ul class="right hide-on-med-and-down">
                <li><a href="#" data-activates="slide-out" class="button-collapse show-on-large tooltipped" data-position="bottom" data-delay="50" data-tooltip="Menü öffnen"><i class="material-icons">subject</i></a></li>
                <li><a href="#" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Shop aufrufen"><i class="material-icons">shopping_cart</i></a></li>
                <li><a href="#" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Forum aufrufen"><i class="material-icons">work</i></a></li>
                <li><a href="#" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Livechat aufrufen"><i class="material-icons">question_answer</i></a></li>
                <li><a href="#logoutmodal" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Abmelden"><i class="material-icons">power_settings_new</i></a></li>
            </ul>
        </div>
   	 </nav>
  	</div>
  	
  	<div class="parallax-container valign-wrapper">
    	<div class="section no-pad-bot">
     	 <div class="container"></div>
    	</div>
       <div class="parallax"><img src="images/background1.jpg" alt=""></div>
    </div> 
    
    <div class="container">
	    <div id="playerdatas" class="section scrollspy">    
	       	<div class="col s12 m8" align="center">
	       		<div class="row valing-wrapper">
	       			<div class="col s2">
	       				<img alt="" src="images/background1.jpg" class="circle responsive-img">
	       			</div>
	       			<div class="col s10">
	       				<h5 class="black-text">Ancoplays</h5>
	       				<h5 class="<%out.write(user.getGroup().getPrefix());%>">Administrator</h5>
	       				<span class="black-text">Here will be the UUID</span>
	       			</div>
	       		</div>
			</div>
	    </div>
    </div>
    
    <div class="parallax-container valign-wrapper">
    	<div class="section no-pad-bot">
     	 <div class="container"></div>
    	</div>
       <div class="parallax"><img src="images/background1.jpg" alt=""></div>
    </div>     
	
	<footer class="page-footer grey darken-3">
    <div class="footer-copyright">
      <div class="container">
      &copy; Copyright by <a class="brown-text text-lighten-3" href="http://pumpkingames.eu">Pumpkingames.eu</a> | Hosted by <a class="brown-text text-lighten-3" href="https://zap-hosting.com">Zap Hosting</a> | Made with <a href="http://materializecss.com/" class="brown-text text-lighten-3">Materializecs</a>
      </div>
    </div>
  </footer>


  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
  
  <script>
   $(".button-collapse").sideNav();      
  </script>
  
</body>    
</html>