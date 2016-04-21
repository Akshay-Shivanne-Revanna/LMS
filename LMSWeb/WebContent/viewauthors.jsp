<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Author" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%@ include file="include.html" %>
    <% 
    	AdministratorService service = new AdministratorService();
    	List<Author> authors = service.getAllAuthors();
    %>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script type="text/javascript">
function deleteAuthor(authorId){
	$.ajax({
		  url: "deleteAuthor",
		  data:{
			  authorId: authorId
		  }
		}).done(function(data) {
		  $('#authorsTable').html(data);
		});
}

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LMS</title>
<h2>Available Authors in the Library Management System</h2>
${result}

<table border="2" id="authorsTable">
	<tr>
		<th>Author Name</th>
		<th>Book Title</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	
		<%for (Author a: authors){ %>
		<tr>
		<td><% out.println(a.getAuthorName()); %></td>
		<td><%if(a.getBooks()!=null && a.getBooks().size() >0){
			for(Book b: a.getBooks()){
				out.println(b.getTitle());
				out.println(", ");
			}
		}	
		%></td>
		<td><button type="button" onclick="javascript:location.href='editAuthor?authorId=<%=a.getAuthorId() %>'">EDIT</button>
		<td><button type="button" onclick="javascript:location.href='deleteAuthor?authorId=<%=a.getAuthorId() %>'">DELETE</button>
		</tr>
		<%} %>
		
	

</table>
