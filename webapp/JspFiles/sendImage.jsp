<%@page import="com.chainsys.chatspring.model.Register"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Create Message!</title>
<%
String uName = session.getAttribute("userName").toString();
String name = session.getAttribute("name").toString().toUpperCase();
%>
<link rel="stylesheet" type="text/css" href="/CssFiles/writeMessage.css">

<p id="demo"></p>

<%
List<Register> usList = (List<Register>) session.getAttribute("userList");
%>

<script>
	document.getElementById('demo').innerHTML = Date();
</script>




</head>


<body>

	<fieldset>
		<legend class="center">

			<p class="center">
				Welcome to the world of Words and thoughts : <strong><em><%=name%>
				</em></strong> as
				<%=uName%>
			</p>
			<label class="left">Happy connecting..... </label><br> <br>
		</legend>
<span class="drac">
		Sender &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input type="text"
			value="<%=name%>" size="30px" readonly="readonly" required></span> <br>
		<br>

		<div class="container1">

			<form name="sendImage" method="post" id="sendImage"
				action="/sendImage" enctype="multipart/form-data">
				<br> <br><span class="drac">
				 &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;</span>
				 Sender &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input
					type="text" name="sender" placeholder="sender (ex: userName ) "
					value="<%=uName%>" size="30px" readonly="readonly" required>
				<br>
				<br> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
				<span class="drac"> <label	for="Receiver">Receiver:</label> &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; <select
					id="receiver" name="receiver">


					<%
					for (Register register : usList) {
					%>
					<option value="<%=register.getUserName()%>"><%=register.getMailId()%></option>
					<%
					}
					%>
				</select> </span><br> <br> Message &nbsp; &nbsp;&nbsp; &nbsp;:
				<textarea type="text" name="message" placeholder="Type the message"
					placeholder="Type the Message..." required="required"></textarea>
				<br> <br> &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;
				<span class="drac">
				 Image File : <input type="file" class="form-control"
					id="image" name="image"
					accept="image/jpeg, image/jpg, image/gif, image/png, application/pdf"
					multiple="multiple" value="" required/> <br></span> <br> &nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
				&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <input
					type="submit"> <input type="reset" value="Cancel"><br>
				<br> <br>
		</div>
	</fieldset><span class="drac">
	<h4 class="right">
		<a href="/logout">Logout</a>
	</h4>
	<div class="center">

		<input type="button" value="Go back!" onclick="history.back()">
	</div></span>

</body>
</html>