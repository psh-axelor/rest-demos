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
<title>Contact Book</title>
<link rel="icon" type="image/x-icon"
	href="../assets/images/Address-Book-icon.ico">
<link rel="stylesheet" href="../assets/css/main.css">
</head>
<body>
	<%@include file="header.jsp"%>
	<center>
		<form action="<%=request.getContextPath()%>/contact/search"
			method="POST">
			<table align="center" border="1" align="center" title="Contacts List"
				style="text-align: center; color: blue;">
				<tr>
					<th colspan="2">Search Contact:</th>
					<td colspan="5"><input type="text" name="searchfirstName"
						placeholder="Enter Name to search contact" required="required">
						<input type="submit" style="width: 200px" value="Search">
					</td>
				</tr>
				<tr>
					<th colspan="7" style="font-size: 35px;" class="all">All
						Contacts</th>
				</tr>
				<tr>
					<th>Id</th>
					<th>FirstName</th>
					<th>LastName</th>
					<th>Mobile No.</th>
					<th>Email-Id</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				<% 
							if(request.getAttribute("allContacts")!=null) {
								List<Contact> contact= (ArrayList<Contact>)request.getAttribute("allContacts");
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
				<a href="fetch/<%=cont.getId()%>"><img
					src="../assets/images/edit.png" alt="Edit" title="Edit Contact"></a>
				<%out.print("</td>");
									
									out.print("<td>");%>
				<a href="delete/<%=cont.getId()%>"><img
					src="../assets/images/delete.png" alt="Delete"
					title="Delete Contact"></a>
				<%out.print("</td>");
									
									out.print("</tr>");
								}
								contact=null;
							}
						%>
			</table>
		</form>
		<br>
		<br> <a href="/insertContact.jsp"><button>Insert
				Contact</button></a>
	</center>
</body>
</html>
