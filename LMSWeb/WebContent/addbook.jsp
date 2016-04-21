<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Author" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
    <%@ page import="com.gcit.lms.entity.Publisher" %>
    <%@ page import="com.gcit.lms.entity.Genre" %>
    <%@ page import="com.gcit.lms.entity.Branch" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%@ include file="include.html" %>
    <% 
    	AdministratorService service = new AdministratorService();
    	List<Author> authors = service.getAllAuthors();
    	List<Genre> genres= service.getAllGenres();
       	List<Publisher> publishers = service.getAllPublishers();
       	List<Branch> branch = service.getAllBranches();
     %>

<h2>Welcome to GCIT Library Management System - Admin</h2>
<h3>Enter Book Details Below:</h3>

${result}

	<form action="addBook" method="post">
		
		Book Title : <input type="text" name="bookTitle">
		<br/><br/>
		Associate Book to Author:<br/>
		<select multiple name="authorId">
			<%for(Author a: authors){ %>
			<option value="<%=a.getAuthorId()%>"><%=a.getAuthorName() %></option>
			<%} %>
		</select>
		<br/>
		Associate Book to genres:<br/>
		<select multiple name="genre_id">
			<%for(Genre ge: genres){ %>
			<option value="<%=ge.getGenreId()%>"><%=ge.getGenreName() %></option>
			<%} %>
		</select>
		<br/>
		Associate Book to Publisher:<br/>
		<select name="pubId">
			<%for(Publisher p: publishers){ %>
			<option value="<%=p.getPublisherId()%>"><%=p.getPublisherName() %></option>
			<%} %>
		</select>
		<br/>
		Associate Book to Branch:<br/>
		<select name="branchId">
			<%for(Branch b: branch){ %>
			<option value="<%=b.getBranchId()%>"><%=b.getBranchName() %></option>
			<%} %>
		</select>
		<br/>
		
			
		<button type="submit">Add Book</button>
	</form>
