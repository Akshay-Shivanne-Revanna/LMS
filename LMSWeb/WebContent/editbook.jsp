<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
     <%@ page import="com.gcit.lms.service.AdministratorService" %>
     
    
    <%AdministratorService adminService = new AdministratorService();
 		String bookId = request.getParameter("bookId");
		 Book book = adminService.getBookByID(Integer.parseInt(bookId));
	%>

<title>LMS</title>

<h3>Edit Book Details Below:</h3>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>

${result}
<div class="modal-body">
	<form action="updateBook" method="post">
		Book Title: <input type="text" name="title" value="<%=book.getTitle() %>"> <br /><br />
		<input type="hidden" name="bookId" value=<%=book.getBookId() %>>
		Submit :<button type="submit">Edit Book</button>
	</form>
</div>