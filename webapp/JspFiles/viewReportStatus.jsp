<%@page import="com.chainsys.chatspring.model.Report"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Report Status?</title>


<p id="demo"></p>
<script>
	document.getElementById('demo').innerHTML = Date();
</script>

</head>

<style type="text/css">table{width:100%;}</style>

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
		<label class="left">check for reports.... </label><br> <br>
	</div>


	<%
	HttpSession sessionlist = request.getSession();

	List<Report> rp = (List<Report>) sessionlist.getAttribute("viewReport");
	%>






	<table class="center">
	<caption>Report Status...</caption>
		<thead>
		
			<tr>
				<th>Report-Key</th>
				<th>ReportDate</th>
				<th>Suspect UserName</th>
				<th>ReportContent</th>
				<th>UserName</th>
				<th>Message-Key</th>
				<th>ReportStatus</th>


			</tr>
		</thead>
		<tbody>
			<%
			for (Report report : rp) {
			%>
		</tbody>
		<tr>

			<td><%=report.getReportId()%></td>
			<td><%=report.getReportDate()%></td>
			<td><%=report.getReportUserName()%></td>
			<td><%=report.getReportContent()%></td>
			<td><%=report.getUserName()%></td>
			<td><%=report.getMessageId()%></td>
			<td><%=report.getReportStatus()%></td>


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