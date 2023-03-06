<%@page import="com.chainsys.chatspring.model.Commune"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css" href="/CssFiles/communeList.css">


<title>List Of Communes</title>
<%
String uName = session.getAttribute("userName").toString();
String name = session.getAttribute("name").toString().toUpperCase();
%>
</head>

<div>
	<button class="openbtn" onclick="commune()">&#9776; Profile</button>

	<div class="part2">
		<p class="center">
			Welcome to the world of Words and thoughts :<span class="whi">
				<strong><em><%=name%> </em></strong>
			</span> as
			<%=uName%><br> <label>Happy connecting..... </label><br> <br>
		</p>
	</div>
</div>


<%
HttpSession sessionlist = request.getSession();

List<Commune> commList = (List<Commune>) sessionlist.getAttribute("listCommune");
%>



<style type="text/css">
table {
	width: 80%
}
</style>

<div class="section-1">
	<div class="whole">
		<div class="part">

			<nav id="nav">
				<div id="mySidepanel" class="sidepanel">
					<a href="javascript:void(0)" class="closebtn1" onclick="commune()">&nbsp;
						&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
						&times;</a>
					<h3>My Profile</h3>
					<br>
					<h5>Name</h5>
					<a href="#"><%=name%></a>
					<h5>UserName</h5>
					<a href="#"><%=uName%></a>
					<h5>Commune</h5>
					<a href="/JspFiles/commune.jsp">Create New </a> <a
						href="/JspFiles/joinCommune.jsp">Join Commune</a>
					<h5>Report !</h5>
					<a href="/JspFiles/createReport.jsp">create report</a>
					<h5>Logout ?</h5>
					<a href="/logout">LogOut..</a>


				</div>
			</nav>

		</div>



	</div>
	<div class="commune-table">

		<table class="center">
			<caption>Your Commune! ...</caption>
			<thead>
				<tr>

					<th>communeName</th>
					<th>Commune-Key</th>
					<th>check Messages</th>
					<th>Text messages</th>


				</tr>
			</thead>
			<tbody>
				<%
				for (Commune commune : commList) {
				%>
			</tbody>
			<tr>


				<td><%=commune.getCommuneName()%></td>
				<td><%=commune.getCommuneId()%></td>


				<form action="/receiveCommune" method="post">

					<td><button type="submit" required="required"
							value="<%=commune.getCommuneId()%>" name="communeId"
							readonly="readonly"><%=commune.getCommuneId()%>
							<em class="material-icons">view</em>
						</button></td>
				</form>
				<form action="/textReceiveCommune" method="post">
					<td><button type="submit" required="required"
							value="<%=commune.getCommuneId()%>" name="communeId"
							readonly="readonly"><%=commune.getCommuneId()%>
							<em class="material-icons">view</em>
						</button></td>
				</form>

			</tr>
			<%
			}
			%>

		</table>
		<div class="center">

			<input type="button" value="Go back!" onclick="history.back()">

		</div>



	</div>



</div>




<script>
	function commune() {
		var profile = document.getElementById("nav");
		if (profile.style.display === "none") {
			document.getElementById("mySidepanel").style.width = "190px";
			profile.style.display = "block";
		} else {
			document.getElementById("mySidepanel").style.width = "0";

			profile.style.display = "none";
		}
	}
</script>
</body>
</html>