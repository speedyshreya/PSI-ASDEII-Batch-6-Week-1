<%@page import="com.to.Customer"%>
<%@page import="com.to.Branch"%>
<%@page import= "java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="com.to.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login to the Restaurant Roster</title>
</head>
<body>
<%
		User user1 = (User) session.getAttribute("user");
		List<Branch> branches = null;
		if (request.getAttribute("branches") != null) {
			branches = (List<Branch>) request.getAttribute("branches");
		}
		int choice = 0;
		if (request.getAttribute("choice") != null) {
			choice = Integer.parseInt(request.getAttribute("choice").toString());
		}
		
		String message = null;
		
		if(request.getAttribute("message") != null) {
			message = request.getAttribute("message").toString();
		}
		
	%>

<form action = 'LoginController' method = 'post' > 
	
		<h1> Restaurant Login </h1>
		
		<br> Enter user id <input type = 'text' name = 'userid' placeHolder = 'user id' required = 'required'/>
		<br> Enter user password <input type = 'password' name = 'password' required = 'required'/>
		
		<br> <input type = 'submit' value = 'Login'> 
		
		<input type= 'hidden' name = 'h1' value = 'Login'> 
	</form>
	
		
		

	<div align="center">
	<h2>Don't have an account? Register yourself here!</h2> 
  <form action = 'LoginController' method='post'>
				<br> <h1>Enter your details </h1>
				
				<br> Customer id : <input type = 'text' name="cid" />
				<br> first name : <input type = 'text' name="firstname" />
				<br> last name : <input type = 'text' name="lastname" />
				<br> Phone number : <input type = 'text' name="phoneNo" />
				<br> Location (City) : <input type = 'text' name="city" />
				<br> DOB : <input type = 'date' name="dob" />
				<br> Password: <input type= 'password' name = "password"/>
				<input type = "hidden" name = 'h1' value = 'Register'>
				<input type ="submit" value = 'Insert' />
			</form>
			
			<%
				if(message != null) {
			
			%>		
			<h1><%= message %></h1>

			<%
				}
			%>
 </div>
 <div>
			<%
				if (branches != null) {
			%>
			<h2 align="center"><font><strong>Show Branches Available</strong></font></h2>
			<table border='1'>
				<tr>
					<th>Branch Id</th>
					<th>Branch city</th>
					<th>Table Capacity </th>
					<th>Current number of available tables</th>
				</tr>

				<%
					for (Branch branch : branches) {
				%>
				<tr>
					<td><%=branch.getBid()%></td>
					<td><%=branch.getCity()%></td>
					<td><%=branch.getTableCount()%></td>
					<td><%=branch.getAvailableTables()%></td>
				</tr>
				</table>
				</div>
	
              <%
					}
              %>
              <%
              
				}
              %>
              



</body>
</html>