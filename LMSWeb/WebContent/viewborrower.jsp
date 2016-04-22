<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Author" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
     <%@ page import="com.gcit.lms.entity.Borrower" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%@ include file="include.html" %>
    <% 
    	AdministratorService service = new AdministratorService();
    	List<Borrower> borrower = service.getAllBorrowers();
    %>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script type="text/javascript">
function deleteBorrower(cardNo){
	$.ajax({
		  url: "deleteBorrower",
		  data:{
			  cardNo: cardNo
		  }
		}).done(function(data) {
		  $('#borrowerTable').html(data);
		});
}

</script>

<h2>Welcome to GCIT Library Management System - Admin</h2>
${result}
<body>
<div class="row">
	<div class="col-md-6">
<table border="2" id="borrowerTable" class="table">
	<tr>
		<th>borrower name</th>
		<th>address</th>
		<th>phone</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
	
		<%for (Borrower b: borrower){ %>
		<tr>
		<td><% out.println(b.getName()); %></td>
		<td><%out.println(b.getAddress()); %></td>
		<td><%out.println(b.getPhone()); %></td>
		
		<td align="center"><button type="button"
						class="btn btn btn-primary" data-toggle="modal"
						data-target="#myModal1"
						href="editborrower.jsp?cardNo=<%=b.getCardNo()%>">EDIT</button></td>
		
		<td><button type="button" class="btn btn-danger" onclick="deleteBorrower(<%=b.getCardNo() %>)">DELETE</button>
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
