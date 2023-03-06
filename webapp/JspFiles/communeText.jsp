<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Share text to Commune!</title>
<% String uName=session.getAttribute("userName").toString(); String name=session.getAttribute("name").toString().toUpperCase();  %>
<link rel="stylesheet" type="text/css" href="/CssFiles/writeMessage.css">

<p id="demo"></p>
<script>
document.getElementById('demo').innerHTML = Date();
</script>
<%
String communeId = session.getAttribute("communeId").toString();
%>



</head>
<fieldset><legend class="center">


  <p class="center">Welcome to the world of Words and thoughts : <strong><em><%=name%> </em></strong> as <%=uName%> </p><label class="left">Happy connecting..... </label><br> <br>
	</legend>

<body>
<style type="text/css">



textarea {
  width: 100%;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
}
</style>
<section class="container">
	<form name="textCommune" method="post" id="textCommune" action="/textCommune" >

		
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