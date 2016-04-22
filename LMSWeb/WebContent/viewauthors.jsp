<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.gcit.lms.entity.Author"%>
<%@ page import="com.gcit.lms.entity.Book"%>
<%@ page import="com.gcit.lms.service.AdministratorService"%>
<%@ include file="include.html"%>

<%
	AdministratorService service = new AdministratorService();
	Integer authorsCount = service.getAuthorCount();
	List<Author> authors = new ArrayList<Author>();
	if (request.getAttribute("authors") != null) {
		authors = (List<Author>) request.getAttribute("authors");
	} else {
		authors = service.getAllAuthors(1);
	}
%>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
	function deleteAuthor(authorId) {
		$.ajax({
			url : "deleteAuthor",
			data : {
				authorId : authorId
			}
		}).done(function(data) {
			$('#authorsTable').html(data);
		});
	}
	
	function pageAuthors(pageNo) {
		out.println("i am inside pade ajax");
		$.ajax({
			url : "pageAuthors",
			data : {
				pageNo : pageNo
			}
		}).done(function(data) {
			$('.pagination').html(data);
		});
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LMS</title>
<h2>Available Authors in the Library Management System</h2>
${result}

<nav>
	<ul class="pagination">
		<li><a href="#" aria-label="Previous"> <span
				aria-hidden="true">&laquo;</span>
		</a></li>
		<%if(authorsCount!=null &&  authorsCount >0){
			int pageNo = authorsCount % 10;
			int pages = 0;
			if(pageNo == 0){
				pages = authorsCount/10;
			}else{
				pages = authorsCount/10 + 1;
			}
			for(int i=1; i<=pages;i++){%>
				<li><a href="pageAuthors?pageNo=<%=i%>"><%=i %></a></li>
			<%}
			
		} %>
		<li>
      		<a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
	</ul>
</nav>


<div class="row">
	<div class="col-md-6">
		<table border="2" id="authorsTable" class="table">
			<tr>
				<th>Author Name</th>
				<th>Book Title</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>

			<%
				for (Author a : authors) {
			%>
			<tr>
				<td>
					<%
						out.println(a.getAuthorName());
					%>
				</td>
				<td>
					<%
						if (a.getBooks() != null && a.getBooks().size() > 0) {
								for (Book b : a.getBooks()) {
									out.println(b.getTitle());
									out.println(", ");
								}
							}
					%>
				</td>
				<td align="center"><button type="button"
						class="btn btn btn-primary" data-toggle="modal"
						data-target="#myModal1"
						href="editauthor.jsp?authorId=<%=a.getAuthorId()%>">EDIT</button></td>


				<td><button type="button" class="btn btn-sm btn-danger"
						onclick="deleteAuthor(<%=a.getAuthorId()%>)">DELETE</button></td>
			</tr>
			<%
				}
			%>



		</table>
	</div>
</div>
<div id="myModal1" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content"></div>
	</div>
</div>

