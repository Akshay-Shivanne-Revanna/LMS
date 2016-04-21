<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.gcit.lms.entity.Branch"%>
<%@ page import="com.gcit.lms.service.AdministratorService"%>
<%@ include file="include.html" %>
<%
	AdministratorService service = new AdministratorService();
	List<Branch> branch = service.getAllBranches();
%>


<title>LMS</title>

<table border="2" id="branchTable">
	<tr>
		<th>Branch Name</th>
		<th>Edit</th>
		<th>Delete</th>
	</tr>
		<tr>
		<%for(Branch b: branch){%>
				<td><%out.println(b.getBranchName()); %></td>
		<td><button type="button" onclick="javascript:location.href='editBranch?branchId=<%=b.getBranchId()%>'">EDIT</button>
		<td><button type="button" onclick="javascript:location.href='deleteBranch?branchId=<%=b.getBranchId()%>'">DELETE</button>
		</tr>
		<%}%>
	</table>
