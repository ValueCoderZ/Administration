<%@page import="com.sun.org.apache.xpath.internal.operations.Bool"%>
<%@page import="javax.management.Query"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.io.IOException"%>
<%@page import="LoadUtils.Load"%>
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
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body class="dark">

  <div class="row col s12 loading" align="center">
      <div class="preloader-wrapper big active">
      <div class="spinner-layer spinner-blue">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-red">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-yellow">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>

      <div class="spinner-layer spinner-green">
        <div class="circle-clipper left">
          <div class="circle"></div>
        </div><div class="gap-patch">
          <div class="circle"></div>
        </div><div class="circle-clipper right">
          <div class="circle"></div>
        </div>
      </div>      
    </div>
  </div>
  <br>
  <div class="row col s8 " align="center">
  		<h4 class="grey-text darken-3" align="center">Bitte habe einen Moment Geduld.</h4>
  </div>          
    
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
    		   var xmlhttp = new XMLHttpRequest();
        	   loadedwaiting = true;
               window.open("index.jsp","_self")
    	   }else{
    		   firsttry = true;
    	   }
       }
   }
   setInterval(loadwaiting, 3000);
  </script>

  </body>
  <%
   if(session != null){
	 	if(session.getAttribute("logedin") != null){
			if(session.getAttribute("logedin").toString().equals("true")){
				if(session.getAttribute("loaded") != null && session.getAttribute("loaded").toString().equals("true")){
					response.sendRedirect("index.jsp");					
				}else if(session.getAttribute("loaded") == null){
					session.setAttribute("loaded", false);
					new Load(request, response);
				}else if(session.getAttribute("loaded") != null && !session.getAttribute("loaded").toString().equals("true")){
					new Load(request, response);
				}
			}else{
				response.sendRedirect("login.jsp");
			}
		}else{
			response.sendRedirect("login.jsp");
		}
   }
   %>     
</html>