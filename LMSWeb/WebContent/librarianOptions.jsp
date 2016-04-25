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
<div class="row">
	<div class="col-md-6">
<table border="2" id="authorsTable" class="table">
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
		<td><button type="submit" class="btn btn btn-primary" data-toggle="modal"
						data-target="#myModal1">Edit Book</button></td>
	</tr>
		<%}%>
	</form>
</table>
</div>
</div>
<div id="myModal1" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content"></div>
	</div>
</div>