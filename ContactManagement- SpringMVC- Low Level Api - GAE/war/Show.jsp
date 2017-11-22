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
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
</head>
<body>

	<h2>Contacts</h2>
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