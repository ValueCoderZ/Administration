<%@page import="LoadUtils.UserSettings.Setting"%>
<%@page import="LoadUtils.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
	
    <div id="profilemodal" class="modal">
	    <form method="post" action="profile" class="col s12">
	    	<div class="modal-content" align="center">
	      		<h4 class="grey-text">Deine Einstellungen</h4>
	      		<br>
	      		<div class="row">
	            	<div class="row">
	                	<div class="switch col s3" align="center">
	                		<%
	                		if(user != null){
	                			if(user.getSettings().getProxyServer() == Setting.Activated){
	                			%>
	                			<p>
	                				<input type="checkbox" name="rps" id="rps" checked>
	                				<label for="rps">Rubrik ProxyServer</label>
	                			</p>
	                			<%
	                			}else if(user.getSettings().getProxyServer() == Setting.Disabled){
	                			%>
	                			<p>
	                				<input type="checkbox" name="rps" id="rps" disabled>
	                				<label for="rps">Rubrik ProxyServer</label>
	                			</p>
	                			<%
	                			}else{
	                			%>
	                			<p>
	                				<input type="checkbox" name="rps" id="rps">
	                				<label for="rps">Rubrik ProxyServer</label>
	                			</p>
	                			<%
	                			}
	                		}
	                		%>
	                	</div>
	                	<div class="switch col s3" align="center">
	                		<p>
	                			<input type="checkbox" name="rsp" id="rsp" disabled>
	                			<label for="rsp">Rubrik Support</label>
	                		</p>
	                	</div>
	                	<div class="switch col s3" align="center">
	               			 <p>
	                			<input type="checkbox" name="rpl" id="rpl" disabled>
	                			<label for="rpl">Rubrik Spieler</label>
	                		</p>
	               	 	</div>
	               	 	<div class="switch col s3" align="center">
	                		<p>
	                			<input type="checkbox" name="rbs" id="rbs" disabled>
	                			<label for="rbs">Rubrik BauServer</label>
	                		</p>
	                	</div>
	            	</div>
	            	<div class="row">
	               		<div class="switch col s3" align="center">
	                		<p>
	                			<input type="checkbox" name="rbu" id="rbu" disabled>
	                			<label for="rbu">Rubrik Shop    </label>
	                		</p>
	                	</div>
	                	<div class="switch col s3" align="center">
	                		<p>
	                			<input type="checkbox" name="rlc" id="rlc" disabled>
	                			<label for="rlc">Rubrik Livechat</label>
	                		</p>
	                	</div>
	                	<div class="switch col s3" align="center">
	                		<p>
	                			<input type="checkbox" name="rcl" id="rcl" disabled>
	                			<label for="rcl">Rubrik Cloud</label>
	                		</p>
	                	</div>
	               	 	<div class="switch col s3" align="center">
	                		<p>
	                			<input type="checkbox" name="rad" id="rad" disabled>
	                			<label for="rad">Rubrik Administration</label>
	                		</p>
	                	</div>
	            	</div>
	      		</div>
	    	</div>
	    	<div class="modal-footer">
	      		<a class="modal-action modal-close waves-effect waves-red btn-flat">Abrechen</a>
	      		<button class="waves-effect waves-green btn-flat" type="submit" name="action">Speichern</button>
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
      	<li><a class="waves-effect" href="#profilemodal"><i class="material-icons">settings</i>Deine Einstellungen</a></li>
      	<li><a class="waves-effect"  href="#dashboard"><i class="material-icons">dashboard</i>Dashboard</a></li>
      <!-- ProxyServer -->
      <%
      if(user != null && user.getSettings().getProxyServer() == Setting.Activated){
    	  %>
    	  <li><div class="divider"></div></li>
      	  <li><a class="subheader">ProxyServer</a></li>
      	  <li><a class="waves-effect" href="#proxysettings"><i class="material-icons">settings</i>Einstellungen</a></li>
     	  <%
      	  if(user.getProxyserver() != null && user.getProxyserver().isAlerts()){
      		%>
       	  	<li><a class="waves-effect" href="#proxyalerts"><i class="material-icons">chat_bubble</i>Alerts</a></li>
      	  	<%
      	  }
      }
      
      %>
      <!-- BauServer
      <li><div class="divider"></div></li>
      <li><a class="subheader">BauServer</a></li>
      <li><a class="waves-effect" href="#!">Aufträge</a></li>
      <li><a class="waves-effect" href="#!">Welten</a></li>
      <li><a class="waves-effect" href="#!">Backups</a></li>
      -->
      
      <!-- Support -->
      <%
      if(user != null && user.getSettings().getSupport() == Setting.Activated){
    	  %>
    	  <li><div class="divider"></div></li>
      	  <li><a class="subheader">Support</a></li>     
          <li><a class="waves-effect" href="#supportreports"><i class="material-icons">warning</i>Reports</a></li>
      	  <li><a class="waves-effect" href="#supporttickets"><i class="material-icons">library_books</i>Tickets</a></li>
      	  <li><a class="waves-effect" href="#supportbans"><i class="material-icons">lock_outline</i>Bans</a></li>
    	  <%
      }
      %>
      <!-- Spieler -->
      <%
      if(user != null && user.getSettings().getSpieler() == Setting.Activated){
    	  %>
    	  <li><div class="divider"></div></li>
     	  <li><a class="subheader">Spieler</a></li>
      	  <li><a class="waves-effect" href="#playerstats"><i class="material-icons">assessment</i>Statistiken</a></li>
      	  <li><a class="waves-effect" href="#playerranking"><i class="material-icons">grade</i>Ränge</a></li>
    	  <%
      }
      %>
      <!-- Administration -->
      <%
      if(user != null && user.getSettings().getAdministration() == Setting.Activated){
    	  %>
    	  <li><div class="divider"></div></li>
      	  <li><a class="subheader">Administration</a></li>
      	  <li><a class="waves-effect" href="#!"><i class="material-icons">supervisor_account</i>Benutzer</a></li>
      	  <li><a class="waves-effect" href="#!"><i class="material-icons">mode_edit</i>Gruppen</a></li>
    	  <%
      }
      %>
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
     	 <div class="container">
        	<div class="row center">
         		 <h1 class="header white-text">Willkommen</h1>
        	</div>
      	 </div>
    	</div>
       <div class="parallax"><img src="images/background1.jpg" alt="Unsplashed background img 1"></div>
    </div>


  <div class="container">
    <div id="dashboard" class="section scrollspy">    
      <!--   Icon Section   -->
      <div class="row">
        <div class="col s12 m3">
          <div class="icon-block">
            <h2 class="center black-text"><i class="material-icons">message</i></h2>
            <%
            if(user != null){
            	if(user.getDashboard().isOnline()){
            		%><h5 class="center green-text">Online</h5><%
            	}else{
            		%><h5 class="center red-text">Offline</h5><%
            	}
            }else{
            	%><h5 class="center green-text">Online</h5><%
            }
            %>
          </div>
        </div>

        <div class="col s12 m3">
          <div class="icon-block">
            <h2 class="center black-text"><i class="material-icons">group</i></h2>
            <%
            if(user != null){
            	%><h5 class="center orange-text"><%out.print(user.getDashboard().getPlayers()); %> Spieler</h5><%
            }else{
            	%> <h5 class="center orange-text">???? Spieler</h5><%
            }
            %>
          </div>
        </div>

        <div class="col s12 m3">
          <div class="icon-block">
            <h2 class="center black-text"><i class="material-icons">error_outline</i></h2>
            <%
            if(user != null){
            	if(user.getDashboard().getTickets() == 0){
            		%><h5 class="center green-text"><%out.print(user.getDashboard().getTickets()); %> Tickets</h5><%            		
            	}else if(user.getDashboard().getTickets() >= 100){
            		%><h5 class="center red-text"><%out.print(user.getDashboard().getTickets()); %> Tickets</h5><%
            	}else{
            		%><h5 class="center orange-text"><%out.print(user.getDashboard().getTickets()); %> Tickets</h5><%
            	}
            }else{
            	%><h5 class="center orange-text">? Tickets</h5><%
            }
            %>
          </div>
        </div>
        
        <div class="col s12 m3">
          <div class="icon-block">
            <h2 class="center black-text"><i class="material-icons">verified_user</i></h2>
            <%
            if(user != null){
            	%><h5 class="center red-text"><%out.print(user.getDashboard().getTeam()); %> Teammitglieder</h5><%
            }else{
            	%> <h5 class="center red-text">???? Teammitglieder</h5><%
            }
            %>
          </div>
        </div>  
      </div>

    </div>
  </div>


  <!-- Rubrik ProxyServer -->
  <%
	if(user != null && user.getSettings().getProxyServer() == Setting.Activated){
	%>
		<div class="parallax-container valign-wrapper">
    		<div class="section no-pad-bot">
      			<div class="container"></div>
   			</div>
    		<div class="parallax"><img src="images/background2.jpg" alt="Unsplashed background img 2"></div>
  		</div>

  		<div class="container">
    		<div id="proxysettings" class="section scrollspy" alt="test">

      		<div class="row">
			<%
			if(user != null && user.getProxyserver() != null){
			%>
				<form class="col s12" method="post" action="proxy">
           	 		<div class="row">
                		<div class="input-field col s6">
                    		<input name="mline1" id="mline1" value="<%out.write(user.getProxyserver().getMotd().split(":")[0].replace("§", "&"));%>" type="text" class="validate">
                    		<label for="mline1">Motd Zeile 1</label>
                		</div>
                		<div class="input-field col s6">
                    		<input name="mline2" id="icon_telephone" value="<%out.write(user.getProxyserver().getMotd().split(":")[1].replace("§", "&"));%>" type="text" class="validate">
                    		<label for="icon_telephone">Motd Zeile 2</label>
                		</div>
            		</div>
            		<div class="row">
                		<div class="input-field col s6">
                    		<input name="wmline1" id="icon_prefix" value="<%out.write(user.getProxyserver().getWartungsmotd().split(":")[0].replace("§", "&"));%>" type="text" class="validate">
                    		<label for="icon_prefix">Wartung Motd Zeile 1</label>
                		</div>
                		<div class="input-field col s6">
                   			<input name="wmline2" id="icon_telephone" value="<%out.write(user.getProxyserver().getWartungsmotd().split(":")[1].replace("§", "&"));%>" type="text" class="validate">
                    		<label for="icon_telephone">Wartung Motd Zeile 2</label>
                		</div>
            		</div>
            		<div class="row">
            			<%
            			if(user.getProxyserver().isWartung()){
            				%>
            				<div class="switch col s3" align="center">
	                			<p>
	                				<input type="checkbox" name="pswm" id="pswm" checked>
	                				<label for="pswm">Wartungsmodus</label>
	                			</p>
                			</div>
            				<%
            			}else{
            				%>
            				<div class="switch col s3" align="center">
	                			<p>
	                				<input type="checkbox" name="pswm" id="pswm">
	                				<label for="pswm">Wartungsmodus</label>
	                			</p>
                			</div>
            				<%
            			}
            			%>
            			<%
            			if(user.getProxyserver().isAlerts()){
            				%>
            				<div class="switch col s3" align="center">
	                			<p>
	                				<input type="checkbox" name="psal" id="psal" checked>
	                				<label for="psal">Alerts</label>
	                			</p>
                			</div>
            				<%
            			}else{
            				%>
            				<div class="switch col s3" align="center">
	                			<p>
	                				<input type="checkbox" name="psal" id="psal">
	                				<label for="psal">Alerts</label>
	                			</p>
                			</div>
            				<%
            			}
            			%>
            			<%
            			if(user.getProxyserver().isGlobalmute()){
            				%>
            				<div class="switch col s3" align="center">
	                			<p>
	                				<input type="checkbox" name="psgm" id="psgm" checked>
	                				<label for="psgm">Globalmute</label>
	                			</p>
                			</div>
            				<%
            			}else{
            				%>
            				<div class="switch col s3" align="center">
	                			<p>
	                				<input type="checkbox" name="psgm" id="psgm">
	                				<label for="psgm">Globalmute</label>
	                			</p>
                			</div>
            				<%
            			}
            			%>
            			<%
            			if(user.getProxyserver().isSlowmode()){
            				%>
            				<div class="switch col s3" align="center">
	                			<p>
	                				<input type="checkbox" name="pssm" id="pssm" checked>
	                				<label for="pssm">Slowmode</label>
	                			</p>
                			</div>
            				<%
            			}else{
            				%>
            				<div class="switch col s3" align="center">
	                			<p>
	                				<input type="checkbox" name="pssm" id="pssm">
	                				<label for="pssm">Slowmode</label>
	                			</p>
                			</div>
            				<%
            			}
            			%>
            		</div>
            		<div class="row col s12" align="center">
            			<button class="green waves-effect waves-light btn" type="submit" name="action">Speichern</button>    
                		<!-- <a class="green waves-effect waves-light btn">Speichern</a> -->    
            		</div>     
        		</form>
			<%
			}else{
			%> 
				<h3 class="red-text" align="center">Error</h3>
          		<h5 class="grey-text darken-2" align="center">Die Daten konnten nicht geladen werden</h5>
			<%
			}
			%>      
      		</div>
    	</div>
  	</div>

		<%
		if(user != null && user.getProxyserver() != null && user.getProxyserver().isAlerts()){
		%>
		<div class="parallax-container valign-wrapper">
    		<div class="section no-pad-bot">
      			<div class="container"></div>
    		</div>
    		<div class="parallax"><img src="images/background3.jpg" alt="Unsplashed background img 3"></div>
  		</div>
    
  		<div class="container">
    		<div id="proxyalerts" class="section scrollspy">

      			<div class="row">
	        		<ul class="collapsible" data-collapsible="accordion">
		            	<li>
		                	<div class="collapsible-header"><i class="material-icons">shopping_basket</i>Werbung</div>
		                	<div class="collapsible-body">
		                    	<form>
		                        	<div class="input-field">
		                            	<input id="icon_prefix" type="text" class="validate">
		                            	<label for="icon_prefix">Nachricht</label>
		                        	</div>
		                        	<div class="row" align="center">
		                       	 		<p>
		                					<input type="checkbox" id="psaw">
		                					<label for="psaw">Senden</label>
		                				</p>
		                				<!--
		                            	<label>
		                            		Deaktiviert
		                                	<input type="checkbox">
		                                	<span class="lever"></span>
		                                	Aktiviert
		                            	</label>
		                            	-->
		                        	</div>
		                        	<div align="center">    
		                            	<a class="green waves-effect waves-light btn">Speichern</a>    
		                        	</div>  
		                    	</form>  
		                	</div>
		            	</li>
		            	<li>
		                	<div class="collapsible-header"><i class="material-icons">info</i>Information</div>
		                	<div class="collapsible-body">
		                    	<form>
		                        	<div class="input-field">
		                                <input id="icon_prefix" type="text" class="validate">
		                                <label for="icon_prefix">Nachricht</label>
		                        	</div>
		                        	<div class="row" align="center">
		                       	 		<p>
		                					<input type="checkbox" id="psaw">
		                					<label for="psaw">Senden</label>
		                				</p>
		                				<!--
		                            	<label>
		                                	Deaktiviert
		                                	<input type="checkbox">
		                                	<span class="lever"></span>
		                                	Aktiviert
		                            	</label>
		                            	-->
		                        	</div>
		                        	<div align="center">    
		                            	<a class="green waves-effect waves-light btn">Speichern</a>    
		                        	</div>  
		                   	 	</form>  
		                	</div>
		            	</li>
		            	<li>
		                	<div class="collapsible-header"><i class="material-icons">new_releases</i>Neuigkeiten</div>
		                	<div class="collapsible-body">
		                    	<form>
		                        	<div class="input-field">
		                                <input id="icon_prefix" type="text" class="validate">
		                                <label for="icon_prefix">Nachricht</label>
		                        	</div>
		                        	<div class="row" align="center">
		                       	 		<p>
		                					<input type="checkbox" id="psaw">
		                					<label for="psaw">Senden</label>
		                				</p>
		                				<!--
		                            	<label>
		                               		Deaktiviert
		                                	<input type="checkbox">
		                                	<span class="lever"></span>
		                                	Aktiviert
		                           	 	</label>
		                           		-->
		                        	</div>
		                        	<div class="" align="center">    
		                            	<a class="green waves-effect waves-light btn">Speichern</a>    
		                        	</div>  
		                    	</form>  
		                	</div>
		            	</li>
	        		</ul>  
	      		</div>
	    	</div>
	 	 </div>
	<%
	}
	}else{
		%>
		<!-- is not there -->
		<%
	}
	%>
  
  <!-- Rubrik Support -->
  <%
  if(user != null && user.getSettings().getSupport() == Setting.Activated){
	  %>
	  <div class="parallax-container valign-wrapper">
    	<div class="section no-pad-bot">
      		<div class="container">
        		<div class="row center">
          			<h1 class="header white-text">Support</h1>
        		</div>
      		</div>
    	</div>
    	<div class="parallax"><img src="images/background3.jpg" alt="Unsplashed background img 3"></div>
  	  </div>
	  
	  <div class="container">
    	<div id="supportreports" class="section scrollspy">
      		<div class="row">
          		<h3 class="red-text" align="center">Coming Soon</h3>
          		<h5 class="grey-text darken-2" align="center">Hier wirst du die aktuellen Reports einsehen können</h5>
      		</div>

    	</div>
  	  </div>

  	  <div class="parallax-container valign-wrapper">
    	<div class="section no-pad-bot"></div>
    	<div class="parallax"><img src="images/background3.jpg" alt="Unsplashed background img 3"></div>
  	  </div>
    
  	  <div class="container">
    	<div id="supporttickets" class="section scrollspy">
      		<div class="row">
          		<h3 class="red-text" align="center">Coming Soon</h3>
          		<h5 class="grey-text darken-2" align="center">Hier wirst du die Tickets einsehen können</h5>
      		</div>
    	</div>
  	  </div>
  	  
  	  <div class="parallax-container valign-wrapper">
    	<div class="section no-pad-bot"></div>
    	<div class="parallax"><img src="images/background3.jpg" alt="Unsplashed background img 3"></div>
  	  </div>
    
  	  <div class="container">
    	<div id="supportbans" class="section scrollspy">
      		<div class="row">
          		<ul class="collapsible" data-collapsible="accordion">
            		<li>
                		<div class="collapsible-header">Temporäre Bans</div>
                		<div class="collapsible-body">
                    		<table>
                        		<thead>
                            		<tr>
                                		<th>Name</th>
                                		<th>Grund</th>
                                		<th>Datum</th>
                                		<th>Banner</th>
                                		<th>Optionen</th>
                            		</tr>
                        		</thead>
                        		<tbody>
                            		<tr>
                               	 		<td>Ancoplays</td>
                                		<td>Hacking</td>
                                		<td>08.07.2017</td>
                                		<td>schrottihotti</td>
                                		<td><a class="red waves-effect waves-light btn tooltipped" data-position="right" data-delay="50" data-tooltip="Spieler entbannen">Löschen</a></td>
                           	 		</tr>
                        		</tbody>
                    		</table>  
                		</div>
            		</li>
            		<li>
                		<div class="collapsible-header">Temporäre Mutes</div>
                		<div class="collapsible-body">
                    		<table>
                        		<thead>
                            		<tr>
                                		<th>Name</th>
                                		<th>Grund</th>
                                		<th>Datum</th>
	                                	<th>Muter</th>
	                                	<th>Optionen</th>
                            		</tr>
                        		</thead>
	                        	<tbody>
		                            <tr>
	                                	<td>Ancoplays</td>
	                                	<td>Hacking</td>
	                                	<td>08.07.2017</td>
	                                	<td>schrottihotti</td>
	                                	<td><a class="red waves-effect waves-light btn tooltipped" data-position="right" data-delay="50" data-tooltip="Spieler entmuten">Löschen</a></td>
	                            	</tr>
	                        	</tbody>
	                    	</table>  
	                	</div>
	            	</li>
	            	<li>
	                	<div class="collapsible-header">Permanente Bans</div>
	                	<div class="collapsible-body">
	                    	<table>
	                        	<thead>
	                           		<tr>
	                                	<th>Name</th>
	                                	<th>Grund</th>
	                                	<th>Datum</th>
	                                	<th>Banner</th>
	                                	<th>Optionen</th>
	                            	</tr>
	                        	</thead>
	                        	<tbody>
	                           		<tr>
	                                	<td>Ancoplays</td>
	                                	<td>Hacking</td>
	                                	<td>08.07.2017</td>
	                                	<td>schrottihotti</td>
	                                	<td><a class="red waves-effect waves-light btn tooltipped" data-position="right" data-delay="50" data-tooltip="Spieler entbanen">Löschen</a></td>
	                            	</tr>
	                        	</tbody>
	                    	</table>  
	                	</div>
	            	</li>
	            	<li>
	                	<div class="collapsible-header">Permanente Mutes</div>
	                	<div class="collapsible-body">
	                    	<table>
	                        	<thead>
	                            	<tr>
	                                	<th>Name</th>
	                                	<th>Grund</th>
	                                	<th>Datum</th>
	                                	<th>Muter</th>
	                                	<th>Optionen</th>
	                            	</tr>
	                        	</thead>
	                        	<tbody>
		                            <tr>
	                                	<td>Ancoplays</td>
	                                	<td>Hacking</td>
	                                	<td>08.07.2017</td>
	                                	<td>schrottihotti</td>
	                                	<td><a class="red waves-effect waves-light btn tooltipped" data-position="right" data-delay="50" data-tooltip="Spieler entmuten">Löschen</a></td>
	                            	</tr>
	                        	</tbody>
	                    	</table>  
	                	</div>
	            	</li>  
        		</ul>
      		</div>
    	</div>
  	</div>
  <%
  }
  %>
  
  <!-- Rubrik Spieler -->
  <%
  if(user != null && user.getSettings().getSpieler() == Setting.Activated){
	  %>
	  <div class="parallax-container valign-wrapper">
	    <div class="section no-pad-bot">
	      <div class="container">
	        <div class="row center">
	          <h1 class="header white-text">Spieler</h1>
	        </div>
	      </div>
	    </div>
	    <div class="parallax"><img src="images/background3.jpg" alt="Unsplashed background img 3"></div>
	  </div>
	    
	  <div class="container">
	    <div id="playerstats" class="section scrollspy">
	
	      <div class="row">
	          <ul class="collapsible" data-collapsible="accordion">
	            <li>
	                <div class="collapsible-header">Heroes</div>
	                <div class="collapsible-body">
	                    <table>
	                        <thead>
	                            <tr>
	                                <th>Platzierung</th>
	                                <th>Name</th>
	                                <th>Siege</th>
	                                <th>Niederlagen</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td>1</td>
	                                <td>Ancoplays</td>
	                                <td>100</td>
	                                <td>1</td>
	                            </tr>
	                        </tbody>
	                    </table>  
	                </div>
	            </li>
	            <li>
	                <div class="collapsible-header">Werwolf</div>
	                <div class="collapsible-body">
	                    <table>
	                        <thead>
	                            <tr>
	                                <th>Platzierung</th>
	                                <th>Name</th>
	                                <th>Siege</th>
	                                <th>Niederlagen</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td>1</td>
	                                <td>Ancoplays</td>
	                                <td>100</td>
	                                <td>1</td>
	                            </tr>
	                        </tbody>
	                    </table>  
	                </div>
	            </li>
	            <li>
	                <div class="collapsible-header">Duel</div>
	                <div class="collapsible-body">
	                    <ul class="collapsible" data-collapsible="accordion">
	                        <li>
	                            <div class="collapsible-header">SuperJump</div>
	                            <div class="collapsible-body">
	                                <table>
	                                    <thead>
	                                        <tr>
	                                            <th>Platzierung</th>
	                                            <th>Name</th>
	                                            <th>Siege</th>
	                                            <th>Niederlagen</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td>1</td>
	                                            <td>Ancoplays</td>
	                                            <td>100</td>
	                                            <td>1</td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>    
	                        </li>
	                        <li>
	                            <div class="collapsible-header">1vs1</div>
	                            <div class="collapsible-body">
	                                <table>
	                                    <thead>
	                                        <tr>
	                                            <th>Platzierung</th>
	                                            <th>Name</th>
	                                            <th>Siege</th>
	                                            <th>Niederlagen</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td>1</td>
	                                            <td>Ancoplays</td>
	                                            <td>100</td>
	                                            <td>1</td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>    
	                        </li>
	                        <li>
	                            <div class="collapsible-header">Syndicate Games</div>
	                            <div class="collapsible-body">
	                                <table>
	                                    <thead>
	                                        <tr>
	                                            <th>Platzierung</th>
	                                            <th>Name</th>
	                                            <th>Siege</th>
	                                            <th>Niederlagen</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                        <tr>
	                                            <td>1</td>
	                                            <td>Ancoplays</td>
	                                            <td>100</td>
	                                            <td>1</td>
	                                        </tr>
	                                    </tbody>
	                                </table>
	                            </div>    
	                        </li>
	                    </ul>  
	                </div>
	            </li> 
	        </ul>
	      </div>
	
	    </div>
	  </div>
	
	  <div class="parallax-container valign-wrapper">
	    <div class="section no-pad-bot">
	    </div>
	    <div class="parallax"><img src="images/background3.jpg" alt="Unsplashed background img 3"></div>
	  </div>
	    
	  <div class="container">
	    <div id="playerranking" class="section scrollspy">
	        
	      <div class="row">
	          <div class="col s12">
	            <ul class="tabs">
	                <li class="tab col s6"><a href="#search"><i class="material-icons">search</i></a></li>
	                <li class="tab col s6"><a class="active" href="#neueste">Neueste</a></li>
	            </ul>
	          </div>
	          <div id="search" class="col s12" align="center">
	            <br>
	            <div class="row" align="center">
	                <form method="post" action="searchplayer">
	                	<div class="row col s12" align="center">
	                		<div class="input-field col s5">
	                        	<input name="username" id="icon_prefix" type="text" class="validate" required="">
	                        	<label for="icon_prefix">Spielername</label>
	                   		</div>
	                    	<div class="col s2"> 
	                    		<button class="orange waves-effect waves-light btn" type="submit" name="action">Suchen</button>   
	                    	    <!--<a class="orange waves-effect waves-light btn">Suchen</a>-->    
	                    	</div>
	                	</div>
	                </form>
	            </div>
	          </div>
	          <div id="neueste" class="col s12" align="center">
	            <br>
	            <!-- Reihe 1/5 -->  
	            <div class="row">
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/Ancoplays/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>Ancoplays</h5>
	                            <h5 class="red-text">Owner</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/schrottihotti/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>schrottihotti</h5>
	                            <h5 class="red-text">Owner</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/HerrZweistein/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>HerrZweistein</h5>
	                            <h5 class="red-text">Administration</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/AlafTheViking/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>AlafTheViking</h5>
	                            <h5 class="green-text">Architekt</h5>
	                        </div>
	                    </div>
	                </div>   
	            </div>
	            <!-- Reihe 2/5 -->  
	            <div class="row">
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/Ancoplays/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>Ancoplays</h5>
	                            <h5 class="red-text">Owner</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/schrottihotti/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>schrottihotti</h5>
	                            <h5 class="red-text">Owner</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/HerrZweistein/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>HerrZweistein</h5>
	                            <h5 class="red-text">Administration</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/AlafTheViking/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>AlafTheViking</h5>
	                            <h5 class="green-text">Architekt</h5>
	                        </div>
	                    </div>
	                </div>   
	            </div>
	            <!-- Reihe 3/5 -->  
	            <div class="row">
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/Ancoplays/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>Ancoplays</h5>
	                            <h5 class="red-text">Owner</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/schrottihotti/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>schrottihotti</h5>
	                            <h5 class="red-text">Owner</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/HerrZweistein/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>HerrZweistein</h5>
	                            <h5 class="red-text">Administration</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/AlafTheViking/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>AlafTheViking</h5>
	                            <h5 class="green-text">Architekt</h5>
	                        </div>
	                    </div>
	                </div>   
	            </div>
	            <!-- Reihe 4/5 -->  
	            <div class="row">
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/Ancoplays/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>Ancoplays</h5>
	                            <h5 class="red-text">Owner</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/schrottihotti/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>schrottihotti</h5>
	                            <h5 class="red-text">Owner</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/HerrZweistein/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>HerrZweistein</h5>
	                            <h5 class="red-text">Administration</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/AlafTheViking/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>AlafTheViking</h5>
	                            <h5 class="green-text">Architekt</h5>
	                        </div>
	                    </div>
	                </div>   
	            </div>
	            <!-- Reihe 5/5 -->  
	            <div class="row">
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/Ancoplays/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>Ancoplays</h5>
	                            <h5 class="red-text">Owner</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/schrottihotti/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>schrottihotti</h5>
	                            <h5 class="red-text">Owner</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/HerrZweistein/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>HerrZweistein</h5>
	                            <h5 class="red-text">Administration</h5>
	                        </div>
	                    </div>
	                </div>
	                <div class="col s3">
	                    <div class="card">
	                        <div class="card-image">
	                            <img src="http://cravatar.eu/helmavatar/AlafTheViking/128">
	                            <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">mode_edit</i></a>
	                        </div>
	                        <div class="card-content">
	                            <h5>AlafTheViking</h5>
	                            <h5 class="green-text">Architekt</h5>
	                        </div>
	                    </div>
	                </div>   
	            </div>  
	          </div>  
	        </div>
	      </div>
	  </div>
	  <%
  }
  %>  

  <div class="parallax-container valign-wrapper">
    <div class="section no-pad-bot">
    </div>
    <div class="parallax"><img src="images/background3.jpg" alt="Unsplashed background img 3"></div>
  </div>    

  <footer class="page-footer grey darken-3">
    <div class="footer-copyright">
      <div class="container">
      &copy; Copyright by <a class="white-text text-lighten-3" href="http://pumpkingames.eu">Pumpkingames.eu</a> | Hosted by <a class="white-text text-lighten-3" href="https://zap-hosting.com">Zap Hosting</a> | Made with <a href="http://materializecss.com/" class="white-text text-lighten-3">Materializecs</a>
      </div>
    </div>
  </footer>


  <!--  Scripts-->
  <script src="js/jquery-latest.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
  
  <script>
  		$(".button-collapse").sideNav();
  		var loadedwaiting = false;
  	  	var firsttry = false;
  	   	function loadwaiting(){
  	       if(!loadedwaiting){
  	    	   if(firsttry){
  	    		   loadedwaiting = true;
  	    		 $('#logoutmodal').modal('open');
  	    	   }else{
  	    		   firsttry = true;
  	    	   }
  	       }
  	   }
  	   setInterval(loadwaiting, 3000);
  </script>

  </body>
</html>