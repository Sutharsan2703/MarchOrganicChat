<%@page import="com.chainsys.chatspring.model.Report"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>check for Reports!</title>


<p id="demo"></p>
<script>
	document.getElementById('demo').innerHTML = Date();
</script>

</head>
<link rel="stylesheet" type="text/css" href="/CssFiles/pages.css">
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

	List<Report> rp = (List<Report>) sessionlist.getAttribute("checkReport");
	%>

<style type="text/css">table{width: 100%}</style>



	<table class="center" >
	 <caption>Checking Reports </caption>
		<thead>
		<form action="/warnUser" method="post" >
		
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
			<td><button type="submit" required="required"
						value="<%=report.getMessageId()%>" name="messageId"
						readonly="readonly"><%=report.getMessageId()%></button></td>
			<td><%=report.getReportStatus()%></td>


		</tr>
		<%
		}
		%>

	</table>

	</form>
	<div class="center">

		<input type="button" value="Go back!" onclick="history.back()">
		
	
		

		<section class="cards">

			<div class="card c2">
				<div class="card-text">
					<h3>Analyze On Report</h3>
					<p class="card-pragraph">
					<form action="/analyzeReport" method="post" >
						Report  On<input type="text" name="sender" id="sender" size="30px"
							placeholder="UserName of Suspect (ex:abcd1234)" required="required"> 
							<br><input type="submit"/><br>
						<input type="reset" value="Cancel">
						</form>

						</p>
				</div></div>
			<div class="card c3">
				<div class="card-text">
					<h3>Final Decision</h3>
					<p class="card-pragraph">
					<form action=/reportDec method="post" >
						Message-Key<br><input type="number" name="messageId" id="messageId" size="50px"
							placeholder="Message-Key , which decision was made" required="required"> <br>
						Report  On<br><input type="text" name="reportUserName" id="reportUsername" size="30px"
							placeholder="UserName of Suspect (ex:abcd1234)" required="required"> <br>
						Status  as<br><input type="text" name="reportStatus" id="reportStatus" size="30px"
							placeholder="less than 25 chars" required="required"> 
							<br><br>
						<input type="submit"/><br>
						<input type="reset" value="Cancel">
						</form>

						</p>
				</div>

			</div>
			</section>
</body>
</html>