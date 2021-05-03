package com.axelor.app;

import javax.persistence.EntityManager;

import com.axelor.app.db.Contact;
import com.google.inject.Inject;
import com.google.inject.persist.Transactional;

public class ContactSericeImpl implements ContactService {

	@Inject
	EntityManager em;

	@Override
	@Transactional
	public void insert(Contact contact) {
		em.persist(contact);
	}
}
