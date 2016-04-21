<%@page import="com.gcit.lms.entity.BookCopies"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.BookCopies" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%@ include file="include.html" %>
    <%List<BookCopies> bc = null;
    if(request.getAttribute("bookCopies")!=null){
    	bc = (List<BookCopies>)request.getAttribute("bookCopies");
    	}%>

<title>LMS</title>

<h4>Edit Book Copies Below:</h4>
<table border="2" id="authorsTable">
	<tr>
		<th>Book ID</th>
		<th>No. of Copies</th>
		<th>EDIT</th>
	</tr>
	<form action="updateBookCopies" method="post">
	<%for(BookCopies bcop: bc){ %>
	<tr>
		<td><%out.println(bcop.getBook().getBookId());%></td>
		<td><input type="text" name="noOfCopies" value="<%=bcop.getNoOfCopies() %>"></td>
		<input type="hidden" name="branchId" value=<%=bcop.getBranch().getBranchId()%>>	
		<input type="hidden" name="bookId" value=<%=bcop.getBook().getBookId()%>>	
		<td><button type="submit">Edit Book</button></td>
	</tr>
		<%}%>
	</form>
