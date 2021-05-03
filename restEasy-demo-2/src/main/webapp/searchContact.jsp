<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.axelor.app.db.Contact"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Cache-Conrtol"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Exipres" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Contacts</title>
<link rel="icon" type="image/x-icon"
	href="../assets/images/Address-Book-icon.ico">
<link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<center>
		<form action="<%=request.getContextPath()%>/contact/search"
			method="POST">

			<h2 style="border: 2px solid; border-color: blue;">Search
				Contacts</h2>

			<table border="1" align="center" title="Contacts List"
				style="text-align: center; color: blue;">
				<tr>
					<th colspan="2">Search Contact:</th>
					<td colspan="3"><input type="text" name="searchfirstName"
						placeholder="Enter Name to search contact" required="required"></td>
					<td colspan="2"><input type="submit" value="Search"
						style="width: 200px"></td>
				</tr>
				<% if(request.getAttribute("allContacts")!=null) {
							List<Contact> contact= (ArrayList<Contact>)request.getAttribute("allContacts");
							%>
				<tr>
					<th>Id</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>MobileNo</th>
					<th>Email-Id</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
				<%
							for(Contact cont : contact) {
								
								out.print("<tr>");
								
								out.print("<td>");
								out.print(cont.getId());
								out.print("</td>");
							
								out.print("<td>");
								out.print(cont.getFirstName());
								out.print("</td>");
								
								out.print("<td>");
								out.print(cont.getLastName());
								out.print("</td>");
								
								out.print("<td>");
								out.print(cont.getMobno());
								out.print("</td>");
								
								out.print("<td>");
								out.print(cont.getEmail());
								out.print("</td>");
								
								out.print("<td>");%>
				<a href="fetch/<%=cont.getId()%>">Update</a>
				<%out.print("</td>");
								
								out.print("<td>");%>
				<a href="delete/<%=cont.getId()%>">Delete</a>
				<%out.print("</td>");
								
								out.print("</tr>");
							}
						}%>
			</table>
			<br>
			<br>
			<button onclick="goBack()">Back</button>
			<script>
							function goBack() {
							    window.history.back();
							}
						</script>
		</form>
	</center>
</body>
</html>
