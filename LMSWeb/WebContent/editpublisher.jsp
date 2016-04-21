<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.gcit.lms.entity.Publisher" %>
    <%@ include file="include.html" %>
    <%@ page import="com.gcit.lms.service.AdministratorService" %>
    <%Publisher publisher = null;
    if(request.getAttribute("publisher")!=null){
    	publisher = (Publisher)request.getAttribute("publisher");
    	}%>
    

<title>LMS</title>
<link href="main.css" rel="stylesheet" type="text/css" media="screen">
<h2>Welcome to GCIT Library Management System - Admin</h2>
<h3>Edit publisher Details Below:</h3>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>

${result}

	<form action="updatePublisher" method="post">
	<br/><br/>
		Publisher Name: <input type="text" name="publisherName" value="<%=publisher.getPublisherName() %>"> <br /><br/><br/>
		Publisher Address:<input type="text" name="publisherAddress" value="<%=publisher.getPublisherAddress() %>"> <br /><br/><br/>
		Publisher Phone:<input type="text" name="publisherPhone" value="<%=publisher.getPublisherPhone() %>"> <br /><br/><br/>
		<input type="hidden" name="publisherId" value=<%=publisher.getPublisherId() %>>
		Submit :<button type="submit">Edit Publisher</button>
	</form>
