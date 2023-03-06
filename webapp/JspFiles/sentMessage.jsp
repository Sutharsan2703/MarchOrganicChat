<%@page import="java.util.List"%>
<%@page import="com.chainsys.chatspring.model.PersonalChat"%>
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

<link rel="stylesheet" type="text/css" href="/CssFiles/chatOnePage.css">
<link rel="stylesheet" type="text/css" href="/CssFiles/home.css">
<body>
<% String uName=session.getAttribute("userName").toString(); String name=session.getAttribute("name").toString().toUpperCase();  %>

<div>

  <p class="center">Welcome to the world of Words and thoughts : <span class="whi"><strong><em><%=name%> </em></strong> </span> as <%=uName%> </p> 
	</div>


<% 
HttpSession sessionlist=request.getSession();

List<PersonalChat> pd=(List<PersonalChat> )session.getAttribute("sentMessage");

 %>


<p class="center" >
<button>
Message Sent by <%=name %>
</button>
 </p>
<style type="text/css">table{width:100%;text-align: center;}</style>

<table class="center">
 <caption>My Messages...</caption>
<thead>

<tr>

<th>Receiver</th>
<th>Message Status</th>
<th>MessageTime</th>
<th>Message-Key</th>
<th>Message</th>
<th>Message Again</th>

</tr>
</thead>

<tbody>
<%for(PersonalChat personalChat : pd) {%></tbody>
<tr>
		<form action="/replyController" method="post">


<td><%=personalChat.getReceiver() %><br></td>
<td><%=personalChat.getReqStatus() %><br></td>
<td><%=personalChat.getMessageTime() %></td>
<td><%=personalChat.getMessageId() %></td>
<td><h3><%=personalChat.getMessage() %></h3></td>
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