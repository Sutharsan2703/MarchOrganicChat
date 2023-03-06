<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Password Reset!</title>
<%
String mail = session.getAttribute("mail").toString();
%>
</head>


<body class="center">
	<link rel="stylesheet" type="text/css" href="/CssFiles/container.css">
	<div class="colo1">
			<span id="demo"></span> <span><div class="right">
					<a href="/logout">Logout</a>
				</div></span>
		</div>

<div class="container2">


	<form class="center" name="log" method="post" action="/resetPassword"
		required>
		
		 <br> <br> Reset Password!<br> <br>
		
		
		MailId &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;:<input
				type="email" name="mailId" id="mailId" value="<%=mail %>"
				readonly="readonly" placeholder="MailId (ex: name@chainsys.com )"
				size="30px" required> <br> <br> Password &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		&nbsp;&nbsp; &nbsp; :<input type="password" name="password"
			id="password" placeholder="In number atleast 6 digits as (000000)"
			size="30px" required> <br> <br> Confirm
		Password&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;:<input
			type="password" name="confirm" id="confirm"
			placeholder="must be same as Password " size="30px" required>
		<br> <br> <input type="submit"> <input type="reset"
			value="Cancel">
			<br> <br> <br>
			<div class="center">
			
				 <input type="button" value="Go back!" onclick="history.back()">
			
		</div>
			 <br> 
			
			 <br>

		<div class="center">
			<button>
				<a href="/JspFiles/home.jsp"> Home</a>
			</button>
		</div>


	</form>
</div>
</body>
</html>