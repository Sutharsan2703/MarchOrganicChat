<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<title>Registered Login!</title>


<p class="left">since Last refresh:</p>
<h5 class="left" id="demo"></h5>


<script>
	document.getElementById('demo').innerHTML = Date();
</script>

</head>
<link rel="stylesheet" type="text/css" href="/CssFiles/container.css">
<link rel="stylesheet" type="text/css" href="/CssFiles/login.css">

<body>

	<% String uName=session.getAttribute("userName").toString(); %>
	
<script type="text/javascript">alert("UserName is Registered as <%=uName%>... Make Connection!!!  " )</script>
 
			<div class="whole">
			<div class="part">
			
		
</div><br>




<div class="part1">

		<form class="center" name="reg" method="post" action="/login" required>
			<label><h2>Login ... </h2></label>
			 UserName
			<br>:<input type="text"
				name="userName" id="userName" value="<%=uName%>"
				size="45px" required> <br> <br>
			<div class="drac">	
			 Password
			<br> :<input type="password"
				name="password" id="password"
				placeholder="In number atleast 6 digits as (000000)" size="30px"
				required> <br> <br> <br> 
				</div>
				<input type="submit">
			<input type="reset" value="Cancel"><br> <br>
			<div class="center">
				<button>
					<a href="/JspFiles/home.jsp"> Home</a>
				</button>
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
		<div class="drac">	
			<p class="right"><div class="bttn">
				Forgot Password? <br>or 
				<button>
					<a href="/JspFiles/uName.jsp">Check</a>
				</button>
				<br> Check User Name? <br> <br>

			</p></div>
			</div>
		</div></div>

	
</body>
<script>
	document.getElementById('demo').innerHTML = Date();
</script>
</html>

