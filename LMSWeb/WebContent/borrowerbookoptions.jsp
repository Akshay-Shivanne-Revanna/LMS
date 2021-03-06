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

<h2>Welcome to GCIT Library Management System - Borrower</h2>

${result}
<div class="row">
	<div class="col-md-6">
	<table border="2" id="borrowerCheckout" class="table">
	<tr>
		<th>Book Title</th>
		<th>Select</th>
	</tr>
		
		<%for (Book b: books){ %>
		<tr>
		<td><% out.println(b.getTitle()); %></td>
		
		<td><button type="button"  class="btn btn btn-primary" data-toggle="modal"
						data-target="#myModal1"  onclick="javascript:location.href='borrowerCheckout?branchId=<%=branchId%>&bookId=<%=b.getBookId()%>&cardNo=<%=cardNo%>'">CHECK OUT</button>
		</tr>
		<%} %>
		
	

</table>
</div>
</div>
<br/><br/>
<div id="myModal1" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content"></div>
	</div>
</div>
