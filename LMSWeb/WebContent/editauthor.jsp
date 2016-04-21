<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Author" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%@ include file="include.html" %>
    <%Author author = null;
    if(request.getAttribute("author")!=null){
    	author = (Author)request.getAttribute("author");
    	out.println("");
    	}%>
    

<title>LMS</title>
<h2>Welcome to GCIT Library Management System - Admin</h2>
<h3>Edit Author Details Below:</h3>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>

${result}

	<form action="updateAuthor" method="post">
		Author Name: <input type="text" name="authorName" value="<%=author.getAuthorName() %>"> <br />
		<input type="hidden" name="authorId" value=<%=author.getAuthorId() %>>
		<button type="submit">Edit Author</button>
	</form>
