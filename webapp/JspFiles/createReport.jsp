<%@page import="com.chainsys.chatspring.model.Register"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Report Form</title>
</head>
<link rel="stylesheet" type="text/css" href="/CssFiles/writeMessage.css">

<%
String uName = session.getAttribute("userName").toString();
String name = session.getAttribute("name").toString().toUpperCase();
%>
<% 
List<Register> uList=(List<Register> )session.getAttribute("userList");
 %>

<style type="text/css">
.center{
text-align: center;}</style>
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
			<label align="left">Be careful it's a Report Page </label>
			<br> <br>
		</div>
	</legend>


		<style type="text/css">
			textarea {
  width: 100%;
  height: 150px;
  padding: 12px 20px;
  box-sizing:
			border-box;
  border: 2px solid
			#ccc;
  border-radius: 4px;
  background-color:#f8f8f8;
  font-size: 16px;
  resize:none;
}

		
		
		</style>

		<form name="createReport" method="post" id="createReport" onsubmit="alerts()"
			action="/createReport">


			
<label for="reportUser">User to report :</label>
&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;

<select id="reportUserName" name="reportUserName">
  
  
 <%for(Register register : uList) {%>  <option  value="<%=register.getUserName() %>"><%=register.getMailId()%></option>
  <%} %>	
</select>
			
			<br> <br>  Reason for report &nbsp; &nbsp;&nbsp; &nbsp;:<textarea  type="text" name="reportContent" id="reportContent" 
			  placeholder="reason must not exceed 200-225 characters including space..." required="required"></textarea>
			
			<br> <br>

			UserName  &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input type="text"
				name="userName" id ="userName"
				value="<%=uName%>" size="30px" readonly="readonly" required><br>
			<br>
			

		
			Message-Key &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; :<input type="number"
				name="messageId" placeholder="Give valid message-key to reported"
				 size="30px" required><br>
			<br> 
				
				<input type="submit"> <input type="reset" value="Cancel"><br>
			<br> <br>
			

			

</form>
</fieldset>
<h4 class="right">
	<a href="/logout">Logout</a>
</h4>
	<div class="center">
			
				 <input type="button" value="Go back!" onclick="history.back()">
			
		</div>

<script type="text/javascript">
		function alerts(){
			
			alert("Report created Successfully...");
</script>
</body>

</html>