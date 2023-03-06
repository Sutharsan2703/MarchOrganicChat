<%@page import="com.chainsys.chatspring.model.PersonalChat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Analyze Messages!</title>


<p id="demo"></p>
<script>
	document.getElementById('demo').innerHTML = Date();
</script>

</head>

<link rel="stylesheet" type="text/css" href="/CssFiles/home.css">
<style type="text/css">
body{background-color: gray;}</style>
<body >
	<%
	String uName = session.getAttribute("userName").toString();
	String name = session.getAttribute("name").toString().toUpperCase();
	%>

	<div>

		<p class="center">
			Welcome to the world of Words and thoughts : <span class="whi"><strong><em><%=name%>
				</em></strong></span> as
			<%=uName%>
		</p>
	</div>


	<%
	HttpSession sessionlist = request.getSession();

	List<PersonalChat> pd = (List<PersonalChat>) session.getAttribute("allMessage");
	%>




	<table class="center1" >
	 <caption>All messages of Suspect </caption>
		<thead>
			<tr>

				<th>Sender</th>
				<th>Receiver</th>
				<th>Message Status</th>
				<th>MessageTime</th>
				<th>Message-Key</th>
				<th>Message</th>
				<th>Image !</th>
				<th>Message...</th>

			</tr>
		</thead>

		<tbody>
			<%
			for (PersonalChat personalChat : pd) {
			%>
		</tbody>
		<tr>


			<td><%=personalChat.getSender()%><br></td>
			<td><%=personalChat.getReceiver()%><br></td>
			<td><%=personalChat.getReqStatus()%><br></td>
			<td><%=personalChat.getMessageTime()%></td>
			<td><%=personalChat.getMessageId()%></td>
			<td><%=personalChat.getMessage()%></td>
			<td><%=personalChat.getImage()%></td>
			<td><a href="/JspFiles/sendMessage.jsp">reply...</a></td>
		</tr>
		<%
		}
		%>


	</table>

	<div class="center">

		<input type="button" value="Go back!" onclick="history.back()">

	</div>
</body>
</html>