<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.axelor.app.db.Contact"%>
<%@page import="com.axelor.app.db.Address"%>
<%@page import="com.axelor.app.db.Mobile"%>

<html>
<head>
<title>Contact Book</title>
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
		<br><h1>Contact Book Application</h1>
		<br><h2>Search Contact</h2>
		<form action="<%=request.getContextPath()%>/contact/search"
			method="POST">
			First Name / Last Name: <input type="text" name="name_s"> <input
				type="submit" value="Search">
		</form>

		<br><h2>Contact Database</h2> 
		<a href="../insert.jsp">Create New Contact</a><br> <br>

		<table align="center" border="1">
			<form>
				<tr>
					<th>Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Mobile Number</th>
					<th>City</th>
					<th>State</th>
					<th>Update Contact</th>
					<th>Remove Contact</th>
				</tr>
				<%
					ArrayList<?> x = (ArrayList<?>)request.getAttribute("showContacts");
					for (int i=0;i<x.size();i++) {
							
							Object[] row = (Object[])x.get(i);
				            Contact con = (Contact)row[0];
				            Address add = (Address)row[1];
				            Mobile mob = (Mobile)row[2];
						
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
						out.print(mob.getMobileno());
						out.print("</td>");
						
						out.print("<td>");
				       	out.print(add.getCityName());
						out.print("</td>");
						
						out.print("<td>");
						out.print(add.getStateName());
						out.print("</td>");

						out.print("<td>");
				%>
						<a href="../update.jsp?id=<%=con.getId()%>&fname=<%=con.getFirstName()%>&lname=<%=con.getLastname()%>&mnum=<%=mob.getMobileno()%>&cname=<%=add.getCityName()%>&sname=<%=add.getStateName()%>">Update</a>
				<%
						out.print("</td>");
						out.print("<td>");
				%>
						<a href="../delete.jsp?id=<%=con.getId()%>&fname=<%=con.getFirstName()%>&lname=<%=con.getLastname()%>&cname=<%=add.getCityName()%>&sname=<%=add.getStateName()%>">Remove</a>
				<%
						out.print("</td>");
						out.print("</tr>");
					}
				%>
			
		</table>

<!-- 		<br /> <br /> <INPUT TYPE="button" onClick="location.reload()"
			VALUE="Refresh"> -->

		</form>

		<br> <br> <br> <br>
		<p>
			© 2018 <b>Contact Book Application</b>. All rights reserved | <b>Axelor Technologies India Pvt. Ltd., Surat.</b>
		</p>
	</center>
</body>
</html>