<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.gcit.lms.entity.Publisher"%>
<%@ page import="com.gcit.lms.service.AdministratorService"%>

<%
	AdministratorService adminService = new AdministratorService();
	String publisherId = request.getParameter("publisherId");
	Publisher publisher = adminService.getPublisherByID(Integer.parseInt(publisherId));
%>


<title>LMS</title>
<div class="modal-body">
	<h3>Edit publisher Details Below:</h3>
	${result}
	<form action="updatePublisher" method="post">
		<br />
		<br /> Publisher Name: <input type="text" name="publisherName"
			value="<%=publisher.getPublisherName()%>"> <br />
		<br />
		<br /> Publisher Address:<input type="text" name="publisherAddress"
			value="<%=publisher.getPublisherAddress()%>"> <br />
		<br />
		<br /> Publisher Phone:<input type="text" name="publisherPhone"
			value="<%=publisher.getPublisherPhone()%>"> <br />
		<br />
		<br /> <input type="hidden" name="publisherId"
			value=<%=publisher.getPublisherId()%>> Submit :
		<button type="submit">Edit Publisher</button>
	</form>
</div>