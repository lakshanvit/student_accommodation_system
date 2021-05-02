<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");



try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<html lang="en">

<head>
  <title>Registered Student</title>


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
      <a class="navbar-brand" href="#" style="font-size: 20pt;">Student Accomodation System</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li class="nav navbar-nav index"><a href="index.html">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Register
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="student.jsp">Student</a></li>
          <li><a href="owner.jsp">Property owner</a></li>
          
        </ul>
      </li>
      <li class="nav navbar-nav index"><a href="login.jsp">Login</a></li>
		<li class="active"><a href="index.html">Registered Student</a></li>
           
    </ul>
  </div>
</nav>
<div class="container">
<h2>Registered Student</h2>

<table align="center" cellpadding="5" cellspacing="5" border="1" width="800" height="150">

<tr bgcolor="#100F0F" align="center">
<td><b> <font color="#fff">Student_id</b></td>
<td><b><font color="#fff">Name</b></td>
<td><b><font color="#fff">Email</b></td>
<td><b><font color="#fff">Telephone</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas","root","123");
statement=connection.createStatement();
String sql ="SELECT * FROM student";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr align="center">

<td><%=resultSet.getString("student_id") %></td>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getInt("telephone") %></td>


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