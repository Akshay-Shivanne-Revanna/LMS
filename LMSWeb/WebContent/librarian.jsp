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
    	AdministratorService service = new AdministratorService();
    	List<Branch> branch = service.getAllBranches();
     %>

<title>LMS</title>
<h2>Welcome to GCIT Library Management System - Librarian</h2>
<h3>Enter Author Details Below:</h3>

${result}

	<form action="selectBranch" method="post">
	
		Select Branch you Manage :
		
		<select name="branchId">
			<%for(Branch b: branch){ %>
			<option value="<%=b.getBranchId()%>"><%=b.getBranchName() %></option>
			<%} %>
		</select>
		<br/>
		<br/>
		<button type="submit">Select Branch</button>
	</form>
