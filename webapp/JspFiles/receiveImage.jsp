<%@page import="com.chainsys.chatspring.model.PersonalChat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Received Messages!</title>


<p id="demo"></p>
<script>
	document.getElementById('demo').innerHTML = Date();
</script>

</head>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" type="text/css" href="/CssFiles/chatOnePage.css">
<link rel="stylesheet" type="text/css" href="/CssFiles/home.css">

<%
HttpSession sessionlist = request.getSession();

List<PersonalChat> userList = (List<PersonalChat>) sessionlist.getAttribute("userMessaged");
List<PersonalChat> userImage = (List<PersonalChat>) sessionlist.getAttribute("userImageMessaged");
%>

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
		<label align="left">Happy connecting..... </label><br> <br>
	</div>
	
	<button class="center">
			<form action="/searchByImageMessage" method="post" >
				 <input type="text" list="messages" name="message" id="message" placeholder="search...any ?">
			<datalist id="messages"><%
					for (PersonalChat personal : userImage) {
					%>
					
					<option value="<%=personal.getMessage()%>">
					</option>
					<%
					}
					%></datalist>
			<input type="submit">
</form>
		</button>
	
<button class="openbtn" >
<form action="/searchImageBySender" method="post" >
				Frequently Contacted: <select id="sender" name="sender">


					<%
					for (PersonalChat personal : userList) {
					%>
					
					<option value="<%=personal.getSender()%>"><button><%=personal.getSender()%></button>
					</option>
					<%
					}
					%>
					
					<%
					for (PersonalChat personal1 : userImage) {
					%>
					<option value="<%=personal1.getSender()%>"><button><%=personal1.getSender()%></button>
					</option>
					<%
					}
					%>
					
				</select>
			</h5>Text:
			<input type="submit">
</form>
</button>




	<%
//	HttpSession sessionlist = request.getSession();

	List<PersonalChat> pd = (List<PersonalChat>) sessionlist.getAttribute("receivedImage");
	%>






	<table class="center1">
	 <caption>Checking for Messages</caption>
		<thead>
			<tr>
				<th>Sender</th>
				<th>MessageTime</th>
				<th>ReqStatus</th>
				<th>Message</th>
				<th>Image !</th>
				<th>Message-Key</th>
				<th>Reply...</th>

			</tr>
		</thead>
		<form action="/replyImageController" method="post">
			<tbody>
				<%
				//Iterator itr=pd.iterator();

				//Object personalChat = itr.next();

				for (PersonalChat personalChat : pd) {
				%>
			</tbody>
			<tr>

				<td><%=personalChat.getSender()%> <br></td>

				<td><%=personalChat.getMessageTime()%></td>
				<td><%=personalChat.getReqStatus()%></td>
				<td><%=personalChat.getMessage()%></td>
				<td><img alt="null" src="data:image/jpg;base64,<%=personalChat.getPath()%>"  style="width: 250px; height: 100px;" download /></td>
				<td><%=personalChat.getMessageId()%></td>
				<td><button type="submit" required="required"
						value="<%=personalChat.getSender()%>" name="senderId"
						readonly="readonly"><%=personalChat.getSender()%> <em class="material-icons">reply</em> </button></td>

			</tr>
			<%
			}
			%>
		
	</form>
	</table>
	<div class="center">

		<input type="button" value="Go back!" onclick="history.back()">

		<!-- Cards -->
		<section class="cards">
			<!-- card-1 -->
			<div class="card c2">
				<div class="card-text">
					<h3>Report</h3>
					<p class="card-pragraph">
						<button>
							<a class="example_e" href="/JspFiles/createReport.jsp">create
								report</a>
						</button>
					</p>
				</div>
			<div class="card c3">
				<div class="card-text">
					<h3>Report</h3>
					<p class="card-pragraph">
						<button>
							<a class="example_c" href="/viewReportStatus">View
								report</a>
						</button>
					</p>
				</div>
		</section>

	</div>


</body>
</html>