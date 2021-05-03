package com.axelor.app;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Context;

import com.axelor.app.db.Contact;
import com.google.inject.Inject;
import com.google.inject.Singleton;

@Singleton
@Path("contact")
public class ContactResources {

	@Inject
	ContactService contactService;

	@POST
	@Path("/insert")
	public void Insert(@Context HttpServletRequest request, @Context HttpServletResponse response)
			throws IOException, ServletException {
		System.err.println(request.getParameter("firstname"));
		Contact contact = new Contact(request.getParameter("firstname"), request.getParameter("lastname"),
				Long.parseLong(request.getParameter("mobno")), request.getParameter("email"));
		contactService.Insert(contact);
		response.sendRedirect("show");
	}

	@POST
	@Path("/search")
	public void Search(@Context HttpServletRequest request, @Context HttpServletResponse response)
			throws IOException, ServletException {

		String searchfirstName = request.getParameter("searchfirstName");
		request.setAttribute("allContacts", contactService.Search(searchfirstName));
		request.getRequestDispatcher("../searchContact.jsp").forward(request, response);
	}

	@GET
	@Path("/show")
	public void Show(@Context HttpServletRequest request, @Context HttpServletResponse response)
			throws IOException, ServletException {

		request.setAttribute("allContacts", contactService.Show());
		request.getRequestDispatcher("../home.jsp").forward(request, response);
	}

	@GET
	@Path("/delete/{id}")
	public void Delete(@PathParam("id") Integer id, @Context HttpServletRequest request,
			@Context HttpServletResponse response) throws IOException, ServletException {

		contactService.Delete(id);
		response.sendRedirect("../show");
	}

	@GET
	@Path("/fetch/{id}")
	public void fetchdata(@PathParam("id") Integer id, @Context HttpServletRequest request,
			@Context HttpServletResponse response) throws IOException, ServletException {

		request.setAttribute("id", contactService.fetchData(id).get(0).getId());
		request.setAttribute("firstname", contactService.fetchData(id).get(0).getFirstName());
		request.setAttribute("lastname", contactService.fetchData(id).get(0).getLastName());
		request.setAttribute("mobno", contactService.fetchData(id).get(0).getMobno());
		request.setAttribute("email", contactService.fetchData(id).get(0).getEmail());
		request.getRequestDispatcher("../../updateContact.jsp").forward(request, response);
	}

	@POST
	@Path("/update/{id}")
	public void Update(@PathParam("id") Integer id, @Context HttpServletRequest request,
			@Context HttpServletResponse response) throws IOException, ServletException {
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		Long mobno = Long.parseLong(request.getParameter("mobno"));

		contactService.Update(id, firstname, lastname, mobno, email);
		response.sendRedirect("../show");
	}
}
