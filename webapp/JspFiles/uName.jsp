<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Get Updated UserName</title>
</head>

	<link rel="stylesheet" type="text/css" href="/CssFiles/container.css">

	<style type="text/css">
	
	body{
	background-color: green;
	}
	
.aa {
	display: inline;
}

.ab {
	margin-top: 2cm;
}

.ab :hover, a:hover {
	color: #ffffff !important;
	background: #e0591f;
	border-color: #f6b93b !important;
	border-radius: 10px;
	transition: all 0.4s ease 0s;
}

.ac {
	margin-top: 2cm;
}

.ac :hover , .bu:hover {
	color: #ffffff !important;
	background: purple;
	border-color: #f6b93b !important;
	border-radius: 10px;
	transition: all 0.4s ease 0s;
}


</style>
<body class="center">
	<div class="aa">
		<div class="ab">
			<div class="container2">
				<form align="center" name="reg" method="post" action="/getUserName">

					<br> Check UserName! <br> <br> MailId &nbsp;&nbsp;
					&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;::<input
						type="email" name="mailId" id="mailId"
						placeholder="MailId (ex: name@chainsys.com )" size="30px" required>

					<input type="submit"> <input type="reset" value="Cancel"><br>
					<br>
				</form>
			</div>
		</div>
		<br> <br>
		<br>
		<button class="bu">
			<input type="button" value="Go back!" onclick="history.back()">
		</button>
		<br> 
		<div class="ac">
			<div class="container2">
				<form align="center" name="log" method="post"
					action="/forgotPassword" required>

					Forgot Password? <br> <br>
					<br> MailId &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					&nbsp; &nbsp;&nbsp;::<input type="email" name="mailId" id="mailId"
						placeholder="MailId (ex: name@chainsys.com )" size="30px" required>
					<br> <br> Answer the Security Question &nbsp;
					&nbsp;&nbsp;:<select id="secq" name="secq">
						<option>Enter your favorite Sports Icon</option>
						<option>Enter your hobbies</option>
					</select> <br> <br> Security &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					&nbsp; &nbsp;&nbsp;:<input type="text" name="security"
						id="security"
						placeholder="answer must be more than six(6) characters"
						size="30px" required> <br> <br> <input
						type="submit"> <input type="reset" value="Cancel"><br>
					<br> <br> <br> <br>



				</form>
			</div>

		</div>


</body>
</html>