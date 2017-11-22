package com.work.contactapp.lla;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.labs.repackaged.org.json.JSONException;
import com.google.appengine.labs.repackaged.org.json.JSONObject;


@Controller
public class ContactApplicationServlet {

//	Entity customer = new Entity("Contact");

	@RequestMapping(value = "/add.ds", method = RequestMethod.POST)
	public void doPost(  HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, JSONException
	   {
		
		resp.setContentType("text/html");
		  PrintWriter out=resp.getWriter();
		  
		  String record=req.getParameter("data");
		  
		  JSONObject obj = new JSONObject(record);

		 
		 String firstName= obj.get("Fname").toString();
		 String lastName= obj.get("Lname").toString();
		 String gender= obj.get("Gender").toString();
		 String phone= obj.get("Phone").toString();
		 String mail= obj.get("Mail").toString();
		 String address= obj.get("Address").toString();
		 
		
//		 Key customerKey = KeyFactory.createKey("Customer", phone);
		 
		 Entity customer = new Entity("Contact");
		 
		 
		 DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			Query q = new Query("Contact");
			q.setFilter(new Query.FilterPredicate("PhoneNumber", FilterOperator.EQUAL, phone));

//			q.addFilter("FirstName", FilterOperator.EQUAL, search);
			PreparedQuery pq = datastore.prepare(q);
			List<Entity> customers =
                 datastore.prepare(q).asList(FetchOptions.Builder.withLimit(10));
			
			try{
				
				if(customers.isEmpty()){
					
					customer.setProperty("FirstName", firstName);
					 customer.setProperty("LastName", lastName);
					 customer.setProperty("Gender", gender);
					 customer.setProperty("PhoneNumber", phone);
					 customer.setProperty("Email", mail);
					 customer.setProperty("Address", address);
					 datastore.put(customer); 
					 out.println("Contact saved");
					
					
			    }  
			    else{  
			    	
			    	out.println("Sorry already Contact available with the same phone number");
				}
			}
			finally{
				
				
			}
		
	   }
	
	
	@RequestMapping(value = "search.ds", method = RequestMethod.POST)
	public void SearchClass(HttpServletRequest req, HttpServletResponse resp)throws IOException , ServletException, JSONException {

		resp.setContentType("text/html");
		  PrintWriter out=resp.getWriter();
		  
		  String record=req.getParameter("data");
		  
		  JSONObject obj = new JSONObject(record);

		 
		 String search= obj.get("Search").toString();
		 
		 DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			Query q = new Query("Contact");
			q.setFilter(new Query.FilterPredicate("FirstName", FilterOperator.EQUAL, search));

//			q.addFilter("FirstName", FilterOperator.EQUAL, search);
			PreparedQuery pq = datastore.prepare(q);
			List<Entity> customers =
                    datastore.prepare(q).asList(FetchOptions.Builder.withLimit(10));
			
			try{
				
				if(!customers.isEmpty()){
					
					out.println("Contact found");
			    }  
			    else{  
			    	out.println("No Contact found");  
				}
			}
			finally{
				
				
			}
		 
		 
	}
	
	@RequestMapping(value = "update.ds", method = RequestMethod.POST)
	public void UpdateClass(HttpServletRequest req, HttpServletResponse resp)throws IOException , ServletException, JSONException {

		resp.setContentType("text/html");
		  PrintWriter out=resp.getWriter();
		  
		  String record=req.getParameter("data");
		  
		  JSONObject obj = new JSONObject(record);
		  
		  
		 
		  	 String firstName= obj.get("Fname").toString();
			 String lastName= obj.get("Lname").toString();
			 String gender= obj.get("Gender").toString();
			 String phone= obj.get("Phone").toString();
			 String mail= obj.get("Mail").toString();
			 String address= obj.get("Address").toString();

		 
			 	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
			 	
				Query q = new Query("Contact");
				q.setFilter(new Query.FilterPredicate("PhoneNumber", FilterOperator.EQUAL, phone));
				PreparedQuery pq = datastore.prepare(q);
				Entity customer = pq.asSingleEntity();
				List<Entity> customers =
	                 datastore.prepare(q).asList(FetchOptions.Builder.withLimit(10));
				
				try{
					
					if(!customers.isEmpty()){
						
						
						 customer.setProperty("FirstName", firstName);
						 customer.setProperty("LastName", lastName);
						 customer.setProperty("Gender", gender);
						 customer.setProperty("PhoneNumber", phone);
						 customer.setProperty("Email", mail);
						 customer.setProperty("Address", address);
						 datastore.put(customer); 
						 out.println("Contact updated");
						 
						
				    }  
				    else{  
				    	out.println("Sorry no contact found");
					}
				}
				finally{
					
					
				
			}

			 
    }
	
	
	@RequestMapping(value = "delete.ds", method = RequestMethod.POST)
	public void DeleteClass(HttpServletRequest req, HttpServletResponse resp)throws IOException , ServletException, JSONException {

			resp.setContentType("text/html");
			PrintWriter out=resp.getWriter();
		  
		  String record=req.getParameter("data");
		  JSONObject obj = new JSONObject(record);
		  
		  String delete= obj.get("Delete").toString();
		  
		  
		  DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		  Query q = new Query("Contact");
		  q.setFilter(new Query.FilterPredicate("PhoneNumber", FilterOperator.EQUAL, delete));

			
			PreparedQuery pq = datastore.prepare(q);
			List<Entity> customers =
                 datastore.prepare(q).asList(FetchOptions.Builder.withLimit(10));
			
			try{
				
				if(!customers.isEmpty()){
					
					datastore.delete(customers.get(0).getKey());
					 out.println("Contact deleted");
					 
					
			    }  
			    else{  
			    	
			    	out.println("Sorry no contact found");
				}
			}
			finally{
				
				
			
		}


	                

    }
    	
    }