<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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



</body>
</html>