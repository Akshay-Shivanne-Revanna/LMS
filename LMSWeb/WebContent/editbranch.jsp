<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.gcit.lms.entity.Branch"%>
<%@ page import="com.gcit.lms.service.AdministratorService"%>

<%
	AdministratorService adminService = new AdministratorService();
	String branchId = request.getParameter("branchId");
	Branch branch = adminService.getBranchByID(Integer
			.parseInt(branchId));
%>

<div class="modal-body">

	<h3>Edit Branch Details Below:</h3>

	${result}

	<form action="updateBranch" method="post">
		Branch Name: <input type="text" name="branchName"
			value="<%=branch.getBranchName()%>"> <br />
		<br />
		<br /> Branch Address:<input type="text" name="branchAddress"
			value="<%=branch.getBranchAddress()%>"> <br />
		<br />
		<br /> <input type="hidden" name="branchId"
			value=<%=branch.getBranchId()%>> Submit :
		<button type="submit">Edit Branch</button>
	</form>
</div>