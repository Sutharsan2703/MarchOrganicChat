<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password?</title>
</head>
<body>
<style type="text/css">
.center{
text-align: center; }
</style>

<form class="center" name="log" method="post" action="/forgotPassword" required>
			MailId &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;:<input
				type="email" name="mailId" id="mailId"
				placeholder="MailId (ex: name@chainsys.com )" size="30px" required>
				
			Answer the Security Question &nbsp;
					&nbsp;&nbsp;:<select id="secq" name="secq">
						<option>Enter your favorite Sports Icon</option>
						<option>Enter your hobbies</option>
					</select> <br> <br> 
			Security &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					&nbsp; &nbsp;&nbsp;:<input type="text" name="security"
						id="security"
						placeholder="answer must be more than six(6) characters"
						size="30px" required> <br> <br>
		 <input type="submit">
		  <input type="reset" value="Cancel"><br>
			<br>
			<br><br><br>
						
<div class="center">
	<button>
		<a href="/JspFiles/home.jsp"> Home</a>
	</button>
</div>
				<div class="center">
			
				 <input type="button" value="Go back!" onclick="history.back()">
			
		</div>

		</form>
	

</body>
</html>