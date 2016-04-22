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
	Integer publisherCount = service.getPublisherCount();
	List<Publisher> publishers = new ArrayList<Publisher>();
	if (request.getAttribute("publishers") != null) {
		publishers = (List<Publisher>) request.getAttribute("publishers");
	} else {
		publishers = service.getAllPublishers(1);
	}
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

<nav>
	<ul class="pagination">
		<li><a href="#" aria-label="Previous"> <span
				aria-hidden="true">&laquo;</span>
		</a></li>
		<%if(publisherCount!=null &&  publisherCount >0){
			int pageNo = publisherCount % 10;
			int pages = 0;
			if(pageNo == 0){
				pages = publisherCount/10;
			}else{
				pages = publisherCount/10 + 1;
			}
			for(int i=1; i<=pages;i++){%>
				<li><a href="pagePublishers?pageNo=<%=i%>"><%=i %></a></li>
			<%}
			
		} %>
		<li>
      		<a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
	</ul>
</nav>



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
				for (Publisher p : publishers) {
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