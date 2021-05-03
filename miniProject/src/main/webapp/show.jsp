<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.axelor.app.db.Contact"%>  
<% 
    String contextpath=request.getContextPath();
    String path="/contact/show";
    response.sendRedirect(contextpath+path);
%>

<html>
<head>
<title>Show Address Book</title>
</head>

<body>
	<center>

		<h2>Show Address Book</h2>
		<form action="<%=request.getContextPath()%>/contact/show"
			method="POST">
			<input type="submit" value="Show">
		</form>

	</center>
</body>

</html>