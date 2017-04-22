package com.letsplay24.user;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class User {
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private int Id;
	private String UserName = "";
	private String UserRole = "ROLE_USER";
	
	private boolean Active = true;
	
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public boolean isActive() {
		return Active;
	}
	public void setActive(boolean active) {
		Active = active;
	}
	public String getUserRole() {
		return UserRole;
	}
	public void setUserRole(String userRole) {
		UserRole = userRole;
	}
	private String Email_ID = "";
	private String Password = "";
	
	@Transient
	private String Confirm_Password = "";
	private String Phone_No = "";
	private String Address = "";
	
	@NotEmpty(message="Username cannot be empty")
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	
	@Email(message="Invalid Email Structure")
	@NotEmpty(message="Email ID cannot be empty")
	public String getEmail_ID() {
		return Email_ID;
	}
	
	public void setEmail_ID(String email_ID) {
		Email_ID = email_ID;
	}
	@NotEmpty(message="Password cannot be empty")
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	@NotEmpty(message="Confirm Password cannot be empty")
	public String getConfirm_Password() {
		return Confirm_Password;
	}
	public void setConfirm_Password(String confirm_Password) {
		Confirm_Password = confirm_Password;
	}
	
	@NotEmpty(message="Phone Number Field is Mandatory")
	@Length(max= 10, min=10, message="Phone number is not valid. Should be of 10 Digits")
	public String getPhone_No() {
		return Phone_No;
	}
	public void setPhone_No(String phone_No) {
		Phone_No = phone_No;
	}
	@NotEmpty(message="Address cannot be empty")
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
}
