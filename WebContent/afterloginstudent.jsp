<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%




try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Student</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" style="font-size: 20pt;">Welcome ${sessionScope.email}</a>
    </div>
        <ul class="nav navbar-nav navbar-right">
      <li class="nav navbar-nav index"><a href="login.jsp">Logout</a></li>
                
    </ul>
    
  </div>
</nav>
	
	
 
  <div class="container">
<h2>Available Properties</h2>

<table align="center" cellpadding="5" cellspacing="5" border="1" width="800" height="60">

<tr bgcolor="#100F0F" align="center">
<td><b> <font color="#fff">Property Address</b></td>
<td><b><font color="#fff">Type</b></td>
<td><b><font color="#fff">No of tenants</b></td>
<td><b><font color="#fff">Rent</b></td>
<td><b><font color="#fff">Telephone</b></td>
<td><b><font color="#fff">Email</b></td>
</tr>
<%
String av ="Available";
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas","root","123");
statement=connection.createStatement();
String sql ="SELECT * FROM property where status='"+av+"'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr align="center">

<td><%=resultSet.getString("P_address") %></td>
<td><%=resultSet.getString("type") %></td>
<td><%=resultSet.getString("number_of_tenance") %></td>
<td><%=resultSet.getFloat("rent") %></td>
<td><%=resultSet.getInt("owner_telephone") %></td>
<td><%=resultSet.getString("Email") %></td>


</tr>

<% 
}
connection.close();
} catch (Exception e) {
	
e.printStackTrace();
}
%>
</table>
</div>
  
  

	
	
	
</body>
</html>



