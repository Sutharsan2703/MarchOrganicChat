//Chat One Page . jsp



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chat One Page!</title>

<link rel="stylesheet" type="text/css" href="/CssFiles/chatOnePage.css">

</head>
<body>

	<div class="colo1">
		<span id="demo"></span> <span><h4 class="right">
				<a href="/logout">Logout</a>
			</h4></span>
	</div>
	<script>
		document.getElementById('demo').innerHTML = Date();
	</script>

	<main class="container">


		<!-- Text main Section -->
		<section class="text">


			<%
			String uName = session.getAttribute("userName").toString();
			String name = session.getAttribute("name").toString().toUpperCase();
			%>

			<p class="text-pragraph">
			<h3 class="center">Begin to chat</h3>
			</p>




			<div class="colo">
				<p>
					Welcome to the world of Words and thoughts : <span class="whi">
						<strong><em><%=name%> </em></strong>
					</span> as
					<%=uName%>
				</p>
			</div>

		</section>

		<div class="container1">
			<!-- Cards -->
			<section class="cards">
				<!-- card-1 -->
				<div class="card c1">
					<div class="card-text">
						<h3>Share Thoughts !</h3>
						<p class="text-paragraph">
							<button>
								<a class="example_e" href="/JspFiles/sendMessage.jsp">To
									send message</a>
							</button>
						</p>
					</div>
				</div>


				<!-- card-2 -->
				<div class="card c2">
					<div class="card-text">
						<h3>Explore !!</h3>
						<p class="text-paragraph">
							<button>
								<a class="example_d" href="/receive">Check for Messages</a>
							</button>
						</p>
					</div>
				</div>


				<!-- card-3 -->
				<div class="card c3">
					<div class="card-text">
						<h3>Delivered !!!</h3>
						<p class="text-paragraph">
							<button>
								<a class="example_c" href="/sent">Messages Sent from me!</a>
							</button>
						</p>
					</div>
				</div>

			</section>
		</div>
	</main>
	<button>
		<a href="/JspFiles/commune.jsp">Commune..!</a>
	</button><br>
	<button>
		<a href="/JspFiles/joinCommune.jsp">Join Commune..!</a>
	</button><br>
	<button>
		<a href="/JspFiles/communeMessage.jsp">Commune Message..!</a>
	</button><br>
	<button>
		<a href="/communeList">Message from commune..!</a>
	</button><br>
	<main class="container">

		<div class="container1">
			<!-- Cards -->
			<section class="cards">
				<!-- card-1 -->
				<div class="card c1">
					<div class="card-text">
						<h3>Commune..!</h3>
						<p class="text-paragraph">
							<button>
								<a class="example_e" href="/JspFiles/commune.jsp">To
									create Commune</a>
							</button>
							<br><br>
							<button>
								<a class="example_c" href="/JspFiles/joinCommune.jsp">To
									Join Commune..!</a>
							</button>
						</p>
					</div>
				</div>


				<!-- card-2 -->
				<div class="card c2">
					<div class="card-text">
						<h3>Commune Message..!</h3>
						<p class="text-paragraph">
							<button>
								<a class="example_d" href="/JspFiles/communeMessage.jsp">Make Messages</a>
							</button>
						</p>
					</div>
				</div>


				<!-- card-3 -->
				<div class="card c3">
					<div class="card-text">
						<h3>My commune..!</h3>
						<p class="text-paragraph">
							<button>
								<a class="example_c" href="/communeList">Message from commune..!</a>
							</button>
						</p>
					</div>
				</div>

			</section>
		</div>
	</main>
	


</body>

</html>