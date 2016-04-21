<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Author" %>
    <%@ page import="com.gcit.lms.entity.Publisher" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
    <%@ page import="com.gcit.lms.entity.Borrower" %>
    <%@ page import="com.gcit.lms.entity.BookLoans" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%@ include file="include.html" %>
    <% 
    	Integer cardNo = null;
    	if(request.getAttribute("cardNo")!=null){
    		cardNo = (Integer)request.getAttribute("cardNo");
    	}
    
    	AdministratorService service = new AdministratorService();
    	List<Book> books = service.getAllBorrowersByID(cardNo);
    %>

<title>LMS</title>

<h2>Welcome to GCIT Library Management System - Admin</h2>
${result}

<table border="2" id="publisherTable">
	<tr>
		<th>Book Id</th>
		<th>Book Title</th>
		<th>Return</th>
	</tr>
		
		<%for (Book b: books){ %>
		<tr>
		<td><% out.println(b.getBookId()); %></td>
		<td><%out.println(b.getTitle()); %></td>
		<td><button type="button" onclick="javascript:location.href='bookcheckIn?bookId=<%=b.getBookId() %>&cardNo=<%=cardNo%>'">CHECK IN</button>
		</tr>
		<%} %>
		
	

</table>
