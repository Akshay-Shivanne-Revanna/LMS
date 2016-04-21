<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
     <%@ page import="com.gcit.lms.service.AdministratorService" %>
     <%@ include file="include.html" %>
    <%Book book = null;
    if(request.getAttribute("book")!=null){
    	book = (Book)request.getAttribute("book");
    	}%>
    

<title>LMS</title>
<h2>Welcome to GCIT Library Management System - Admin</h2>
<h3>Edit Book Details Below:</h3>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>

${result}

	<form action="updateBook" method="post">
		Book Title: <input type="text" name="title" value="<%=book.getTitle() %>"> <br /><br />
		<input type="hidden" name="bookId" value=<%=book.getBookId() %>>
		Submit :<button type="submit">Edit Book</button>
	</form>
