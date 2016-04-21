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
    	
   		Integer cardNo = null;
		if(request.getAttribute("cardNo")!=null){
			cardNo = (Integer)request.getAttribute("cardNo");
		}
    
    	AdministratorService service = new AdministratorService();
    	List<Branch> branch = service.getAllBranches();
     %>

<title>LMS</title>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<h2>Welcome to GCIT Library Management System - Borrower</h2>
<h3>Select Branch Details Below:</h3>

${result}

	<table border="2" id="branchbooksTable">
	<tr>
		<th>Branch Name</th>
		<th>Branch Address</th>
		<th>Select</th>
	</tr>
		
		<%for (Branch br: branch){ %>
		<tr>
		<td><% out.println(br.getBranchName()); %></td>
		<td><%out.println(br.getBranchAddress()); %></td>
		
		
		<td><button type="button" onclick="javascript:location.href='borrowerBranch?branchId=<%=br.getBranchId()%>&cardNo=<%=cardNo%>'">SELECT</button>
		</tr>
		<%} %>
		
	

</table>
<br/><br/>
<a href="borroweroptions.jsp">EXIT</a>
