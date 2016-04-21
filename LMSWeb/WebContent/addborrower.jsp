<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LMS</title>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<h2>Welcome to GCIT Library Management System - Admin</h2>
<h3>Enter Borrower Details Below:</h3>
<%-- <%=request.getAttribute("result") %> --%>
${result}
</head>
<body>
	
	<form action="addBorrower" method="post">
		
		Borrower Name : <input type="text" name="borrowerName"> 
		<br/><br/>
		Borrower Address : <input type="text" name="borrowerAddress"> 
		<br/><br/>
		Borrower Phone : <input type="text" name="borrowerPhone"> 
		<br/><br/>
		<button type="submit">Add Borrower</button>
	</form>

</body>
</html>