<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Pumpkingames | Administration</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/chatstyle.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>
	<div id="hangout">  
		  <div id="head" class="style-bg"> <i class="mdi mdi-arrow-left"></i> <i class="mdi mdi-fullscreen-exit"></i> <i class="mdi mdi-menu"></i> 
		    <h1>John Doe</h1><i class="mdi mdi-chevron-down"></i></div>  
		  <div id="content">
		    <div class="overlay"></div>
		    
		    <div id="floater-position">
		      <div id="add-contact-floater" class="floater control style-bg hidden"><i class="mdi mdi-plus"></i></div>          
		      <div id="chat-floater" class="floater control style-bg hidden"><i class="mdi mdi-comment-text-outline"></i></div>   
		    </div>
		    
		    
		    <div class="card menu">
		      <div class="header">
		      <img src="https://s8.postimg.org/76bg2es2t/index.png" />
		        <h3></h3>
		      </div>
		      <div class="content">
		        
		        <div class="i-group">
		    <input type="text" id="username"><span class="bar"></span>
		    <label>Name</label>
		        </div>        
		        <br />
		        <div class="center"><canvas id="colorpick" width="250" height="220" ></canvas></div>                        
		      </div>
		    </div> 
		    <div class="list-account">
		      <div class="meta-bar"><input class="nostyle search-filter" type="text" placeholder="Search" /></div>
		    <ul class="list mat-ripple">      
		      <li><img src="http://lorempixel.com/100/100/people/1/"><span class="name">Angie</span><i class="mdi mdi-menu-down"></i> </li>
		      <li><img src="http://lorempixel.com/100/100/people/6/"><span class="name">Larissa</span><i class="mdi mdi-menu-down"></i></li>
		      <li><img src="http://lorempixel.com/100/100/people"><span class="name">Hank</span><i class="mdi mdi-menu-down"></i></li>    
		      <li><img src="http://lorempixel.com/100/100/people/"><span class="name">Peter</span><i class="mdi mdi-menu-down"></i></li> 
		      <li><img src="http://lorempixel.com/100/100/people/"><span class="name">Oliver</span><i class="mdi mdi-menu-down"></i></li> 
		      <li><img src="http://lorempixel.com/100/100/people/"><span class="name">Chris</span><i class="mdi mdi-menu-down"></i></li> 
		      <li><img src="http://lorempixel.com/100/100/people/"><span class="name">Vanessa</span><i class="mdi mdi-menu-down"></i></li> 
		      <li><img src="http://lorempixel.com/100/100/people/"><span class="name">Leo</span><i class="mdi mdi-menu-down"></i></li> 
		      <li><img src="http://lorempixel.com/100/100/people/"><span class="name">Ash</span><i class="mdi mdi-menu-down"></i></li> 
		      <li><img src="http://lorempixel.com/100/100/people/"><span class="name">Doozer</span><i class="mdi mdi-menu-down"></i></li> 
		      <li><img src="http://lorempixel.com/100/100/people/"><span class="name">Munk</span><i class="mdi mdi-menu-down"></i></li> 
		    </ul> 
		    </div>
		    <div class="list-text">
		    <ul class="list mat-ripple">      
		      <li><img src="http://lorempixel.com/100/100/people/1/">
		        <div class="content-container">
		          <span class="name">Angie</span>
		          <span class="txt">i get the other involved a bit </span>
		        </div>
		        <span class="time">
		          14:00
		        </span>
		         </li>    
		      
		      <li><img src="http://lorempixel.com/100/100/people/4/">
		        <div class="content-container">
		          <span class="name">Larissa</span>
		          <span class="txt">Hi! how are you :] </span>
		        </div>
		        <span class="time">
		          16:02
		        </span>
		         </li>  
		      
		      <li><img src="http://lorempixel.com/100/100/people/">
		        <div class="content-container">
		          <span class="name">Peter</span>
		          <span class="txt">Want to go drink a beer after work ?</span>
		        </div>
		        <span class="time">
		          16:03
		        </span>
		         </li>  
		    </ul> 
		    </div>
		    <div class="list-phone">
		      <div class="meta-bar"><input class="nostyle search-filter" type="text" placeholder="Name, phone number" /></div>
		    <ul class="list mat-ripple">      
		      <li><img src="http://lorempixel.com/100/100/people/1/">
		        <div class="content-container">
		          <span class="name">Angie</span>
		          <span class="phone">000-555-28175</span>
		          <span class="meta">Mobile</span>
		        </div>
		        <span class="time">
		          2015-01-01 03:35
		        </span>
		         </li>      
		      <li><img src="http://lorempixel.com/100/100/people/3/">
		        <div class="content-container">
		          <span class="name">Bert</span>
		          <span class="phone">666-222-11433</span>
		          <span class="meta">Main</span>
		        </div>
		        <span class="time">
		          2015-01-01 03:35
		        </span>
		         </li>   
		    </ul> 
		    </div>
		    <div class="list-chat">
		      <ul class="chat">
		        <li>
		        <img src="https://s8.postimg.org/76bg2es2t/index.png">
		          <div class="message">o hai!</div>
		        </li>
		        <li>
		        <img src="http://lorempixel.com/100/100/people/1/">
		          <div class="message"></div>
		        </li>
		        <li>
		        <img src="https://s8.postimg.org/76bg2es2t/index.png">
		          <div class="message current">...</div>
		        </li>
		      </ul>
		      <div class="meta-bar chat"><input class="nostyle chat-input" type="text" placeholder="Message..." /> <i class="mdi mdi-send"></i></div>
		    </div>
		    <ul class="nav control mat-ripple tiny">
		      
		      <li data-route=".list-account"><i class="mdi mdi-account-multiple"></i></li><li data-route=".list-text"><i class="mdi mdi-comment-text"></i></li><li data-route=".list-phone"><i class="mdi mdi-phone"></i></li></ul>
		    </div>  
		  
		  <div id="contact-modal" data-mode="add" class="card dialog">
		    <h3>Add Contact</h3>
		      <div class="i-group">
		      <input type="text" id="new-user"><span class="bar"></span>
		      <label>Name</label>
		      </div>
		    
		    <div class="btn-container">
		      <span class="btn cancel">Cancel</span>
		      <span class="btn save">Save</span>      
		    </div>
		    
		</div>
	</div>
	<script src="js/jquery-latest.js"></script>
  	<script src="js/materialize.js"></script>
  	<script src="js/livechat.js"></script>    
</body>
</html>