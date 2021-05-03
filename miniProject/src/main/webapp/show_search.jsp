<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.axelor.app.db.Contact"%>

<html>
<head>
<title>Searched Contact Details</title>
<style>
table, th, td {
	border: 1px solid black;
	border-spacing: 5px;
	text-align: center;
}

th, td {
	padding: 8px;
}

table th {
	background-color: black;
	color: white;
}
</style>
</head>
<body>
	<center>
		<br><br>
		<h2>Searched Contact</h2>
		<table align="center" border="1">
			<form>
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Update Contact</th>
					<th>Remove Contact</th>
				</tr>
				<%
					for (Contact con : (ArrayList<Contact>) request.getAttribute("searchedContacts")) {

						out.print("<tr>");

						out.print("<td>");
						out.print(con.getId());
						out.print("</td>");

						out.print("<td>");
						out.print(con.getFirstName());
						out.print("</td>");

						out.print("<td>");
						out.print(con.getLastname());
						out.print("</td>");

						out.print("<td>");
				%>
				<a href="../update.jsp?id=<%=con.getId()%>&fname=<%=con.getFirstName()%>&lname=<%=con.getLastname()%>">Update</a>
				<%
					out.print("</td>");
					out.print("<td>");
				%>
				<a href="../delete.jsp?id=<%=con.getId()%>&fname=<%=con.getFirstName()%>&lname=<%=con.getLastname()%>">Remove</a>
				<%
					out.print("</td>");
					out.print("</tr>");
					}
				%>
			
		</table>
		<br>
		<form>
			<button type="submit" formaction="../show.jsp">Go back</button>
		</form>
	</center>
</body>
</html>