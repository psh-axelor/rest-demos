<html>
<head>
<title>Update Contact</title>
</head>

<body>
	<center>
		<br><br>
		<h2>Update Contact</h2>
		<form action="<%=request.getContextPath()%>/contact/update"
			method="POST">
			Id: <input type="number" name="id_u"
				value="<%=request.getParameter("id")%>" readonly="readonly">
			<br><br>
			<h4>-- Update Record --</h4>
			First Name: <input type="text" name="first_name_u" value="<%=request.getParameter("fname")%>"><br>
			<br> Last Name: <input type="text" name="last_name_u" value="<%=request.getParameter("lname")%>"><br>
			<br> Mobile: <input type="text" name="mobile_num_u" value="<%=request.getParameter("mnum")%>"><br>
			<br> City: <input type="text" name="city_name_u" value="<%=request.getParameter("cname")%>"> <br>
			<br> State: <input type="text" name="state_name_u" value="<%=request.getParameter("sname")%>"> <br><br>
			<br> <input type="submit" value="Update">
			<button type="submit" formaction="insert_new.jsp">Add New Number</button><br>
			<br><button type="submit" formaction="show.jsp">Cancel</button><br>
		</form>
	</center>
</body>

</html>