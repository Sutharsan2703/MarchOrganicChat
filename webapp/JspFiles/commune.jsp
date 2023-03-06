<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Commune Home!</title>

<link rel="stylesheet" type="text/css" href="/CssFiles/joinCommune.css">
</head>
	

<body>
<% String uName=session.getAttribute("userName").toString(); String name=session.getAttribute("name").toString().toUpperCase();  %>

<div class="container2">
<fieldset><legend >

 <h1><strong><em>Create Commune ! </em></strong></h1> <label >Create your own Commune to spread informations faster! </label><br> <br>

</legend>
<div class="container1">

<form action="/createCommune" method="post">


<br><label> Happy connecting.....			
   </label>
			

<p>Name of your Commune<p>			
 <input type="text" name="communeName" placeholder="Commune Name" required="required" size="30px">
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
<br>	
<p>Password<p>			
<input type="password" name="password" placeholder="Only numbers atleast of 4 digits!" required="required" size="30px">
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
<br>	
<p>UserName<p>			
<input type="text" name="members" value="<%=uName %>" required="required" size="30px">
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 


<br><br>			
<input type="submit">
<input type="reset" value="cancel">
<br>
<br>

</form>
</div>
				 <input type="button" value="Go back!" onclick="history.back()">
</fieldset></div>
</body>
</html>