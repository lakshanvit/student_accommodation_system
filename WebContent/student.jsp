<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Student Register</title>

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
      <li class="dropdown active">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Register
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="student.jsp">Student</a></li>
          <li><a href="owner.jsp">Property Owner</a></li>
        </ul>
      </li>
      <li><a href="login.jsp">Login</a></li>

     <li class="nav navbar-nav index"><a href="registered_stu.jsp">Registered Student</a></li>     
    </ul>
  </div>
</nav>

<div class="container">
  <h2>Student Registration</h2>
  <form action="Registration" method="post">
    <div class="form-group">
      <label for="studentid">Student ID:</label>
      <input type="text" class="form-control" id="sid" placeholder="Enter Student ID" name="student_ID">
    </div>
    <div class="form-group">
      <label for="fname">First Name:</label>
      <input type="text" class="form-control" id="fn" placeholder="Enter First Name" name="frname">
    </div>
    <div class="form-group">
      <label for="lname">Last Name:</label>
      <input type="text" class="form-control" id="ln" placeholder="Enter Last Name" name="lstname">
    </div>
    <div class="form-group">
      <label for="address">Address:</label>
      <input type="text" class="form-control" id="adr" placeholder="Enter Address" name="adrs">
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email">
    </div>
    <div class="form-group">
      <label for="tel">Telephone:</label>
      <input type="text" class="form-control" id="tel" placeholder="Enter Telephone Number" name="tel">
    </div>
    <div class="form-group">
      <label for="pass">Password:</label>
      <input type="password" class="form-control" id="pass" placeholder="Enter Password" name="pass">
    </div>
    <div class="help-block">Password should not be more than 8 characters</div>
    


    <button type="submit" class="btn btn-default" value="REGISTER">Submit</button>
  </form>
</div>

</body>