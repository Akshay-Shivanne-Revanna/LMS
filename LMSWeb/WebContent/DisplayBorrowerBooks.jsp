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
<div class="row">
	<div class="col-md-6">
<table border="2" id="publisherTable" class="table">
	<tr>
		<th>Book Id</th>
		<th>Book Title</th>
		<th>Return</th>
	</tr>
		
		<%for (Book b: books){ %>
		<tr>
		<td><% out.println(b.getBookId()); %></td>
		<td><%out.println(b.getTitle()); %></td>
		<td><button type="button" class="btn btn btn-primary" data-toggle="modal"
						data-target="#myModal1" onclick="javascript:location.href='bookcheckIn?bookId=<%=b.getBookId() %>&cardNo=<%=cardNo%>'">CHECK IN</button>
		</tr>
		<%} %>
		
	

</table>
</div>
</div>
<div id="myModal1" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content"></div>
	</div>
</div>