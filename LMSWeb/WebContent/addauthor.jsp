<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LMS</title>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<h2>Welcome To GCIT Library Management System - Admin</h2>
<h3>Enter Author Details Below:</h3>
<%-- <%=request.getAttribute("result") %> --%>
${result}
</head>
<body>
	
	<form action="addAuthor" method="post">
		
		Author Name : <input type="text" name="authorName"> 
		<br/>
		<button type="submit">Add Author</button>
	</form>
	<br/><br/>
	<br/><br/>
	<a href="author.html">EXIT</a>
</body>
</html>