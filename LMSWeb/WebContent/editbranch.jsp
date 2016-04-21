<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Branch" %>
    <%@ include file="include.html" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%Branch branch = null;
    if(request.getAttribute("branch")!=null){
    	branch = (Branch)request.getAttribute("branch");
    	}%>
    

<title>LMS</title>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<h2>Welcome to GCIT Library Management System - Admin</h2>
<h3>Edit Branch Details Below:</h3>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>

${result}

	<form action="updateBranch" method="post">
		Branch Name: <input type="text" name="branchName" value="<%=branch.getBranchName() %>"> <br /><br /><br />
		Branch Address:<input type="text" name="branchAddress" value="<%=branch.getBranchAddress() %>"> <br /><br /><br />
		
		<input type="hidden" name="branchId" value=<%=branch.getBranchId() %>>
		Submit :<button type="submit">Edit Branch</button>
	</form>
