<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Author" %>
    <%@ page import="com.gcit.lms.entity.Publisher" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
    <%@ page import="com.gcit.lms.entity.Borrower" %>
    <%@ page import="com.gcit.lms.entity.BookLoans" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    
    <% 
    	Integer cardNo = null;
    	if(request.getAttribute("cardNo")!=null){
    		cardNo = (Integer)request.getAttribute("cardNo");
    	}
    
    	AdministratorService service = new AdministratorService();
    	List<Book> books = service.getAllBorrowersByID(cardNo);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script type="text/javascript">


</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LMS</title>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<h2>Welcome to GCIT Library Management System - Admin</h2>
${result}
</head>
<body>

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

</body>
</html>