<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.gcit.lms.entity.Author"%>
<%@ page import="com.gcit.lms.entity.Branch"%>
<%@ page import="com.gcit.lms.entity.Book"%>
<%@ include file="include.html" %>
<%@ page import="com.gcit.lms.service.AdministratorService"%>
<%
	AdministratorService adminService = new AdministratorService();
	String branchId = request.getParameter("branchId");
	Branch branch = adminService.getBranchByID(Integer.parseInt(branchId));
%>
<title>LMS</title>


<h4>Choose your task:</h4>
		
		<td><button type="button" onclick="javascript:location.href='selectBranch?branchId=<%=branch.getBranchId() %>'">EDIT NO OF COPIES</button>
		<br/><br/>
		<td><button type="button" onclick="javascript:location.href='libEditBranch?branchId=<%=branch.getBranchId() %>'">EDIT BRANCH DETAILS</button>
		
