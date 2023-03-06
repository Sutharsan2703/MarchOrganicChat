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

	List<Commune> comm = (List<Commune>) sessionlist.getAttribute("textCommune");
	%>

	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Happy connecting..... &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

		<p class="example_c">
		<a href="/membersList">Commune Members...!</a>
	</p>
	<p class="example_c">
		<a href="/JspFiles/communeText.jsp">Commune Message..!</a>
	</p>
	<p class="example_e">
	<input type="button" value="Go back!" onclick="history.back()">
</p>
<style type="text/css">table{width: 100%}</style>

	<table class="center">
		<caption>Messages from the Commune!</caption>
		<thead>
			<tr>
				<th>Sender</th>
				<th>Message</th>
				<th>MessageTime</th>
				<th>Commune-Key</th>
				<th>Views</th>
				

			</tr>
		</thead>
		<form action="/commTextController" method="post">
			<tbody>
				<%
				for (Commune commune : comm) {
				%>
			</tbody>
			<tr>

				<td><%=commune.getSender()%> <br></td>

				<td><%=commune.getMessage()%></td>
					
				<td><%=commune.getMessageTime()%></td>
				<td><%=commune.getCommuneId()%></td>
				<td><%=commune.getViews()%></td>


				<td><span class="drac"><button type="submit" required="required"
						value="<%=commune.getCommuneId()%>" name="communeId"
						readonly="readonly"><%=commune.getSender()%>
						<em class="material-icons">reply</em>
					</button></span></td>

			</tr>
			<%
			}
			%>

		</form>
	</table>
<br><br>
	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	<span class="drac">
	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span>
	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
	&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	
	<p class="example_report">
	<span class="drac">	<a class="c3" href="/JspFiles/createReport.jsp">create report</a>
	</span></p>

</body>
</html>