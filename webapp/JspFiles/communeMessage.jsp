<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Share to Commune!</title>
<% String uName=session.getAttribute("userName").toString(); String name=session.getAttribute("name").toString().toUpperCase();  %>

<p id="demo"></p>
<script>
document.getElementById('demo').innerHTML = Date();
</script>
<%
String communeId = session.getAttribute("communeId").toString();
%>

<link rel="stylesheet" type="text/css" href="/CssFiles/writeMessage.css">


</head>
<body>
<fieldset><legend class="center">
<div>

  <p class="center">Welcome to the world of Words and thoughts : <strong><em><%=name%> </em></strong> as <%=uName%> </p><label align="left">Happy connecting..... </label><br> <br>
	</div></legend>


<section class="container">
	<form name="sendCommune" method="post" id="sendCommune" action="/sendCommune" enctype="multipart/form-data">

		
		 Sender &nbsp;
		&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input type="text" name="sender"
			placeholder="sender (ex: userName ) "  value="<%=uName%>"size="30px" readonly="readonly"
			required> <br> <br> 
	
			Commune-Key &nbsp; &nbsp; &nbsp;
		&nbsp;&nbsp;:<input type="number" name="communeId" value="<%=communeId %>"
			placeholder="enter Commune-Key to share info" size="30px" required>
	<br> <br>
	
	
			
			
		  Message &nbsp; &nbsp;&nbsp; &nbsp;:<textarea  type="text" name="message" 
			placeholder="Type the message"  placeholder="Type the Message..." required="required"></textarea>
			
						<br> <br>
			
			
		Image File   :	 <input
						type="file" name="image" id="image" required
						accept="image/png, image/gif, image/jpg" required/>

			
			
			 <br>
			
			
			
			 <br>
		<br> <input type="submit" > 
		<input
			type="reset" value="Cancel"><br> <br> <br>
			
			<div class="center">
			
				 <input type="button" value="Go back!" onclick="history.back()">
			
		</div>
</fieldset>
<h4 class="right"><a href="/logout">Logout</a></h4>
			
</body>
</html>