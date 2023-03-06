<%@page import="com.chainsys.chatspring.model.Register"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Warn User on Message!</title>

<script type="text/javascript">
	alert("Warning!! This Message is warning the user!!!  ")
</script>
<link rel="stylesheet" type="text/css" href="/CssFiles/writeMessage.css">


<%
String uName = session.getAttribute("userName").toString();
String name = session.getAttribute("name").toString().toUpperCase();

String messageId = session.getAttribute("messageId").toString();
%>
<% 
List<Register> uList=(List<Register> )session.getAttribute("userList");
 %>

<p id="demo"></p>
<script>
	document.getElementById('demo').innerHTML = Date();
</script>

</head>
<body>
	<fieldset>
		<legend class="center">

			<div>
				<p class="center">
					Welcome to the world of Words and thoughts : <span class="whi">
						<strong><em><%=name%> </em></strong>
					</span> as
					<%=uName%>
				</p>
				<br> <br>
			</div>
		</legend>



		<form name="send" method="post" id="send" action="/send">


		Sender&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input type="text"
				name="sender" placeholder="sender (ex: userName ) "
				value="<%=uName%>" size="30px" readonly="readonly" required><br>
			<br> <br> <br><label for="Receiver">Suspect user:</label>
&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;

<select id="receiver" name="receiver">
  
  
 <%for(Register register : uList) {%>  <option  value="<%=register.getUserName() %>"><%=register.getMailId()%></option>
  <%} %>	
</select>
			<br> <br> <br> <br> Report on Message-Key&nbsp;
			&nbsp;&nbsp;:<input type="number" name="messageId"
				value="<%=messageId%>" size="30px" required readonly="readonly">
			<br> <br> Message &nbsp; &nbsp;&nbsp; &nbsp;: <input
				type="text" name="message"
				value="(<%=messageId%>)   Reply to this message is Mandatory. If ignored, Action will be taken from the Administration.
				 The MessageId: <%=messageId%> was been Reported!!"
				readonly="readonly"><br>
			<br> <br><br> <input
				type="submit"> <input type="reset" value="Cancel"><br>
			<br> <br>

			<div class="center">
				<button>
					<a href="/JspFiles/admin.jsp"> back</a>
				</button>
			</div>

		</form>
	</fieldset>
	<h4 class="center">
		<a href="/logout">Logout</a>
	</h4>


</body>
</html>