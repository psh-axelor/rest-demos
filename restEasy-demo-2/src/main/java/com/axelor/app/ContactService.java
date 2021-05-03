package com.axelor.app;

import java.io.IOException;
import java.util.ArrayList;

import com.axelor.app.db.Contact;

public interface ContactService {

	public void Insert(Contact c);

	public ArrayList<Contact> fetchData(Integer id);

	public void Update(Integer id, String fisrtname, String lastname, Long mobno, String email);

	public void Delete(Integer id) throws IOException;

	public ArrayList<Contact> Show();

	public ArrayList<Contact> Search(String search);
}
