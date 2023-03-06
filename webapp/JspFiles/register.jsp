<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<meta charset="ISO-8859-1">

<title>Registration</title>
</head>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" type="text/css" href="/CssFiles/register.css">
<link rel="stylesheet" type="text/css" href="/CssFiles/container.css">
<body>





	<div>
		<p class="right">
			<a href="/JspFiles/login.jsp">Already have an Account?</a> <br>
			<button>
				<a href="/JspFiles/login.jsp">Login</a>
			</button>
			<br>
		</p>





		<div class="container2">



			


			<form name="reg" method="post" id="regForm" onclick="formValidate()"
				action="/register">
				
					<label>Register to Make Connection! </label><br> <br> <br>
					Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input
						type="text" name="name" id="name" onkeyup="nameValidate()"
						placeholder="Name (ex: sky.a or a.sky ) " size="30px" required> <br>
						<span id="nameError"></span>
											 <br>
					
					MailId &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					&nbsp; &nbsp; &nbsp;&nbsp;:<input type="email" name="mailId"
						id="mailId" placeholder="MailId (ex: name@chainsys.com )" onkeyup="mailIdValidate()"
						size="30px" required>  <br>
						<span id="mailIdError"></span>
						 <br>
				    UserName
					&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:<input type="text"
						name="userName" id="userName" onkeyup="userNameValidate()"
						placeholder="It will be temporary (actual generated after register)"
						size="45px" required> <br><span id="userNameError"></span>  <br>
					<label for="secq"></label> Choose the Security Question &nbsp;
					&nbsp;&nbsp;:<select id="secq" name="secq">
						<option>Enter your favorite Sports Icon</option>
						<option>Enter your hobbies</option>
					</select>  <br> <br><br>
					Security &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					&nbsp; &nbsp;&nbsp;:<input type="text" name="security"
						id="security" onkeyup="securityValidate()"
						placeholder="answer must be more than six(6) characters"
						size="30px" required>  <br>
						<span id="securityError"></span>
						 <br> 
					Password
					&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
					&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; :<input type="password"
						name="password" id="password" onkeyup="passwordValidate()"
						placeholder="In number atleast 6 digits as (000000)" size="30px"
						required ><br><span><input type="checkbox" onclick="viewPassword()"> </span>
						 <br>
						<span id="passwordError"></span>  <br> 
					Confirm Password&nbsp;
					&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;:<input
						type="password" name="confirm" id="confirm" onkeyup="confirmValidate()"
						placeholder="must be same as Password " size="30px" required> <br>
						<span id="confirmError"></span>

					<br> <br>
				

				<input type="submit" onkeyup="formValidate()">
				
		
						 <input type="reset" value="Cancel"><br><span id="submitError"></span>
				<br>


	<div class="center">
			
				 <input type="button" value="Go back!" onclick="history.back()">
			
		</div>


				<button>
					<a href="/JspFiles/home.jsp"> Home</a>
				</button>
				<br> 
				

				<p class="right">
					<button>
						<a href="/JspFiles/uName.jsp">Check User Name</a>
					</button>
				</p>
				<br>

			</form>
		</div>

<script src="/jsFiles/registerValid.js"></script>
</div>


</body>
</html>




