<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
     <%@ page import= "com.google.appengine.api.datastore.DatastoreService" %>
     <%@ page import= "com.google.appengine.api.datastore.DatastoreServiceFactory" %>
     <%@ page import= "com.google.appengine.api.datastore.Query" %>
     <%@ page import=  "com.google.appengine.api.datastore.FetchOptions" %>
     
    <%@page import= "com.google.appengine.api.datastore.PreparedQuery" %> 
     
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show contacts</title>
<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

tr:hover {background-color:#f5f5f5;}
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
<br>
	<table id="customers">
		
			<tr>
    <th>FirstName</th>
    <th>LastName</th>
    <th>Gender</th>
    <th>Phone Number</th>
    <th>Email</th>
    <th>Address</th>
  </tr>
			
		<%
		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("Contact");
		PreparedQuery pq = datastore.prepare(q);
		List<Entity> customers = datastore.prepare(q).asList(FetchOptions.Builder.withLimit(10));
	    
	
		    for(Entity e : customers){

		%>
			<tr>
			  <td><%=e.getProperty("FirstName") %></td>
			  <td><%=e.getProperty("LastName") %></td>
			  <td><%=e.getProperty("Gender") %></td>
			  <td><%=e.getProperty("PhoneNumber") %></td>
			  <td><%=e.getProperty("Email") %></td>
			  <td><%=e.getProperty("Address") %></td>
			  
			</tr>
		<%
			}
		%>
	</table>

</body>
</html>