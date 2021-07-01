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

<form action = 'LoginController' method = 'post' > 
	
		<h1> Restaurant Login </h1>
		<br> Enter user id <input type = 'text' name = 'userid' placeHolder = 'user id' required = 'required'/>
		<br> Enter user password <input type = 'password' name = 'password' required = 'required'/>
		
		<br> <input type = 'submit' value = 'Login'>
		
		<input type= 'hidden' name = 'h1' value = 'Login'>  
		
	</form>
	
	<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "restaurant";
String userId = "root";
String password = "Pass@123";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Show Branches Available</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>Branch Id</b></td>
<td><b>Branch City</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT bid, city FROM branch";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("bid") %></td>
<td><%=resultSet.getString("city") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
	

</body>
</html>