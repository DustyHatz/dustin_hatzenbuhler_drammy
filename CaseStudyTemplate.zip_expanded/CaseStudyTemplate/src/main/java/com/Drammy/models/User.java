package com.Drammy.models;


import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "user")
public class User {
	
	@Id
	@Column(name = "username", length = 20, nullable = false, unique = true)
	private String username;
	
	@Column(name = "firstName", length = 50, nullable = false)
	private String firstName;
	
	@Column(name = "lastName", length = 50, nullable = false)
	private String lastName;
	
	@Column(name = "password", length = 50, nullable = false)
	private String password;
	
	@OneToMany(
			targetEntity = Whiskey.class,
			cascade = CascadeType.REMOVE,
			fetch = FetchType.EAGER
	)
	@JoinTable(name = "savedWhiskey")
	private List<Whiskey> savedWhiskey;
	
	@OneToMany(
			targetEntity = Whiskey.class,
			cascade = CascadeType.REMOVE,
			fetch = FetchType.LAZY
	)
	@JoinTable(name = "wantedWhiskey")
	private List<Whiskey> wantedWhiskey;


	public User() {
		super();
	}

	public User(String username, String firstName, String lastName, String password) {
		super();
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
	}

	public User(String username, String firstName, String lastName, String password, List<Whiskey> savedWhiskey,
			List<Whiskey> wantedWhiskey) {
		super();
		this.username = username;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.savedWhiskey = savedWhiskey;
		this.wantedWhiskey = wantedWhiskey;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
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


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public List<Whiskey> getSavedWhiskey() {
		return savedWhiskey;
	}


	public void setSavedWhiskey(List<Whiskey> savedWhiskey) {
		this.savedWhiskey = savedWhiskey;
	}


	public List<Whiskey> getWantedWhiskey() {
		return wantedWhiskey;
	}


	public void setWantedWhiskey(List<Whiskey> wantedWhiskey) {
		this.wantedWhiskey = wantedWhiskey;
	}
	
	
	
   
}
