<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<title>Login!</title>




</head>
<link rel="stylesheet" type="text/css" href="/CssFiles/container.css">
<link rel="stylesheet" type="text/css" href="/CssFiles/login.css">

<body>

	

	

			<div class="whole">
			<div class="part">
			


			
</div><br>




<div class="part1">

		<form class="center" name="reg" method="post" action="/login" required>
			<label><h2>Login ... </h2></label>
			 UserName
			<br>:<input type="text"
				name="userName" id="userName" placeholder="UserName (abcd1234)"
				size="45px" required> <br> <br> Password
			<br> :<input type="password"
				name="password" id="password"
				placeholder="In number atleast 6 digits as (000000)" size="30px"
				required> <br> <br> <br> <input type="submit">
			<input type="reset" value="Cancel"><br> <br>
			

			<div class="center">

				<input class="bttn" type="button" value="Go back!" onclick="history.back()">

			</div>

		</form>

			
		</div>
		</div>
<div class="part2">
		<div class="col">

<p class="right"><div class="bttn">
				Don't had an Account?<br>
				<button>
					<a href="/JspFiles/register.jsp">Register</a>
				</button>
			</p></div></div>
			<br>		<div class="col">
			
			<p class="right"><div class="bttn">
				Forgot Password? <br>or 
				<button>
					<a href="/JspFiles/uName.jsp">Check</a>
				</button>
				<br> Check User Name? <br> <br>

			</p>
			</div>
		</div></div>
<p class="left">since Last refresh:</p>
<h5 class="left" id="demo"></h5>
<script>
	document.getElementById('demo').innerHTML = Date();
</script>
	
</body>
</html>
