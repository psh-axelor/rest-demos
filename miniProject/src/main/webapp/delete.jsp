<html>
<head>
<title>Remove Contact</title>
</head>

<body>
	<center>
		<br><br>
		<h2>Remove Contact Confirmation</h2>
		<form action="<%=request.getContextPath()%>/contact/delete"
			method="POST">
			Id: <input type="number" name="id_d"
				value="<%=request.getParameter("id")%>" readonly="readonly">
			<br /><br>
			<h4>-- Contact Info --</h4>
			First Name:
			<%=request.getParameter("fname")%>
			<br /> Last Name:
			<%=request.getParameter("lname")%>
			<br /> City:
			<%=request.getParameter("cname")%>
			<br /> State:
			<%=request.getParameter("sname")%>
			<br />
			<br /> <input type="submit" value="Remove" />
			<button type="submit" formaction="show.jsp">Cancel</button>
		</form>

	</center>
</body>

</html>