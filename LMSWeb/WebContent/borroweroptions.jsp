<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Author" %>
    <%@ page import="com.gcit.lms.entity.Branch" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
    <%@ page import="com.gcit.lms.entity.BookLoans" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%@ include file="include.html" %>
    <% 
    	AdministratorService service = new AdministratorService();
    	BookLoans bl = new BookLoans();
   		
    %>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script type="text/javascript">
function deleteBranch(branchId){
	$.ajax({
		  url: "deleteBranch",
		  data:{
			  branchId: branchId
		  }
		}).done(function(data) {
		  $('#branchTable').html(data);
		});
}

</script>
<head>

<title>LMS</title>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<h2>Welcome to GCIT Library Management System - Admin</h2>
${result}

<table border="2" id="bookLoansTable">
	<tr>
		<th>bookId</th>
		<th>branchId</th>
		<th>cardNo</th>
		<th>dateCut</th>
		<th>dateDate</th>
		<th>dateIn</th>
	</tr>
		
		
	
	
	
	

</table>
<br/><br/>
<a href="aborrower.jsp">EXIT</a>
