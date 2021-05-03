package com.axelor.app;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

import com.axelor.app.db.Contact;
import com.google.inject.Inject;

@Path("contact")
public class ContactResources {

	@Inject
	ContactService contactService;

	@GET
	@Path("insert")
	public void insert() {
		System.out.println("Insert record..");
		contactService.insert(new Contact((long) 2, "Prerak", "Shah"));
	}
}
