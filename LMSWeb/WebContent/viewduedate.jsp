<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Author" %>
    <%@ page import="com.gcit.lms.entity.Branch" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
    <%@ page import="com.gcit.lms.entity.BookLoans" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%@ include file="include.html" %>
  <%--   <% 
    	AdministratorService service = new AdministratorService();
   		List<BookLoans> loans = service.getBookLoansByID(cardNo);
    %> --%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>

<title>LMS</title>

<h2>Welcome to GCIT Library Management System - Admin</h2>
${result}

<table border="2" id="publisherTable">
	<tr>
		<th>BookId</th>
		<th>BranchId</th>
		<th>cardNo</th>
		<th>dateOut</th>
		<th>dueDate</th>
		<th>dateIn</th>
	</tr>


</table>
