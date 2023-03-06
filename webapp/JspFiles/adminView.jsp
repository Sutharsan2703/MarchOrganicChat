<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<p id="demo"></p>
<script>
document.getElementById('demo').innerHTML = Date();
</script>

</head>
<body>
<button ><a href="/JspFiles/admin.jsp"> Admin Temporary page to check Messages</a></button>
<button ><a href="/JspFiles/viewUName.jsp"> Admin Temporary page to view Users</a></button>

<iframe src="http://localhost:8080/JspFiles/adminView.jsp" title="Navigation menu" referrerpolicy="no-referrer">
  <p>Your browser does not support i frames.</p>
</iframe>

</body>
</html>