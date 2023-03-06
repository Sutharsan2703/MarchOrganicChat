 //  chatOne .jsp

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Welcome User</title>




</head>
<body>
<link rel="stylesheet" type="text/css" href="/CssFiles/container.css">
<% String uName=session.getAttribute("userName").toString(); String name=session.getAttribute("name").toString().toUpperCase(); %>

  </head>
  
  
  <div  class="col">
  
  <div class="left">
<span id="demo"></span><span ><h4 class="right"><a href="/logout">Logout</a></h4></span></div>
<script>
document.getElementById('demo').innerHTML = Date();
</script>
  
  <h3 class="center">Begin to chat</h3> </div>
 
<div class="container">
<%//session.getAttribute(userName); %>


<div>
<p>Welcome to the world of Words and thoughts : <%=name%> as <%=uName%> </p></div> 
<br><br><br><br><br><br>
<button>
			<a href="/JspFiles/sendMessage.jsp">To send message</a>
		</button>
		<br><br><br>
<button>
			<a href="/receive">Check for Messages</a>
		</button>
		<br><br><br>
		<button>
			<a href="/sent">Message Sent from me!</a>
		</button>
		<br>


</div>




<body class="center">
</body>


</body>
</html>