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
    	List<Branch> branch = service.getAllBranches(1);
     %>

<title>LMS</title>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<h2>Welcome to GCIT Library Management System - Borrower</h2>
<h3>Select Branch Details Below:</h3>

${result}

<div class="row">
	<div class="col-md-6">
	<table border="2" id="branchbooksTable" class="table">
	<tr>
		<th>Branch Name</th>
		<th>Branch Address</th>
		<th>Select</th>
	</tr>
		
		<%for (Branch br: branch){ %>
		<tr>
		<td><% out.println(br.getBranchName()); %></td>
		<td><%out.println(br.getBranchAddress()); %></td>
		
		
		<td><button type="button" class="btn btn btn-primary" data-toggle="modal"
						data-target="#myModal1" onclick="javascript:location.href='borrowerBranch?branchId=<%=br.getBranchId()%>&cardNo=<%=cardNo%>'">SELECT</button>
		</tr>
		<%} %>
		
	

</table>
</div>
</div>
<br/><br/>
<div id="myModal1" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content"></div>
	</div>
</div>
