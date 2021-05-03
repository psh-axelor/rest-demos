<html>
<head>
<title>Insert New Number</title>
</head>

<body>
	<center>
		<br><br>
		<h2>Insert New Number</h2>
		<form action="<%=request.getContextPath()%>/contact/insertnew"
			method="POST">
			Id: <input type="number" name="id_n"
				value="<%=request.getParameter("id_u")%>" readonly="readonly"><br><br>
			New Mobile: <input type="text" name="mobile_new"> <br /><br />			
			
			<h4>-- Contact Data --</h4>
			First Name: <input type="text" name="first_name_n" value="<%=request.getParameter("first_name_u")%>" readonly="readonly"><br>
			<br> Last Name: <input type="text" name="last_name_n" value="<%=request.getParameter("last_name_u")%>" readonly="readonly"> <br>
			<br> Mobile: <input type="text" name="mobile_num_n" value="<%=request.getParameter("mobile_num_u")%>" readonly="readonly"> <br>
			<br> City: <input type="text" name="city_name_n" value="<%=request.getParameter("city_name_u")%>" readonly="readonly"> <br>
			<br> State: <input type="text" name="state_name_n" value="<%=request.getParameter("state_name_u")%>" readonly="readonly"> <br><br>
			
			<br /> <input type="submit" value="Insert" />
			<button type="submit" formaction="show.jsp">Cancel</button>
		</form>
	</center>
</body>

</html>