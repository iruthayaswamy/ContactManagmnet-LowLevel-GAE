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
<title>Insert title here</title>
</head>
<body>

	<h2>Contacts</h2>
	<table border="1">
		<thead>
			<tr>
				<td>FirstName</td>
				<td>LastName</td>
				<td>Gender</td>
				<td>Phone Number</td>
				<td>Email</td>
				<td>Address</td>
			</tr>
			
		</thead>
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