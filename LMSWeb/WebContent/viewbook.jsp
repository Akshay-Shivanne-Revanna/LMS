<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Author" %>
    <%@ page import="com.gcit.lms.entity.Branch" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <% 
    	AdministratorService service = new AdministratorService();
   		List<Book> books = service.getAllBooks();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script type="text/javascript">
function deleteBook(bookId){
	$.ajax({
		  url: "deleteBook",
		  data:{
			  bookId: bookId
		  }
		}).done(function(data) {
		  $('#bookTable').html(data);
		});
}

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LMS</title>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<h2>Welcome to GCIT Library Management System - Admin</h2>
${result}
</head>
<body>

<table border="2" id="bookTable">
	<tr>
		<th>Book Title</th>
		<th>Author</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
		
		
	
	
		<%for (Book b: books){ %>
		<tr>
		<td><% out.println(b.getTitle()); %></td>
		<td><%if(b.getAuthors()!=null && b.getAuthors().size() >0){
			for(Author a: b.getAuthors()){
				out.println(a.getAuthorName());
				out.println(", ");
			}
		}	
		%></td>
		
		<td><button type="button" onclick="javascript:location.href='editBook?bookId=<%=b.getBookId() %>'">EDIT</button>
		<td><button type="button" onclick="deleteBook(<%=b.getBookId() %>)">DELETE</button>
		</tr>
		<%} %>
		
	

</table>

</body>
</html>