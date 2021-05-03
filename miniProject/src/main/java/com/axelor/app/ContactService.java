package com.axelor.app;

import java.util.ArrayList;

import com.axelor.app.db.Contact;

public interface ContactService {

	public void Update(Contact c);
	
	public void Insert(Contact c);

	public void Delete(Integer id);

	public ArrayList<Contact> Search(String name);

	public ArrayList<?> Show();
}
