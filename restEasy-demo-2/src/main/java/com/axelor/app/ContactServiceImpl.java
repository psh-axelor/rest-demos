package com.axelor.app;

import java.io.IOException;
import java.util.ArrayList;
import javax.persistence.EntityManager;
import com.axelor.app.db.Contact;
import com.google.inject.Inject;
import com.google.inject.persist.Transactional;

public class ContactServiceImpl implements ContactService {

	@Inject
	private EntityManager em;

	@Override
	@Transactional // INsert Query
	public void Insert(Contact c) {
		em.persist(c);
	}

	@Override
	@Transactional // Fetching data of particular id
	public ArrayList<Contact> fetchData(Integer id) {

		ArrayList<Contact> singlecontact = new ArrayList<>();
		try {
			singlecontact = (ArrayList<Contact>) em
					.createQuery("select c from Contact c where c.id = :id", Contact.class).setParameter("id", id)
					.getResultList();
		} catch (Exception e) {
		}
		return singlecontact;
	}

	@Override
	@Transactional // Update Query
	public void Update(Integer id, String firstname, String lastname, Long mobno, String email) {

		em.createQuery(
				"update Contact set firstName = :firstname, lastName = :lastname, mobno = :mobno, email = :email where id = :id")
				.setParameter("id", id).setParameter("firstname", firstname).setParameter("lastname", lastname)
				.setParameter("mobno", mobno).setParameter("email", email).executeUpdate();
	}

	@Override
	@Transactional // Delete Query
	public void Delete(Integer id) throws IOException {

		Contact contact = em.find(Contact.class, id);
		em.remove(contact);
	}

	@Override
	@Transactional // Show All Contacts
	public ArrayList<Contact> Show() {

		ArrayList<Contact> contacts = new ArrayList<>();
		try {
			contacts = (ArrayList<Contact>) em
					.createQuery("select allcontacts from Contact allcontacts order by allcontacts.id", Contact.class)
					.getResultList();
		} catch (Exception e) {
		}
		return contacts;
	}

	@Override
	@Transactional // Searching Data from first name or last name
	public ArrayList<Contact> Search(String search) {

		ArrayList<Contact> contacts = new ArrayList<>();
		try {
			contacts = (ArrayList<Contact>) em
					.createQuery("select c from Contact c where c.firstName=:name OR lastName=:name order by c.id",
							Contact.class)
					.setParameter("name", search).getResultList();
		} catch (Exception e) {
		}
		return contacts;
	}
}
