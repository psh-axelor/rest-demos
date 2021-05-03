package com.axelor.app;

import java.io.IOException;
import java.util.ArrayList;

import javax.inject.Singleton;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;

import com.axelor.app.db.Address;
import com.axelor.app.db.Contact;
import com.axelor.app.db.Mobile;
import com.google.inject.Inject;

@Path("contact")
@Singleton
public class ContactResources {

	ArrayList<Contact> cont = new ArrayList<>();

	@Inject
	private ContactService contact;
	
	@POST
	@Path("/insert")
	public void insert(@Context HttpServletRequest req, @Context HttpServletResponse res) throws IOException {
		
		String fname=req.getParameter("first_name");
		String lname=req.getParameter("last_name");
		String city=req.getParameter("city_name");
		String state=req.getParameter("state_name");
		String mobile=req.getParameter("mobile_num");
		
		Contact c = new Contact(fname,lname);		
		c.getAddress().add(new Address(city,state));
		c.getMobile().add(new Mobile(Long.parseLong(mobile)));
		
		contact.Insert(c);

		res.sendRedirect("show");
	}

	@POST
	@Path("/delete")
	public void delete(@Context HttpServletRequest req, @Context HttpServletResponse res) throws IOException {
		
		int id = Integer.parseInt(req.getParameter("id_d"));
		
		contact.Delete(id);

		res.sendRedirect("show");
	}
	
	@POST
	@Path("/update")
	public void update(@Context HttpServletRequest req, @Context HttpServletResponse res) throws IOException, ServletException {
		
		String fname=req.getParameter("first_name_u");
		String lname=req.getParameter("last_name_u"); 
		String mobile=req.getParameter("mobile_num_u");
		String cname=req.getParameter("city_name_u");
		String sname=req.getParameter("state_name_u");
		
		Contact c = new Contact(fname,lname);
		c.setId(Integer.parseInt(req.getParameter("id_u")));
		c.getAddress().add(new Address(cname,sname));
		c.getMobile().add(new Mobile(Long.parseLong(mobile)));
		
		contact.Update(c);

		res.sendRedirect("show");
	}

	@POST
	@Path("/search")
	public void search(@Context HttpServletRequest req, @Context HttpServletResponse res)
			throws ServletException, IOException {
		
		String name = req.getParameter("name_s");
		
		cont = contact.Search(name);

		req.setAttribute("searchedContacts", cont);
		req.getRequestDispatcher("../show_search.jsp").forward(req, res);
	}

	@GET
	@Path("/show")
	public void show(@Context HttpServletRequest req, @Context HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setAttribute("showContacts", contact.Show());
		req.getRequestDispatcher("../show_all.jsp").forward(req, res);
	}
	
	@POST
	@Path("/insertnew")
	public void insertnew(@Context HttpServletRequest req, @Context HttpServletResponse res) throws IOException {
		
		String newmobile=req.getParameter("mobile_new");
		String fname=req.getParameter("first_name_n");
		String lname=req.getParameter("last_name_n"); 
		String mobile=req.getParameter("mobile_num_n");
		String cname=req.getParameter("city_name_n");
		String sname=req.getParameter("state_name_n");
		
		Contact c = new Contact(fname,lname);
		c.setId(Integer.parseInt(req.getParameter("id_n")));
		c.getAddress().add(new Address(cname,sname));
		c.getMobile().add(new Mobile(Long.parseLong(mobile)));
		c.getMobile().add(new Mobile(Long.parseLong(newmobile)));
		
		contact.Update(c);

		res.sendRedirect("show");
	}
}
