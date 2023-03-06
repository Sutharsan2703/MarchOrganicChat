<%@page import="com.chainsys.chatspring.model.Register"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Create Message!</title><% String uName=session.getAttribute("userName").toString(); String name=session.getAttribute("name").toString().toUpperCase();  %>
<link rel="stylesheet" type="text/css" href="/CssFiles/writeMessage.css">

<p id="demo"></p>
<script>
document.getElementById('demo').innerHTML = Date();
</script>
<% 
List<Register> uList=(List<Register> )session.getAttribute("userList");
 %>



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

  <p class="center">Welcome to the world of Words and thoughts : <strong><em><%=name%> </em></strong>  as <%=uName%> </p><label class="left">Happy connecting..... </label><br> <br>
	</legend>
	
	 Sender &nbsp;
		&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input type="text" 
			 value="<%=name%>"size="30px" readonly="readonly"
			required> <br><br>
	
<div class="container1">

	<form name="send" method="post" id="send" action="/send">
<br>
<br>
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
		
		 Sender &nbsp;
		&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input type="text" name="sender"
			placeholder="sender (ex: userName ) "  value="<%=uName%>"size="30px" readonly="readonly"
			required> <br><br>
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
		
		


<label for="Receiver">Receiver:</label>
&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;

<select id="receiver" name="receiver">
  
  
 <%for(Register register : uList) {%>  <option  value="<%=register.getUserName() %>"><%=register.getMailId()%></option>
  <%} %>	
</select>

		<br>
	<br>
			
		  Message :
		  <textarea  type="text" name="message" 
			placeholder="Type the message"  placeholder="Type the Message..." required="required"></textarea>
			<br> <br>
			
		
			
			 <br>
		<br>	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
			&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
		 <input type="submit" > 
		<input
			type="reset" value="Cancel"><br> <br> <br>
			
			
					</div>	
</fieldset>
<h4 class="right"><a href="/logout">Logout</a></h4>
		<div class="center">
			
				 <input type="button" value="Go back!" onclick="history.back()">
			
		</div>
</body>
</html>