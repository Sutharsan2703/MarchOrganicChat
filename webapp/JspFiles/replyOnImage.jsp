<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Create Message!</title>
<link rel="stylesheet" type="text/css" href="/CssFiles/writeMessage.css">

<%
String uName = session.getAttribute("userName").toString();
String name = session.getAttribute("name").toString().toUpperCase();
%>
<%
String receiver = session.getAttribute("senderId").toString();
%>
<link rel="stylesheet" type="text/css" href="/CssFiles/writeMessage.css">

<p id="demo"></p>
<script>
document.getElementById('demo').innerHTML = Date();
</script>




</head>


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
<fieldset><legend class="center">

  <p class="center"><span class="drac">Welcome to the world of Words and thoughts : <strong><em><%=name%> </em></strong>  as <%=uName%> </span></p><label class="left">Happy connecting..... </label><br> <br>
	</legend>
	
	 Sender &nbsp;
		&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input type="text" 
			 value="<%=name%>"size="30px" readonly="readonly"
			required> <br><br>
	
<div class="container1">
<span class="drac">
	<form name="sendImage" method="post" id="sendImage" action="/sendImage" enctype="multipart/form-data">
<br></span>
<br>
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
		
		 Sender &nbsp;
		&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input type="text" name="sender"
			placeholder="sender (ex: userName ) "  value="<%=uName%>"size="30px" readonly="readonly"
			required> <br><br>
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
		<span class="drac">
		Receiver &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;:<input type="text" name="receiver" value="<%=receiver%>"
			placeholder="receiver (ex: userName )" size="30px" required>
	<br></span>
	<br>
		&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
				

			
			
	<span class="drac">	  Message &nbsp; &nbsp;&nbsp; &nbsp;:</span>
		  <textarea  type="text" name="message" 
			placeholder="Type the message"  placeholder="Type the Message..." required="required"></textarea>
			<br> <br>
			
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
		<span class="drac">	
		Image File   :	 <input type="file" class="form-control" id="files" name="image" accept="image/jpeg, image/jpg, image/gif, image/png, application/pdf" multiple="multiple" value="" required/>
			
			
			 <br></span>
		<br>	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
		 <input type="submit" > 
		<input
			type="reset" value="Cancel"><br> <br> <br>
			
			
</fieldset>
<h4 class="right"><a href="/logout">Logout</a></h4>
					</div>	
		<div class="center">
			
				 <input type="button" value="Go back!" onclick="history.back()">
			
		</div>
</body>
</html>