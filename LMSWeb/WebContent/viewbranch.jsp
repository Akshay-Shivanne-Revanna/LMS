<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.gcit.lms.entity.Author"%>
<%@ page import="com.gcit.lms.entity.Branch"%>
<%@ page import="com.gcit.lms.entity.Book"%>
<%@ page import="com.gcit.lms.service.AdministratorService"%>
<%@ include file="include.html"%>
<%
	AdministratorService service = new AdministratorService();
   		List<Branch> branch = service.getAllBranches();
%>



<script type="text/javascript">
function deleteBranch(branchId){
	$.ajax({
		  url: "deleteBranch",
		  data:{
			  branchId: branchId
		  }
		}).done(function(data) {
		  $('#branchTable').html(data);
		});
}

</script>

<title>LMS</title>

<h2>Welcome to GCIT Library Management System - Admin</h2>
${result}
<div class="row">
	<div class="col-md-6">

		<table border="2" id="branchTable" class="table">
			<tr>
				<th>Branch Name</th>
				<th>Branch Address</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>




			<%
				for (Branch br : branch) {
			%>
			<tr>
				<td>
					<%
						out.println(br.getBranchName());
					%>
				</td>
				<td>
					<%
						out.println(br.getBranchAddress());
					%>
				</td>


				<td align="center"><button type="button"
						class="btn btn btn-primary" data-toggle="modal"
						data-target="#myModal1"
						href="editbranch.jsp?branchId=<%=br.getBranchId()%>">EDIT</button></td>

				<td><button type="button" class="btn btn-danger"
						onclick="deleteBranch(<%=br.getBranchId()%>)">DELETE</button>
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