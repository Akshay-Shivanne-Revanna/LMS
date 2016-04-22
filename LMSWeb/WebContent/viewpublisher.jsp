<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.gcit.lms.entity.Author"%>
<%@ page import="com.gcit.lms.entity.Publisher"%>
<%@ page import="com.gcit.lms.entity.Book"%>
<%@ page import="com.gcit.lms.service.AdministratorService"%>
<%@ include file="include.html"%>
<%
	AdministratorService service = new AdministratorService();
    	List<Publisher> publisher = service.getAllPublishers();
%>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
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
<div class="row">
	<div class="col-md-6">
		<table border="2" id="publisherTable" class="table">
			<tr>
				<th>Publisher Name</th>
				<th>Publisher Address</th>
				<th>Publisher Phone</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>




			<%
				for (Publisher p : publisher) {
			%>
			<tr>
				<td>
					<%
						out.println(p.getPublisherName());
					%>
				</td>
				<td>
					<%
						out.println(p.getPublisherAddress());
					%>
				</td>
				<td>
					<%
						out.println(p.getPublisherPhone());
					%>
				</td>

				<td align="center"><button type="button"
						class="btn btn btn-primary" data-toggle="modal"
						data-target="#myModal1"
						href="editpublisher.jsp?publisherId=<%=p.getPublisherId()%>">EDIT</button></td>

				<td><button type="button" class="btn btn-danger"
						onclick="deletePublisher(<%=p.getPublisherId()%>)">DELETE</button>
			</tr>
			<%
				}
			%>

		</table>

	</div>
</div>

<div id="myModal1" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content"></div>
	</div>
</div>