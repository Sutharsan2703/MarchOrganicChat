<%@page import="com.chainsys.chatspring.mapper.MessageViewMapper"%>
<%@page import="org.springframework.jdbc.core.JdbcTemplate"%>
<%@page import="com.chainsys.chatspring.model.PersonalChat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Administrator</title>






<link rel="stylesheet" type="text/css" href="/CssFiles/chatOnePage.css">

		<%
			String uName = session.getAttribute("userName").toString();
			String name = session.getAttribute("name").toString().toUpperCase();
			%>

</head>

<body>
<div class="colo1">
		<p id="demo"></p>
<script>
	document.getElementById('demo').innerHTML = Date();
</script>
		
		<div>
			<span id="demo"></span>
			<button class="openbtn" onclick="myFunction()">&#9776;
				Profile</button>

			<span class="right"><strong>
					<a href="/logout">Logout</a>
				</strong></span>
		</div>
	</div>


	<script>
		document.getElementById('demo').innerHTML = Date();
	</script>
	
	
	
	<div class="whole">
		<div class="part">
<nav id="nav">
	<div id="mySidepanel" class="sidepanel">
		<a href="javascript:void(0)" class="closebtn1" onclick="myFunction()">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &times;</a>
		<h3>My Profile</h3>
		<br>
		<h5>Name</h5>
		<a href="#"><%=name%></a>
		<h5>UserName</h5>
		<a href="#"><%=uName%></a>
		<h5>Commune</h5>
		<a href="/communeList">My commune</a> <a href="/JspFiles/commune.jsp">Create
			New </a>
		<h5>Password !</h5>
		<a href="/JspFiles/uName.jsp">Reset ?</a>
	</div></nav>
		</div>

	<main class="container">


		<!-- Text main Section -->
		<section class="text">
	<p class="text-pragraph">
			<h3>Begin to chat</h3>
			<div class="colo">
				
					Welcome to the world of Words and thoughts : <span class="whi">
						<strong><em><%=name%> </em></strong>
					</span> as
					<%=uName%>
				
			</div>
			</p>




			

		</section>

		<div class="container1">
			<!-- Cards -->
			<section class="cards">
				<!-- card-1 -->
				<div class="card c1">
						<div class="card-text">
							<h3>Share Thoughts !</h3>
							<p class="card-paragraph">
								<button>
									<a class="example_e" href="/JspFiles/sendMessage.jsp">To
										send message</a>
								</button>
							</p>
							
							<script>


function myFunction() {
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
							<p class="card-paragraph">
								<button>
									<a class="example_c" href="/JspFiles/sendImage.jsp">
										send Image</a>
								</button>
							</p>
						</div>
					</div>


					<!-- card-2 -->
					<div class="card c2">
						<div class="card-text">
							<h3>Explore !!</h3>
							<p class="card-pragraph">
								<button>
									<a class="example_d" href="/receive">Check for Messages</a>
								</button>
								</p>
							<p class="card-paragraph">
								<button>
									<a class="example_c" href="/receiveImage">Check for Images</a>
								</button>
							</p>
						</div>
					</div>


					<!-- card-3 -->
					<div class="card c3">
						<div class="card-text">
							<h3>Delivered !!!</h3>
							<p class="card-pragraph">
								<button>
									<a class="example_c" href="/sent">Messages Sent from me!</a>
								</button>
								</p>
							<p class="card-paragraph">
								<button>
									<a class="example_e" href="/sentImage">Images Sent from me!</a>
								</button>
							</p>
						</div>
				</div>
				<div class="card c4">
					<div class="card-text">
						<h3>Report</h3>
						<p class="card-pragraph">

							<button>
								<a class="example_e" href="/checkReport">check report</a>
							</button>
						</p>
					</div>
				</div>



			</section>
		</div>
	</main>
</div>




	


</body>

</html>