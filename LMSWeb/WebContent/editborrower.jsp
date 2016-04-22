<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Borrower" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
     
   
	<%AdministratorService adminService = new AdministratorService();
 	String cardNo = request.getParameter("cardNo");
	Borrower borrower = adminService.getBorrowerByID(Integer.parseInt(cardNo));
%>

<title>LMS</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<div class="modal-body">
${result}

<h2>Welcome to GCIT Library Management System - Admin</h2>
<h3>Edit Borrower Details Below:</h3>
	<form action="updateBorrower" method="post">
		Borrower Name: <input type="text" name="borrowerName" value="<%=borrower.getName() %>"> <br /><br /><br />
		Borrower Address:<input type="text" name="borrowerAddress" value="<%=borrower.getAddress() %>"> <br /><br /><br />
		Borrower phone : <input type="text" name="borrowerPhone" value="<%=borrower.getPhone() %>"> <br /><br /><br />
		<input type="hidden" name="cardNo" value=<%=borrower.getCardNo() %>>
		Submit :<button type="submit">Edit Borrower</button>
	</form>
</div>