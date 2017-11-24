<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Contact</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="val.js"></script>
<style>
input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}



input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>
<style>
body {margin:0;}

.navbar {
  overflow: hidden;
  background-color:#4CAF50;
  position: fixed;
  top: 0;
  width: 100%;
}

.navbar a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.main {
  padding: 16px;
  margin-top: 30px;
  height: 1500px; /* Used in this example to enable scrolling */
}
</style>
</head>
<body>

<div class="navbar">
  <a href="Add.jsp">Add Contact</a>
  <a href="Search.jsp">Search Contact</a>
  <a href="Update.jsp">Update Contact</a>
  <a href="Delete.jsp">Delete Contact</a>
  <a href="Show.jsp">Show Contact</a>
</div>
<br>
<br>
<br>

<div class="container">
 

    <label for="Search">Search</label>
    <input type="text" id="search" placeholder="Search by First name..">

    
    <input type="submit" id="sea" value="Search">
    
 
  
</div>

</body>
</html>
