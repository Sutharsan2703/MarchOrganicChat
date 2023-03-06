<%@page import="com.chainsys.chatspring.model.Commune"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Receive messages from Commune</title>


<p id="demo"></p>
<script>
	document.getElementById('demo').innerHTML = Date();
</script>

</head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" type="text/css" href="/CssFiles/chatOnePage.css">
<link rel="stylesheet" type="text/css" href="/CssFiles/home.css">
<body>
	<%
	String uName = session.getAttribute("userName").toString();
	String name = session.getAttribute("name").toString().toUpperCase();
	%>

	<div>

		<p class="center">
			Welcome to the world of Words and thoughts :<span class="whi">
				<strong><em><%=name%> </em></strong>
			</span> as
			<%=uName%>
		</p>
	</div>


	<%
	HttpSession sessionlist = request.getSession();

	List<Commune> comm = (List<Commune>) sessionlist.getAttribute("receivedCommune");
	%>

	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<span class="drac">
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Happy connecting..... </span>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class="drac">
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
</span>
<span class="drac">
	<p class="example_c">
		<a href="/membersList">Commune Members...!</a>
	</p></span>
	<p class="example_e">
		<a href="/JspFiles/communeMessage.jsp">Commune Message..!</a>
	</p>
	<p class="example_d">
	<input type="button" value="Go back!" onclick="history.back()">
</p>

	<table class="center1">
		<caption>Messages from the Commune!</caption>
		<thead>
			<tr>
				<th>Sender</th>
				<th>Message</th>
				<th>Docs</th>
				<th>MessageTime</th>
				<th>Commune-Key</th>
				<th>Views</th>
				<th>ViewedBy</th>

			</tr>
		</thead>
		<form action="/replyCommuneController" method="post">
			<tbody>
				<%
				for (Commune commune : comm) {
				%>
			</tbody>
			<tr>

				<td><%=commune.getSender()%> <br></td>

				<td><%=commune.getMessage()%></td>
				<td><img alt="null" src="data:image/jpg;base64,<%=commune.getPath()%>"  style="width: 250px; height: 100px;" download /></td>
					
				<td><%=commune.getMessageTime()%></td>
				<td><%=commune.getCommuneId()%></td>
				<td><%=commune.getViews()%></td>
				<td><%=commune.getViewedBy()%></td>


				<td><button type="submit" required="required"
						value="<%=commune.getCommuneId()%>" name="communeId"
						readonly="readonly"><%=commune.getSender()%>
						<em class="material-icons">reply</em>
					</button></td>

			</tr>
			<%
			}
			%>

		</form>
	</table>
<br><br>
	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	
	<p class="example_report">
		<a class="c3" href="/JspFiles/createReport.jsp">create report</a>
	</p>

</body>
</html>