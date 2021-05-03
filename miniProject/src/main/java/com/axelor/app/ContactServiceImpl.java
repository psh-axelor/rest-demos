package com.axelor.app;

import java.io.IOException;
import java.util.ArrayList;

import javax.inject.Singleton;
import javax.persistence.EntityManager;

import com.axelor.app.db.Contact;
import com.google.inject.Inject;
import com.google.inject.Provider;
import com.google.inject.persist.Transactional;

@Singleton
public class ContactServiceImpl implements ContactService {

	@Inject
	Provider<EntityManager> emp;
	
	@Override
	@Transactional(rollbackOn = IOException.class)
	public void Insert(Contact contact) {
		EntityManager em = emp.get();
		em.persist(contact);
	}

	@Override
	@Transactional(rollbackOn = IOException.class)
	public void Delete(Integer id) {
		EntityManager em = emp.get();
		Contact contact = em.find(Contact.class, id);
		em.remove(contact);
	}
	
	@Override
	@Transactional(rollbackOn = IOException.class)
	public void Update(Contact contact) {
		EntityManager em = emp.get();
		em.merge(contact);
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(rollbackOn = IOException.class)
	public ArrayList<Contact> Search(String name) {
		EntityManager em = emp.get();
		return (ArrayList<Contact>) em
				.createQuery("select c from Contact c where c.lastname=:name or c.firstName=:name")
				.setParameter("name", name)
				.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(rollbackOn = IOException.class)
	public ArrayList<?> Show() {
		EntityManager em = emp.get();
	
		ArrayList<?> cs = (ArrayList<Contact>) em.createQuery("from Contact c inner join c.addresslist a inner join c.mobilelist m")
		.getResultList();
		
		return cs;
	}
}
