<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Reply to text on Commune</title>
<%
String uName = session.getAttribute("userName").toString();
String name = session.getAttribute("name").toString().toUpperCase();
%>
<%

String communeId = session.getAttribute("communeId").toString();
%>


<link rel="stylesheet" type="text/css" href="/CssFiles/backColor.css">

<p id="demo"></p>
<script>
document.getElementById('demo').innerHTML = Date();
</script>

</head>
	<body>
<fieldset>
	<legend class="center">

		<div>
			<p class="center">
				Welcome to the world of Words and thoughts : <span class="whi">
					<strong><em><%=name%> </em></strong> 
				</span> as
				<%=uName%>
			</p>
			<label align="left">Happy connecting..... </label><br> <br>
		</div>
	</legend>

	

	<section class="container">
	<form name="textCommune" method="post" id="textCommune" action="/textReceiveCommune" >

		
		 Sender &nbsp;
		&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input type="text" name="sender"
			placeholder="sender (ex: userName ) "  value="<%=uName%>"size="30px" readonly="readonly"
			required> <br> <br> 
	<span class="drac">
			Commune-Key &nbsp; &nbsp; &nbsp;
		&nbsp;&nbsp;:<input type="number" name="communeId" value="<%=communeId %>"
			placeholder="enter Commune-Key to share info" size="30px" required>
	<br> <br></span>
	
	
			
			
		  Message &nbsp; &nbsp;&nbsp; &nbsp;:<textarea  type="text" name="message" 
			placeholder="Type the message"  placeholder="Type the Message..." required="required"></textarea>
			
						<br> <br>
	
			
			 <br><span class="drac">
		<br> <input type="submit" > </span>
		<input
			type="reset" value="Cancel"><br> <br> <br>
			
			<div class="center">
			
				 <input type="button" value="Go back!" onclick="history.back()">
			
		</div>
</fieldset><span class="drac">
<h4 class="right"><a href="/logout">Logout</a></h4>
		</span>	
</body>
</html>
