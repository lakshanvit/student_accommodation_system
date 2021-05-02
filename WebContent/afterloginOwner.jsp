
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
<title>Welcome Owner</title>
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
	
 
  
  <div class="row">
    <div class="col-sm-6 col-sm-push-6" style="background-color:lavender;">
    <h2>Your Available Property</h2>
<table align="center" cellpadding="5" cellspacing="5" border="1" width="500">

<tr bgcolor="#100F0F" align="center">
<td><b> <font color="#fff">Property Id</b></td>
<td><b><font color="#fff">Address</b></td>
<td><b><font color="#fff">Type</b></td>
<td><b><font color="#fff">Number of tenants</b></td>
<td><b><font color="#fff">Rent</b></td>

</tr>
<%
try{ 
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sas", "root", "123");
	Statement st=conn.createStatement();
	String em=request.getParameter("email");

	
	ResultSet rs = st.executeQuery("select property_id,p_address,type,number_of_tenance,rent from property where status='Available' and Email='"+em+"'");
	
while(rs.next()){
	
%>
<tr align="center" bgcolor="#fff">

<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>

</tr>

<% 
}
conn.close();
} catch (Exception e) {
    
e.printStackTrace();
}
%>
</table>
    
<br>



 <form action="Property" method="get">  
 	   <div  >
     <input type="text"  id="email" name ="pemail" value="<%= request.getParameter("email") %>" style="display:none"  readonly>
   </div> 
    <div class="form-group">
      <label for="set">Enter the Property id you wish to make unavailable</label>
      <input type="text" class="form-control" id="pid" placeholder="Enter Property Id" name="pid">
    </div>
   <button type="submit" class="btn btn-default" value="SET">SET</button><br>
</form>	
    </div>  
        <div class="col-sm-6 col-sm-pull-6" style="background-color:lavenderblush;">
		<h2>Add Property</h2>
		<form action="Property" method="post">

    <div class="form-group">
      <label for="address">Property address:</label>
      <input type="text" class="form-control" id="adr" placeholder="Enter Address" name="adrs">
    </div>
        <div class="form-group">
      <label for="type">Type:</label>
      <input type="text" class="form-control" id="type" placeholder=" Flat, terraced house, detached house...etc" name="types">
    </div>
    <div class="form-group">
      <label for="tenant">No of tenant:</label>
      <input type="text" class="form-control" id="tenant" placeholder="Enter No of tenants" name="tenants">
    </div>
        <div class="form-group">
      <label for="rent">Rent:</label>
      <input type="text" class="form-control" id="fee" placeholder="Enter Rent of the property " name="rent">
    </div>
        
    <div class="form-group">
      <label for="tel">Telephone:</label>
      <input type="text" class="form-control" id="tel" placeholder="Enter Telephone Number" name="tel">
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="text" class="form-control" id="email" value="${sessionScope.email}" name="email">
    </div>
    
    <div class="help-block">RS.1000 will be charged for every property you add</div>



    <button type="submit" class="btn btn-default" value="REGISTER">Submit</button><br>
  </form>
    </div>
  </div>
 
</div>
	
	
	
</body>
</html>



