<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LMS</title>
<h2>Welcome to GCIT Library Management System - Admin</h2>
<h3>Enter Branch Details Below:</h3>
<%-- <%=request.getAttribute("result") %> --%>
${result}
</head>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<body>
	
	<form action="addBranch" method="post">
		
		Branch Name : <input type="text" name="branchName"> 
		<br/><br/><br/>
		Branch Address : <input type="text" name="branchAddress"> 
		<br/><br/><br/>
		<button type="submit">Add Branch</button>
	</form>

</body>
</html>