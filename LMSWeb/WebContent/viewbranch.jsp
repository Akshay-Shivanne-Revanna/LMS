<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Author" %>
    <%@ page import="com.gcit.lms.entity.Branch" %>
    <%@ page import="com.gcit.lms.entity.Book" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <% 
    	AdministratorService service = new AdministratorService();
   		List<Branch> branch = service.getAllBranches();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
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
		<th>Branch Name</th>
		<th>Branch Address</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
		
		
	
	
		<%for (Branch br: branch){ %>
		<tr>
		<td><% out.println(br.getBranchName()); %></td>
		<td><%out.println(br.getBranchAddress()); %></td>
		
		
		<td><button type="button" onclick="javascript:location.href='editBranch?branchId=<%=br.getBranchId() %>'">EDIT</button>
		<td><button type="button" onclick="deleteBranch(<%=br.getBranchId() %>)">DELETE</button>
		</tr>
		<%} %>
		
	

</table>

</body>
</html>