<%@page import="com.chainsys.chatspring.model.PersonalChat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>sent Messages!</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<p id="demo"></p>
<script>

document.getElementById('demo').innerHTML = Date();
</script>

</head>
<style type="text/css">table {width:100%;}</style>
<link rel="stylesheet" type="text/css" href="/CssFiles/chatOnePage.css">
<link rel="stylesheet" type="text/css" href="/CssFiles/home.css">
<body>
<% String uName=session.getAttribute("userName").toString(); String name=session.getAttribute("name").toString().toUpperCase();  %>

<div>

  <p class="center">Welcome to the world of Words and thoughts : <span class="whi"><strong><em><%=name%> </em></strong> </span> as <%=uName%> </p> 
	</div>


<% 
HttpSession sessionlist=request.getSession();

List<PersonalChat> pd=(List<PersonalChat> )session.getAttribute("sentImageMessage");

 %>


<p class="center">
<button>
Message Sent by <%=name %>
</button>
 </p>


<table class="center">
 <caption>My Messages...</caption>
<thead>

<tr>

<th>Receiver</th>
<th>Message Status</th>
<th>MessageTime</th>
<th>Message-Key</th>
<th>Message</th>
<th>Image</th>
<th>Message Again</th>

</tr>
</thead>

<tbody>
<%for(PersonalChat personalChat : pd) {%></tbody>
<tr>
		<form action="/replyImageController" method="post">


<td><%=personalChat.getReceiver() %><br></td>
<td><%=personalChat.getReqStatus() %><br></td>
<td><%=personalChat.getMessageTime() %></td>
<td><%=personalChat.getMessageId() %></td>
<td><h3><%=personalChat.getMessage() %></h3></td>
<td><img alt="null" src="data:image/jpg;base64,<%=personalChat.getPath()%>"  style="width: 250px; height: 100px;" download /></td>
<td><button type="submit" required="required"
						value="<%=personalChat.getReceiver()%>" name="senderId"
						readonly="readonly"><em class="material-icons">send</em></button> </td>
</tr>
<%} %>


</table>

	<div class="center">
				 <input type="button"  value="Go back!" onclick="history.back()">
			
		</div>
</body>
</html>