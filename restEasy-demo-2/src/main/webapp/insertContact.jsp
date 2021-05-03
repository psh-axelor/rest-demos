<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Cache-Conrtol"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Exipres" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
			function checkvalidation() {
				var firstName=document.forms["contactbook"]["firstname"].value;
				var lastName=document.forms["contactbook"]["lastname"].value;
				var mobno=document.forms["contactbook"]["mobno"].value;
				var email=document.forms["contactbook"]["email"].value;
				
				return true;
			}
		</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<center>
		<h1>Insert contact in Contact Book</h1>
		<form name="contactbook"
			action="<%=request.getContextPath()%>/contact/insert" method="POST">
			<table>
				<tr>
					<th colspan="2"><h2>Insert data</h2></th>
				</tr>
				<tr>
					<td><label>First Name: </label></td>
					<td><input type="text" id="firstname" name="firstname"
						pattern="[A-Za-z]{3,}" title="Atleast 3 characters"></td>
				</tr>
				<tr>
					<td><label>Last Name:</label></td>
					<td><input type="text" id="lastname" name="lastname" required></td>
				</tr>
				<tr>
					<td><label>Mobile: </label></td>
					<td><input type="text" id="mobno" name="mobno"
						pattern="(?=.*\d).{10}"
						title="Mobile no. should be of 10 digits... Considering India by default"></td>
				</tr>
				<tr>
					<td><label>Email: </label></td>
					<td><input type="text" id="email" name="email"
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$"
						title="email@gmail.com"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Submit"></td>
					<td><input type="Reset" value="Reset"></td>
			</table>
		</form>
		<br> <br> <a href="searchContact.jsp"><button>Search
				Contacts</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="goBack()">Back</button>
		<script>
				function goBack() {
				    window.history.back();
				}
			</script>
	</center>
</body>
</html>
