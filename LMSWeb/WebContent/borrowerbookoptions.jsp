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
    	Integer branchId = null;
		if(request.getAttribute("branchId")!=null){
			branchId = (Integer)request.getAttribute("branchId");
		}
    
		Integer cardNo = null;
		if(request.getAttribute("cardNo")!=null){
			cardNo = (Integer)request.getAttribute("cardNo");
		}
		
    	AdministratorService service = new AdministratorService();
    	List<Book> books = (List<Book>)service.getBooksWithBranch(branchId);
     %>

<title>LMS</title>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<h2>Welcome to GCIT Library Management System - Borrower</h2>

${result}

	<table border="2" id="borrowerCheckout">
	<tr>
		<th>Book Title</th>
		<th>Select</th>
	</tr>
		
		<%for (Book b: books){ %>
		<tr>
		<td><% out.println(b.getTitle()); %></td>
		
		<td><button type="button" onclick="javascript:location.href='borrowerCheckout?branchId=<%=branchId%>&bookId=<%=b.getBookId()%>&cardNo=<%=cardNo%>'">CHECK OUT</button>
		</tr>
		<%} %>
		
	

</table>
<br/><br/>
<a href="borroweroptions.jsp">EXIT</a>
