package com.axelor.app.db;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.axelor.app.db.Address;

@Entity
public class Contact {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int id;

	@NotNull
	@Size(min = 2)
	public String firstName;

	@NotNull
	@Size(min = 2)
	public String lastname;

	@OneToMany(cascade= CascadeType.ALL,orphanRemoval=true)
	@JoinColumn(name="contact_id")
//	@OneToMany(mappedBy = "contact",cascade = CascadeType.ALL)
	private List<Address> addresslist = new ArrayList<>();
	
	public List<Address> getAddress() {
		return addresslist;
	}
	
	public void setAddress(List<Address> addresslist) {
		this.addresslist = addresslist;
	}
	
	@OneToMany(cascade= CascadeType.ALL,orphanRemoval=true)
	@JoinColumn(name="contact_id")
//	@OneToMany(mappedBy = "contact",cascade = CascadeType.ALL)
	private List<Mobile> mobilelist = new ArrayList<>();
	
	public List<Mobile> getMobile() {
		return mobilelist;
	}
	
	public void setMobile(List<Mobile> mobilelist) {
		this.mobilelist = mobilelist;
	}

	
	public Contact() {

	}

	public Contact(String firstName, String lastname) {
		super();
		this.firstName = firstName;
		this.lastname = lastname;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
}