package com.axelor.app.db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
public class Contact {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@NotNull
	@Size(min = 3)
	private String firstName;

	@NotNull
	private String lastName;

	@NotNull
	@Column(unique = true)
	private Long mobno;

	@NotNull
	@Column(unique = true)
	private String email;

	public Contact() {
		// TODO Auto-generated constructor stub
	}

	public Contact(@NotNull @Size(min = 3) String firstName, @NotNull String lastName, @NotNull Long mobno,
			@NotNull String email) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.mobno = mobno;
		this.email = email;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Long getMobno() {
		return mobno;
	}

	public void setMobno(Long mobno) {
		this.mobno = mobno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Contact [Id = " + id + ", FirstName = " + firstName + ", LastName = " + lastName + ", Mobile = " + mobno
				+ ", Email = " + email + "]";
	}
}
