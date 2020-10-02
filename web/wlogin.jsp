<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Pumpkingames | Administration</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="pages/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="pages/css/style.css" type="text/css" rel="stylesheet" media="all"/>
  <link href="pages/css/bubble.css" type="text/css" rel="stylesheet"/>
  
  <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body class="dark">
   <%
   if(session != null){
	 	if(session.getAttribute("logedin") != null){
			if(session.getAttribute("logedin").toString().equals("true")){
				if(session.getAttribute("loaded") != null && session.getAttribute("loaded").toString().equals("true")){
					response.sendRedirect("pages/index.jsp");					
				}else{
					response.sendRedirect("pages/load.jsp");
				}
			}
		}
   }
   %>   
   <div class="row objectcenter">
    <form class="col s6" method="post" action="login"> 
      <div class="row">
        <h3 class="col s6 grey-text darken-3">Anmeldung</h3> 
      </div>      
      <div class="row">  
        <div class="input-field col s6">
          <input id="username" type="text" class="validate" required="" name="username">
          <label for="username">Nutzername</label>
        </div>
      </div>
      <div class="row">
          <div class="input-field col s6">
            <input id="password" type="password" class="validate" required="" name="password">
            <label for="password">Passwort</label>
          </div>
      </div>    
      <div class="row">
        <button class="btn orange waves-effect waves-light col s6" type="submit" name="action" align="center">Anmelden</button>  
      </div>      
    </form>
  </div>    
    
  <script src="pages/js/jquery-latest.js"></script>
  <script src="pages/js/materialize.js"></script>
  <script src="pages/js/init.js"></script>
  
  <script>
   $(".button-collapse").sideNav();      
  </script>

  </body>    
</html>