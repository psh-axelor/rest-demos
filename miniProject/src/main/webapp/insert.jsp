<html>
<head>
<title>Insert Contact</title>
</head>

<body>
	<center>
		<br><br>
		<h2>Insert Contact</h2>
		<form action="<%=request.getContextPath()%>/contact/insert"
			method="POST">
			First Name: <input type="text" name="first_name"> <br /><br />
			Last Name: <input type="text" name="last_name" /> <br /><br />
			Mobile: <input type="text" name="mobile_num"> <br /><br />
			City: <input type="text" name="city_name"> <br /><br />
			State: <input type="text" name="state_name" /> <br /><br />
			<br /> <input type="submit" value="Insert" />
			<button type="submit" formaction="show.jsp">Cancel</button>
		</form>

	</center>
</body>

</html>