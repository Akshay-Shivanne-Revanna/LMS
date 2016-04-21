<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Borrower" %>
    
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%Borrower borrower = null;
    if(request.getAttribute("borrower")!=null){
    	borrower = (Borrower)request.getAttribute("borrower");
    	}%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LMS</title>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>

${result}
</head>
<body>
<h2>Welcome to GCIT Library Management System - Admin</h2>
<h3>Edit Borrower Details Below:</h3>
	<form action="updateBorrower" method="post">
		Borrower Name: <input type="text" name="borrowerName" value="<%=borrower.getName() %>"> <br /><br /><br />
		Borrower Address:<input type="text" name="borrowerAddress" value="<%=borrower.getAddress() %>"> <br /><br /><br />
		Borrower phone : <input type="text" name="borrowerPhone" value="<%=borrower.getPhone() %>"> <br /><br /><br />
		<input type="hidden" name="cardNo" value=<%=borrower.getCardNo() %>>
		Submit :<button type="submit">Edit Borrower</button>
	</form>
	

</body>
</html>