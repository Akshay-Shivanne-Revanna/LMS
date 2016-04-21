<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Author" %>
    <%@ page import="com.gcit.lms.entity.Publisher" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%@ include file="include.html" %>
    <% 
    	AdministratorService service = new AdministratorService();
    	List<Publisher> publisher = service.getAllPublishers();
    %>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script type="text/javascript">
function deletePublisher(publisherId){
	
	$.ajax({
		  url: "deletePublisher",
		  data:{
			  publisherId: publisherId
		  }
		}).done(function(data) {
		  $('#publisherTable').html(data);
		});
}

</script>

<title>LMS</title>

<h2>Welcome to GCIT Library Management System - Admin</h2>
${result}

<table border="2" id="publisherTable">
	<tr>
		<th>Publisher Name</th>
		<th>Publisher Address</th>
		<th>Publisher Phone</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
		
		
	
	
		<%for (Publisher p: publisher){ %>
		<tr>
		<td><% out.println(p.getPublisherName()); %></td>
		<td><%out.println(p.getPublisherAddress()); %></td>
		<td><%out.println(p.getPublisherPhone()); %></td>
		
		<td><button type="button" onclick="javascript:location.href='editPublisher?publisherId=<%=p.getPublisherId() %>'">EDIT</button>
		<td><button type="button" onclick="deletePublisher(<%=p.getPublisherId() %>)">DELETE</button>
		</tr>
		<%} %>
		
	

</table>
